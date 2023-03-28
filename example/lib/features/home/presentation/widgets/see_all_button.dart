part of '../home_view.dart';

class SeeAllButton extends StatelessWidget {
  final void Function() onPressed;

  const SeeAllButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'Все >',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
