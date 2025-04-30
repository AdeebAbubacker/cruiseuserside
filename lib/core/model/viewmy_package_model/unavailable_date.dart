class UnavailableDate {
	DateTime? startDate;
	DateTime? endDate;

	UnavailableDate({this.startDate, this.endDate});

	factory UnavailableDate.fromJson(Map<String, dynamic> json) {
		return UnavailableDate(
			startDate: json['startDate'] == null
						? null
						: DateTime.parse(json['startDate'] as String),
			endDate: json['endDate'] == null
						? null
						: DateTime.parse(json['endDate'] as String),
		);
	}



	Map<String, dynamic> toJson() => {
				'startDate': startDate?.toIso8601String(),
				'endDate': endDate?.toIso8601String(),
			};
}
