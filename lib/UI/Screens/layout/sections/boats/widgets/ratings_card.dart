import 'package:cruise_buddy/core/view_model/postRatings/post_ratings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingModal extends StatefulWidget {
  final String cruiseId;

  const RatingModal({super.key, required this.cruiseId});

  @override
  State<RatingModal> createState() => _RatingModalState();
}

class _RatingModalState extends State<RatingModal>
    with SingleTickerProviderStateMixin {
  double _rating = 0.0;
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  // ✅ Custom Top Snackbar using Overlay
  void _showTopSnackBar(BuildContext context, String message,
      {Color backgroundColor = Colors.blue}) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 65,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 300),
            offset: const Offset(0, -1),
            curve: Curves.easeOut,
            child: TweenAnimationBuilder<Offset>(
              tween: Tween(begin: const Offset(0, -1), end: Offset.zero),
              duration: const Duration(milliseconds: 300),
              builder: (context, offset, child) => Transform.translate(
                offset: Offset(0, offset.dy * 50),
                child: child,
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Insert snackbar overlay
    overlay.insert(overlayEntry);

    // Auto-remove after 2 seconds
    Future.delayed(const Duration(seconds: 2)).then((_) {
      overlayEntry.remove();
    });
  }

  // ✅ Submit logic
  void _handleSubmit(BuildContext context) {
    final feedback = _controller.text.trim();

    if (_rating == 0) {
      _showTopSnackBar(context, "Please select a rating before submitting.",
          backgroundColor: Colors.red);
      return;
    }

    if (feedback.isNotEmpty && feedback.length < 10) {
      _showTopSnackBar(context, "Feedback must be at least 10 characters long.",
          backgroundColor: Colors.red);
      return;
    }

    context.read<PostRatingsBloc>().add(PostRatingsEvent.postRatings(
          cruiseId: widget.cruiseId,
          ratings: _rating.toInt().toString(),
          description: feedback,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostRatingsBloc, PostRatingsState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            setState(() => _isLoading = true);
            _showTopSnackBar(context, "Submitting your rating...",
                backgroundColor: Colors.orange);
          },
          registrationSuccess: (ratingResponse) {
            setState(() => _isLoading = false);
            Navigator.pop(context);
            _showTopSnackBar(context, "Thank you for your feedback!",
                backgroundColor: Colors.green);
          },
          noInternet: () {
            setState(() => _isLoading = false);
            _showTopSnackBar(context, "No internet connection.",
                backgroundColor: Colors.red);
          },
          registrationFailure: (error) {
            setState(() => _isLoading = false);
            _showTopSnackBar(context, "Error: $error",
                backgroundColor: Colors.red);
          },
          orElse: () {
            setState(() => _isLoading = false);
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Text(
              "Rate Your Experience",
              style: GoogleFonts.ubuntu(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() => _rating = rating);
                },
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Share your feedback (optional)...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 45),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _isLoading ? null : () => _handleSubmit(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _isLoading ? Colors.grey : Colors.blue, // disable color
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        "Submit",
                        style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
                      ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 55),
          ],
        ),
      ),
    );
  }
}
