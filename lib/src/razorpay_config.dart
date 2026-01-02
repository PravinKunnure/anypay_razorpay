class RazorpayConfig {
  final String key;
  final String name;
  final String? description;
  final String? image;
  final Map<String, dynamic>? prefill;
  final Map<String, dynamic>? notes;

  const RazorpayConfig({
    required this.key,
    required this.name,
    this.description,
    this.image,
    this.prefill,
    this.notes,
  });
}
