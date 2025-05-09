import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/type_ofday_selection.dart';
import 'package:cruise_buddy/UI/Screens/payment_steps_screen/select_payment_method.dart';
import 'package:cruise_buddy/UI/Widgets/Button/fullwidth_rectangle_bluebutton.dart';
import 'package:cruise_buddy/UI/Widgets/Button/rectangle_bluebutton_loading.dart';
import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/view_model/bookMyCruise/book_my_cruise_bloc.dart';
import 'package:cruise_buddy/core/view_model/viewMyPackage/view_my_package_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/model/featured_boats_model/featured_boats_model.dart';
import 'package:cruise_buddy/core/model/featured_boats_model/featured_boats_model.dart'
    as featuredBoats;

class BookingconfirmationScreen extends StatefulWidget {
  final String packageId;
  final DatumTest datum;
  final String name;
  final String email;
  const BookingconfirmationScreen({
    super.key,
    required this.packageId,
    required this.datum,
    required this.name,
    required this.email,
  });

  @override
  _BookingconfirmationScreenState createState() =>
      _BookingconfirmationScreenState();
}

class _BookingconfirmationScreenState extends State<BookingconfirmationScreen> {
  late Razorpay _razorpay;
  bool _isLoading = false;
  String bookingTypeId = "1";
  List<String> imageUrls = [];
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print("my user name is ${widget.name}");
      print("my user email is ${widget.email}");
      if (widget.datum.bookingTypes!.length == 1) {
        bookingTypeId = widget.datum.bookingTypes?.first.id.toString() ??
            "1"; // Set the booking type ID directly
      }
      imageUrls = [
        (widget.datum?.cruise?.images?.isNotEmpty == true
                ? widget.datum!.cruise!.images![0].cruiseImg
                : null) ??
            'assets/image/boat_details_img/boat_detail_img.png',
        ...?widget.datum?.images?.map(
          (e) =>
              e.packageImg ??
              'assets/image/boat_details_img/boat_detail_img.png',
        ),
      ];
      BlocProvider.of<ViewMyPackageBloc>(context)
          .add(ViewMyPackageEvent.viewMyPackage(packageId: widget.packageId));
      print("booking typeid ${bookingTypeId}");
    });
  }

  void _onBookingTypeSelected(String bookingTypeId) {
    setState(() {
      bookingTypeId = bookingTypeId; // Store the selected booking type ID
    });
  }

  @override
  void dispose() {
    _razorpay.clear(); // Clean up Razorpay instance
    super.dispose();
  }

  void openCheckout({
    String? orderid,
    required int totalamount,
  }) {
    var options = {
      'key': 'rzp_live_ZAFN8qKXodIxis',
      'amount': (totalamount * 100).toString(),
      'currency': 'INR',
      'name': widget.name,
      'description': 'Cruise' ' ' + 'Payment',
      'order_id': orderid,
      'prefill': {
        'contact': '9949055351',
        'email': widget.email,
      },
      'method': {
        'upi': true,
        'netbanking': false,
        'wallet': false,
      },
      'theme': {'color': '#FFD700'},
      'redirect': true,
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint("-----------Error: $e");
    }
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}/nDescription: ${response.message}/nMetadata: ${response.error.toString()}");
    BlocProvider.of<ViewMyPackageBloc>(context)
        .add(ViewMyPackageEvent.viewMyPackage(packageId: widget.packageId));
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
    BlocProvider.of<ViewMyPackageBloc>(context)
        .add(ViewMyPackageEvent.viewMyPackage(packageId: widget.packageId));
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "Wallet: ${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  String _getCruiseName(int id) {
    switch (id) {
      case 1:
        return "Day Cruise";
      case 2:
        return "Full Day Cruise";
      default:
        return "Unknown";
    }
  }

  int parsePrice(String? priceString) {
    if (priceString == null) return 0;
    return int.tryParse(priceString.split('.').first) ?? 0;
  }

  FocusNode addonFocusnode = FocusNode();
  TextEditingController addoncontroller = TextEditingController();

  int _currentIndex = 0;
  String _selectedCruiseType = 'Day Cruise';
  int _numRooms = 1;
  int _day = 1;
  int _numAdults = 1;
  int _numKids = 0;
  DateTime _selectedDate = DateTime.now();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String _location = "Kottayam";
  int _nonVegCount = 0;
  int _vegCount = 0;
  int _jainVegCount = 0;
  String _addOns = '';

  final double _chargesForTheDay = 7000;
  final double _tax = 600;
  final double _discounts = 0.0;
  final double _others = 0.0;
  TextEditingController _dateController = TextEditingController();
  bool _isEditingBoatDetails = false;
  bool _isEditingPassengers = false;
  bool _isEditingDate = false;

  int maxAdults = 1; // default fallback
  int maxRooms = 1;
  List<featuredBoats.UnavailableDate>? unavailableDates;
  int defaultPrice = 0;
  int totalPrice = 0;
  int pricePerDay = 0;
  int pricePerPerson = 0;
  final List unavaibledates = [];
  @override
  Widget build(BuildContext context) {
    print("sds ${widget.packageId}");
    unavailableDates = widget.datum.unavailableDate ?? [];

    return MultiBlocListener(
      listeners: [
        BlocListener<BookMyCruiseBloc, BookMyCruiseState>(
          listener: (context, state) {
            state.mapOrNull(
              loading: (value) {
                setState(() => _isLoading = true);
              },
              getBookedBoats: (value) {
                setState(() => _isLoading = false);
                print('order id ${value.bookingresponse.booking?.orderId}');

                openCheckout(
                    orderid: value.bookingresponse.booking?.orderId.toString(),
                    totalamount: totalPrice); // Call Razorpay on success
                BlocProvider.of<ViewMyPackageBloc>(context).add(
                    ViewMyPackageEvent.viewMyPackage(
                        packageId: widget.packageId));
              },
              getBookedFailure: (value) {
                setState(() => _isLoading = false);

                CustomToast.showFlushBar(
                  context: context,
                  status: false,
                  title: "Oops",
                  content:
                      "Booking failed, your cruise is not available in this date",
                );

                BlocProvider.of<ViewMyPackageBloc>(context).add(
                    ViewMyPackageEvent.viewMyPackage(
                        packageId: widget.packageId));
              },
              noInternet: (value) {
                setState(() => _isLoading = false);

                CustomToast.showFlushBar(
                  context: context,
                  status: false,
                  title: "Oops",
                  content: "No Internet please try again",
                );
              },
            );
          },
        ),
        BlocListener<ViewMyPackageBloc, ViewMyPackageState>(
          listener: (context, state) {
            state.mapOrNull(
              viewMyPacakge: (value) {
                setState(() {
                  maxRooms = value.mybookingmodel.data?.cruise?.rooms ?? 1;
                  maxAdults =
                      value.mybookingmodel.data?.cruise?.maxCapacity ?? 1;

                  unavailableDates = value.mybookingmodel.unavailableDate ?? [];
                  defaultPrice = parsePrice(
                    value.mybookingmodel?.data?.bookingTypes?[0].defaultPrice
                        .toString(),
                  );

                  pricePerDay = parsePrice(value
                          .mybookingmodel?.data?.bookingTypes?[0].pricePerDay
                          ?.toString() ??
                      '');
                  pricePerPerson = parsePrice(value
                          .mybookingmodel?.data?.bookingTypes?[0].pricePerPerson
                          ?.toString() ??
                      '');
                  print(
                      "defaultprice is ${value.mybookingmodel.data?.bookingTypes?[0].defaultPrice}");
                  totalPrice = defaultPrice + pricePerPerson * 1;
                });
              },
            );
          },
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      itemCount: imageUrls.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final imageUrl = imageUrls[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: imageUrl.startsWith('http')
                                ? Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/image/boat_details_img/boat_detail_img.png',
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  )
                                : Image.asset(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 10,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 125, 125, 125),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${_currentIndex + 1}/${imageUrls.length}',
                        style: TextStyles.ubuntu16whitew2700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableSection(
                      title: 'Boat Details',
                      isEditing: _isEditingBoatDetails,
                      onTap: () => setState(
                          () => _isEditingBoatDetails = !_isEditingBoatDetails),
                      editingWidgets: [
                        // DropdownButtonFormField<String>(
                        //   value: _selectedCruiseType,
                        //   decoration:
                        //       const InputDecoration(labelText: 'Cruise Type'),
                        //   items: <String>[
                        //     'Day Cruise',
                        //     'Full Day Cruise',
                        //   ].map<DropdownMenuItem<String>>((String value) {
                        //     return DropdownMenuItem<String>(
                        //       value: value,
                        //       child: Text(value),
                        //     );
                        //   }).toList(),
                        //   onChanged: (String? newValue) {
                        //     if (newValue != null) {
                        //       setState(() {
                        //         _selectedCruiseType = newValue;
                        //       });
                        //     }
                        //   },
                        // ),
                        _buildNumericInput(
                          'No of Rooms',
                          _numRooms,
                          (value) => setState(
                            () => _numRooms = value,
                          ),
                          max: maxRooms,
                        ),
                        _buildNumericInput('Day', _day,
                            (value) => setState(() => _day = value)),
                      ],
                      displayWidgets: [
                        // _buildDetailRow('Type of Cruise', _selectedCruiseType),
                        _buildDetailRow('No of Rooms', _numRooms.toString()),
                        _buildDetailRow('Day', _day.toString()),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Booking Type',
                      style: TextStyles.ubntu16,
                    ),
                    SizedBox(height: 8),
                    if (widget.datum.bookingTypes!.length == 1)
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          _getCruiseName(
                              widget.datum.bookingTypes!.first.id ?? 0),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      )
                    else if (widget.datum.bookingTypes!.length > 1)
                      BookingTypeSelectorWidget(
                        onTypeSelected: (selectedType) {
                          print("Selected booking type: $selectedType");
                          setState(() {
                            bookingTypeId = selectedType.toString();
                          });
                          _onBookingTypeSelected(
                              selectedType.toString()); // Set the selected type
                        },
                        initialType: int.tryParse(bookingTypeId.toString()) ??
                            1, // Pass the initial value (if any)
                      ),
                    SizedBox(
                      height: 40,
                    ),
                    // Passengers Section
                    _buildEditableSection(
                      title: 'Number of passengers',
                      isEditing: _isEditingPassengers,
                      onTap: () => setState(
                          () => _isEditingPassengers = !_isEditingPassengers),
                      editingWidgets: [
                        _buildNumericInput(
                          'Adults',
                          _numAdults,
                          (value) {
                            setState(() {
                              _numAdults = value;
                              totalPrice = (defaultPrice ?? 0) +
                                  (_numAdults * (pricePerPerson ?? 1));
                            });
                          },
                          max: maxAdults,
                        ),
                        _buildNumericInput(
                          'Kids',
                          _numKids,
                          (value) => setState(
                            () => _numKids = value,
                          ),
                        ),
                      ],
                      displayWidgets: [
                        _buildDetailRowWithIcon('Adults', _numAdults.toString(),
                            'assets/icons/adult.svg'),
                        _buildDetailRowWithIcon('Kids', _numKids.toString(),
                            'assets/icons/kid.svg'),
                      ],
                    ),

                    // Date
                    // Date section
                    // _buildEditableSection(
                    //   unavailable_date: unavailableDates,
                    //   title: 'Date',
                    //   isEditing: _isEditingDate,
                    //   onTap: () =>
                    //       setState(() => _isEditingDate = !_isEditingDate),
                    //   editingWidgets: [
                    //     GestureDetector(
                    //       onTap: () async {
                    //         await showDialog(
                    //           context: context,
                    //           builder: (context) {
                    //             return AlertDialog(
                    //               contentPadding: EdgeInsets.all(12),
                    //               content: Container(
                    //                 width:
                    //                     MediaQuery.of(context).size.width * 0.9,
                    //                 height: 460,
                    //                 child: TableCalendar(
                    //                   firstDay: DateTime(2000),
                    //                   lastDay: DateTime(2101),
                    //                   focusedDay: _selectedDate,
                    //                   selectedDayPredicate: (day) =>
                    //                       isSameDay(_selectedDate, day),
                    //                   onDaySelected: (selectedDay, focusedDay) {
                    //                     bool isUnavailable = unavailableDates
                    //                             ?.any((range) {
                    //                           if (range.startDate == null ||
                    //                               range.endDate == null)
                    //                             return false;

                    //                           return selectedDay.isAfter(
                    //                                   range.startDate!.subtract(
                    //                                       Duration(days: 1))) &&
                    //                               selectedDay.isBefore(range
                    //                                   .endDate!
                    //                                   .add(Duration(days: 1)));
                    //                         }) ??
                    //                         false; // If unavailableDates is null, return false

                    //                     if (isUnavailable) {
                    //                       CustomToast.showFlushBar(
                    //                         context: context,
                    //                         status: false,
                    //                         title: "Oops",
                    //                         content:
                    //                             "This date is not available.",
                    //                       );
                    //                       return;
                    //                     }

                    //                     setState(() {
                    //                       _selectedDate = selectedDay;
                    //                     });
                    //                     Navigator.pop(context);
                    //                   },
                    //                   calendarBuilders: CalendarBuilders(
                    //                     defaultBuilder:
                    //                         (context, day, focusedDay) {
                    //                       bool isUnavailable = unavailableDates
                    //                               ?.any((range) {
                    //                             if (range.startDate == null ||
                    //                                 range.endDate == null)
                    //                               return false;
                    //                             return day.isAfter(range
                    //                                     .startDate!
                    //                                     .subtract(Duration(
                    //                                         days: 1))) &&
                    //                                 day.isBefore(range.endDate!
                    //                                     .add(
                    //                                         Duration(days: 1)));
                    //                           }) ??
                    //                           false; // If unavailableDates is null, return false

                    //                       if (isUnavailable) {
                    //                         return Container(
                    //                           alignment: Alignment.center,
                    //                           decoration: BoxDecoration(
                    //                             color: Colors.red,
                    //                             shape: BoxShape.circle,
                    //                           ),
                    //                           child: Text(
                    //                             '${day.day}',
                    //                             style: TextStyle(
                    //                                 color: Colors.white),
                    //                           ),
                    //                         );
                    //                       }
                    //                       return null;
                    //                     },
                    //                   ),
                    //                   headerStyle: HeaderStyle(
                    //                     formatButtonVisible: true,
                    //                     leftChevronVisible: true,
                    //                     rightChevronVisible: true,
                    //                     titleTextStyle: TextStyle(
                    //                       fontSize: 18,
                    //                       fontWeight: FontWeight.bold,
                    //                     ),
                    //                     formatButtonShowsNext: false,
                    //                   ),
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //         );
                    //       },
                    //       child: Container(
                    //         height: 40,
                    //         width: MediaQuery.of(context).size.width * 0.8,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(36),
                    //           border: Border.all(width: 1),
                    //         ),
                    //         child: Center(
                    //           child: Text(
                    //             DateFormat('dd/MM/yyyy').format(_selectedDate),
                    //             style: TextStyle(
                    //                 fontSize: 16, fontWeight: FontWeight.w500),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    //   displayWidgets: [
                    //     _buildDetailRow(
                    //       'Date',
                    //       DateFormat('dd/MM/yyyy').format(_selectedDate),
                    //     ),
                    //   ],
                    // ),
                    _buildEditableSection(
                      unavailable_date: unavailableDates,
                      title: 'Date',
                      isEditing: _isEditingDate,
                      onTap: () =>
                          setState(() => _isEditingDate = !_isEditingDate),
                      editingWidgets: [
                        GestureDetector(
                          onTap: () async {
                            if (bookingTypeId == "1") {
                              // Single date selection
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.all(12),
                                    content: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height: 460,
                                      child: TableCalendar(
                                        firstDay: DateTime(2000),
                                        lastDay: DateTime(2101),
                                        focusedDay: _selectedDate,
                                        selectedDayPredicate: (day) =>
                                            isSameDay(_selectedDate, day),
                                        onDaySelected:
                                            (selectedDay, focusedDay) {
                                          bool isUnavailable = unavailableDates
                                                  ?.any((range) {
                                                if (range.startDate == null ||
                                                    range.endDate == null)
                                                  return false;

                                                return selectedDay.isAfter(range
                                                        .startDate!
                                                        .subtract(Duration(
                                                            days: 1))) &&
                                                    selectedDay.isBefore(
                                                        range.endDate!.add(
                                                            Duration(days: 1)));
                                              }) ??
                                              false;

                                          if (isUnavailable) {
                                            CustomToast.showFlushBar(
                                              context: context,
                                              status: false,
                                              title: "Oops",
                                              content:
                                                  "This date is not available.",
                                            );
                                            return;
                                          }

                                          setState(() {
                                            _selectedDate = selectedDay;
                                            _dateController.text =
                                                DateFormat('dd/MM/yyyy')
                                                    .format(selectedDay);
                                          });
                                          Navigator.pop(context);
                                        },
                                        calendarBuilders: CalendarBuilders(
                                          defaultBuilder:
                                              (context, day, focusedDay) {
                                            bool isUnavailable =
                                                unavailableDates?.any((range) {
                                                      if (range.startDate ==
                                                              null ||
                                                          range.endDate == null)
                                                        return false;
                                                      return day.isAfter(range
                                                              .startDate!
                                                              .subtract(Duration(
                                                                  days: 1))) &&
                                                          day.isBefore(range
                                                              .endDate!
                                                              .add(Duration(
                                                                  days: 1)));
                                                    }) ??
                                                    false;

                                            if (isUnavailable) {
                                              return Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Text(
                                                  '${day.day}',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              );
                                            }
                                            return null;
                                          },
                                        ),
                                        headerStyle: HeaderStyle(
                                          formatButtonVisible: true,
                                          leftChevronVisible: true,
                                          rightChevronVisible: true,
                                          titleTextStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          formatButtonShowsNext: false,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              // Date range selection
                              final picked = await showDateRangePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                                initialDateRange: DateTimeRange(
                                    start: startDate, end: endDate),
                              );

                              if (picked != null) {
                                setState(() {
                                  startDate = picked.start;
                                  endDate = picked.end;
                                  _dateController.text =
                                      "${DateFormat('dd/MM/yyyy').format(startDate)} - ${DateFormat('dd/MM/yyyy').format(endDate)}";
                                });
                              }
                            }
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              border: Border.all(width: 1),
                            ),
                            child: Center(
                              child: Text(
                                bookingTypeId == "1"
                                    ? DateFormat('dd/MM/yyyy')
                                        .format(_selectedDate)
                                    : "${DateFormat('dd/MM/yyyy').format(startDate)} - ${DateFormat('dd/MM/yyyy').format(endDate)}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                      displayWidgets: [
                        _buildDetailRow(
                          'Date',
                          bookingTypeId == "1"
                              ? DateFormat('dd/MM/yyyy').format(_selectedDate)
                              : "${DateFormat('dd/MM/yyyy').format(startDate)} - ${DateFormat('dd/MM/yyyy').format(endDate)}",
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    SizedBox(height: 16),

                    Text(
                      'Choose your food count',
                      style: TextStyles.ubntu16,
                    ),
                    SizedBox(height: 20),
                    _buildFoodCounter('Non-Veg', _nonVegCount,
                        (value) => setState(() => _nonVegCount = value)),
                    _buildFoodCounter('Veg', _vegCount,
                        (value) => setState(() => _vegCount = value)),
                    _buildFoodCounter('Jain Veg', _jainVegCount,
                        (value) => setState(() => _jainVegCount = value)),

                    // Add ons
                    const SizedBox(height: 25),
                    Text(
                      'Add-ons (optional)',
                      style: TextStyles.ubntu16,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      style: TextStyles.ubuntutextfieldText,
                      controller: addoncontroller,
                      focusNode: addonFocusnode,
                      onChanged: (value) => _addOns = value,
                      decoration: InputDecoration(
                        hintStyle: TextStyles.ubuntuhintText,
                        hintText: 'Eg: Need a mic set',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45)),
                      ),
                    ),

                    const SizedBox(height: 40),
                    // Grand Total Section
                    Text(
                      'Grand Total',
                      style: TextStyles.ubntu16,
                    ),
                    _buildDetailRow('Charges for the trip', '₹${defaultPrice}'),
                    _buildDetailRow('Price Per Person', '₹${pricePerPerson}'),
                    _buildDetailRow(
                        'Discounts', '₹${_discounts.toStringAsFixed(2)}'),
                    _buildDetailRow('Others', '₹${_others.toStringAsFixed(2)}'),
                    _builTotalDetailRow('Total', '₹${totalPrice}',
                        isTotal: true),

                    const SizedBox(height: 40),

                    BlocBuilder<BookMyCruiseBloc, BookMyCruiseState>(
                      builder: (context, state) {
                        return _isLoading
                            ? RectangleBluebuttonLoading()
                            : FullWidthRectangleBlueButton(
                                text: "Continue",
                                onPressed: () {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(_selectedDate);
                                  String formattedstartDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(startDate);
                                  String formattedendDate =
                                      DateFormat('yyyy-MM-dd').format(endDate);

                                  print(
                                      'parms packageId---------------${widget.packageId} ');
                                  print(
                                      'parms formattedDate---------------${formattedDate} ');
                                  print('startdate ${formattedstartDate}');
                                  print('endDate ${formattedendDate}');
                                  print(
                                      'parms bookingTypeId--------------- ${bookingTypeId}');
                                  print(
                                      'parms _nonVegCount--------------- ${_nonVegCount}');
                                  print(
                                      'parms _vegCount--------------- ${_vegCount}');
                                  print(
                                      'parms _jainVegCount--------------- ${_jainVegCount}');
                                  print(
                                      'parms customerNotet--------------- ${addoncontroller.text}');
                                  print(
                                      'parms totalAmount--------------- ${totalPrice.toString()}');
                                  context
                                      .read<BookMyCruiseBloc>()
                                      .add(BookMyCruiseEvent.createNewbookings(
                                        packageId: widget.packageId,
                                        startdate:
                                            bookingTypeId.toString() == "1"
                                                ? formattedDate
                                                : formattedstartDate,
                                        endDate: bookingTypeId.toString() == "2"
                                            ? formattedendDate
                                            : null,
                                        bookingtype: bookingTypeId.toString(),
                                        nonVegCount: _nonVegCount > 0
                                            ? _nonVegCount.toString()
                                            : null,
                                        vegCount: _vegCount > 0
                                            ? _vegCount.toString()
                                            : null,
                                        jainVegCount: _jainVegCount > 0
                                            ? _jainVegCount.toString()
                                            : null,
                                        customerNotet: addoncontroller.text,
                                        totalAmount: totalPrice.toString(),
                                      ));
                                },
                              );
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumericInput(
      String label, int value, ValueChanged<int> onChanged,
      {int? max}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8.0),
          child: Text(
            label,
            style: TextStyles.ubuntu14black55w400,
          ),
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () => onChanged(value > 1 ? value - 1 : 1),
        ),
        Text('$value'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            if (max != null && value >= max) {
              CustomToast.showFlushBar(
                context: context,
                status: false,
                title: "Oops",
                content: 'Maximum $label reached',
              );
            } else {
              onChanged(value + 1);
            }
          },
        ),
      ],
    );
  }

  Widget _buildDetailRowWithIcon(String label, String value, String iconPath) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, height: 20),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8.0),
          child: Text(label, style: TextStyles.ubuntu14black55w400),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyles.ubntu14w400black,
        ),
      ],
    );
  }

//-------------------
  Widget _buildEditableSection({
    List<UnavailableDate>? unavailable_date,
    required String title,
    required bool isEditing,
    required VoidCallback onTap,
    required List<Widget> editingWidgets,
    required List<Widget> displayWidgets,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyles.ubntu16,
            ),
            const Spacer(),
            GestureDetector(
              onTap: onTap,
              child: isEditing
                  ? const Icon(Icons.check)
                  : SvgPicture.asset('assets/icons/Edit_icon.svg'),
            ),
          ],
        ),
        if (isEditing) ...editingWidgets else ...displayWidgets,
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildFoodCounter(
      String label, int count, ValueChanged<int> onChanged) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyles.ubuntu16black15w500,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8.0),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => onChanged(count > 0 ? count - 1 : 0),
                ),
                Text('$count'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => onChanged(count + 1),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8.0),
          child: Text(label, style: TextStyles.ubuntu14black55w400),
        ),
        const Spacer(),
        Text(
          value,
          style: isTotal
              ? const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1F8386))
              : TextStyles.ubntu14w400black,
        ),
      ],
    );
  }

  Widget _builTotalDetailRow(String label, String value,
      {bool isTotal = false}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8.0),
          child: Text(label, style: TextStyles.ubuntu14black55w400),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyles.ubntu15w600black,
        ),
      ],
    );
  }
}
//---------------------git test------------------
//----------------------
