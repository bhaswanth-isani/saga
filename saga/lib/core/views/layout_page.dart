import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saga/gen/assets.gen.dart';
import 'package:saga/theme/theme.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage(this.navigationShell, {super.key});

  /// The navigation shell.
  final StatefulNavigationShell navigationShell;

  Widget _navigationIcon(
    BuildContext context,
    SvgGenImage Function(bool selected) icon,
    String label, {
    required int tab,
  }) {
    final selected = _isActive(tab);

    return GestureDetector(
      onTap: () => _navigateTo(tab),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon(selected).svg(
            colorFilter: ColorFilter.mode(
              selected ? Prism.colors(context).text.primary : Prism.colors(context).text.secondary,
              BlendMode.srcIn,
            ),
          ),
          Text(
            label,
            style: Prism.text(
              context,
            ).bodySmall.copyWith(color: selected ? null : Prism.colors(context).text.secondary),
          ),
        ],
      ),
    );
  }

  bool _isActive(int tab) {
    return navigationShell.currentIndex == tab;
  }

  void _navigateTo(int tab) {
    navigationShell.goBranch(tab, initialLocation: tab == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Prism.colors(context).surface,
        title: Text(switch (navigationShell.currentIndex) {
          0 => 'Home',
          1 => 'Library',
          2 => 'Explore',
          3 => 'Profile',
          _ => 'Home',
        }, style: GoogleFonts.kanit(fontSize: 22, fontWeight: FontWeight.w500)),
      ),
      body: Column(
        children: [
          const Divider(),
          Expanded(child: navigationShell),
          const Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32) + EdgeInsets.only(top: 8),
            width: double.infinity,
            height: 100,
            color: Prism.colors(context).background,
            child: SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _navigationIcon(
                    context,
                    (selected) => !selected ? Assets.icons.home : Assets.icons.homeSolid,
                    'Home',
                    tab: 0,
                  ),
                  _navigationIcon(
                    context,
                    (selected) => !selected ? Assets.icons.library : Assets.icons.librarySolid,
                    'Library',
                    tab: 1,
                  ),
                  _navigationIcon(
                    context,
                    (selected) => !selected ? Assets.icons.explore : Assets.icons.exploreSolid,
                    'Explore',
                    tab: 2,
                  ),
                  _navigationIcon(
                    context,
                    (selected) => !selected ? Assets.icons.profile : Assets.icons.profileSolid,
                    'Profile',
                    tab: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
