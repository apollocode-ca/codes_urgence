import 'package:beamer/beamer.dart';
import 'package:somum/src/utilities/inherited_widgets/l10n_provider.dart';
import 'package:flutter/material.dart';

class TubNavigationBar extends StatefulWidget {
  final BeamerDelegate delegate;
  const TubNavigationBar({super.key, required this.delegate});

  @override
  State<TubNavigationBar> createState() => _TubNavigationBarState();
}

class _TubNavigationBarState extends State<TubNavigationBar> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.delegate.addListener(onBeamerChange);
  }

  @override
  void dispose() {
    widget.delegate.removeListener(onBeamerChange);
    super.dispose();
  }

  onBeamerChange() {
    final location = (Beamer.of(context).currentBeamLocation.state as BeamState)
        .uri
        .toString();
    setState(() {
      switch (location) {
        case '/tub/home':
          currentIndex = 0;
          break;
        case '/tub/scenes':
          currentIndex = 1;
          break;
        case '/tub/settings':
          currentIndex = 2;
          break;
        case '/tub/change-tub':
          currentIndex = 3;
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      destinations: [
        NavigationDestination(
          selectedIcon: const Icon(Icons.home),
          icon: const Icon(Icons.home_outlined),
          label: L10nProvider.of(context).menu_home,
        ),
        NavigationDestination(
          selectedIcon: const Icon(Icons.lightbulb),
          icon: const Icon(Icons.lightbulb_outline_rounded),
          label: L10nProvider.of(context).menu_scenes,
        ),
        NavigationDestination(
          selectedIcon: const Icon(Icons.settings),
          icon: const Icon(Icons.settings_outlined),
          label: L10nProvider.of(context).menu_settings,
        ),
        NavigationDestination(
          selectedIcon: const Icon(Icons.swap_calls),
          icon: const Icon(Icons.swap_calls_outlined),
          label: L10nProvider.of(context).menu_change_tub,
        ),
      ],
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            widget.delegate.beamToNamed('/tub/home');
            break;
          case 1:
            widget.delegate.beamToNamed('/tub/scenes');
            break;
          case 2:
            widget.delegate.beamToNamed('/tub/settings');
            break;
          case 3:
            Beamer.of(context, root: true).beamToNamed('/dashboard/list');
            break;
          default:
        }
      },
    );
  }
}
