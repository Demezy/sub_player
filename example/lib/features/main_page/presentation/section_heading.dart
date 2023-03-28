part of './main_page.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const SectionHeading({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SeeAllButton(onPressed: onPressed),
      ],
    );
  }
}
