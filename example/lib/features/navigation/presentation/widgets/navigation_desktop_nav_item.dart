part of './navigation_desktop.dart';

class NavigationDesktopItem extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const NavigationDesktopItem({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed ??
            () => showOkAlertDialog(
                  context: context,
                  title: 'Демо приложение',
                  message: 'Этот функционал не поддерживается.',
                ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
