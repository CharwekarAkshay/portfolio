class HeaderLinkModel {
  final String textKey;
  final String text;
  final Function()? onTap;

  HeaderLinkModel({
    this.textKey = '0.0',
    required this.text,
    required this.onTap,
  });
}
