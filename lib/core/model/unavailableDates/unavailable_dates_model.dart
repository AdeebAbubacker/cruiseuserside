// class UnavailableDatesModel {
//   final DateTime? startDate;
//   final DateTime? endDate;

//   UnavailableDatesModel({
//     this.startDate,
//     this.endDate,
//   });

//   factory UnavailableDatesModel.fromJson(Map<String, dynamic> json) {
//     return UnavailableDatesModel(
//       startDate: json['startDate'] != null ? DateTime.tryParse(json['startDate']) : null,
//       endDate: json['endDate'] != null ? DateTime.tryParse(json['endDate']) : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'startDate': startDate?.toIso8601String(),
//       'endDate': endDate?.toIso8601String(),
//     };
//   }
// }
