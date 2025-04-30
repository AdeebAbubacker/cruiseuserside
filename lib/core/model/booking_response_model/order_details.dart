class OrderDetails {
  int? amount;
  int? amountDue;
  int? amountPaid;
  int? attempts;
  int? createdAt;
  String? currency;
  String? entity;
  String? id;
  List<dynamic>? notes;
  dynamic offerId;
  String? receipt;
  String? status;

  OrderDetails({
    this.amount,
    this.amountDue,
    this.amountPaid,
    this.attempts,
    this.createdAt,
    this.currency,
    this.entity,
    this.id,
    this.notes,
    this.offerId,
    this.receipt,
    this.status,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        amount: json['amount'] as int?,
        amountDue: json['amount_due'] as int?,
        amountPaid: json['amount_paid'] as int?,
        attempts: json['attempts'] as int?,
        createdAt: json['created_at'] as int?,
        currency: json['currency'] as String?,
        entity: json['entity'] as String?,
        id: json['id'] as String?,
        notes: json['notes'] as List<dynamic>?,
        offerId: json['offer_id'] as dynamic,
        receipt: json['receipt'] as String?,
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'amount_due': amountDue,
        'amount_paid': amountPaid,
        'attempts': attempts,
        'created_at': createdAt,
        'currency': currency,
        'entity': entity,
        'id': id,
        'notes': notes,
        'offer_id': offerId,
        'receipt': receipt,
        'status': status,
      };
}
