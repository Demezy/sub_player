part of '../home_view.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SeeAllButton(onPressed: onPressed),
        ],
      ),
    );
  }
}
