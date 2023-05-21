import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../global/colors.dart';
import '../../../../global/controllers/theme_controller.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomNavigationBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = context.watch();
    final darkMode = themeController.darkMode;
    return Container(
      color: darkMode ? AppColors.backgroundDark : AppColors.backgroundLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => widget.onItemSelected(0),
              child: Container(
                color: widget.selectedIndex == 0
                    ? darkMode
                        ? Colors.red
                        : Colors.blue
                    : Colors.transparent,
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.home,
                  color: darkMode ? AppColors.textDark : AppColors.textLight,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => widget.onItemSelected(1),
              child: Container(
                color: widget.selectedIndex == 1
                    ? darkMode
                        ? Colors.red
                        : Colors.blue
                    : Colors.transparent,
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.sports_kabaddi,
                  color: darkMode ? AppColors.textDark : AppColors.textLight,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => widget.onItemSelected(2),
              child: Container(
                color: widget.selectedIndex == 2
                    ? darkMode
                        ? Colors.red
                        : Colors.blue
                    : Colors.transparent,
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.group,
                  color: darkMode ? AppColors.textDark : AppColors.textLight,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => widget.onItemSelected(3),
              child: Container(
                color: widget.selectedIndex == 3
                    ? darkMode
                        ? Colors.red
                        : Colors.blue
                    : Colors.transparent,
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.settings,
                  color: darkMode ? AppColors.textDark : AppColors.textLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
