import 'package:flutter/material.dart';
import '../../core/app_animations.dart';
import '../atoms/app_field_label.dart';
import '../atoms/app_select_option.dart';
import '../atoms/app_select_trigger.dart';
import '../atoms/app_surface.dart';

class SelectOption {
  final String id;
  final String name;
  final String? imageUrl;

  const SelectOption({required this.id, required this.name, this.imageUrl});
}

class AppSelectMenu extends StatefulWidget {
  const AppSelectMenu({super.key});

  @override
  State<AppSelectMenu> createState() => _AppSelectMenuState();
}

class _AppSelectMenuState extends State<AppSelectMenu> with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  SelectOption _selected = const SelectOption(
    id: '4',
    name: 'Tom Cook',
  );

  final List<SelectOption> _options = const [
    SelectOption(id: '1', name: 'Wade Cooper'),
    SelectOption(id: '2', name: 'Arlene Mccoy'),
    SelectOption(id: '3', name: 'Devon Webb'),
    SelectOption(id: '4', name: 'Tom Cook'),
    SelectOption(id: '5', name: 'Tanya Fox'),
  ];

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: AppAnimations.normal,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: AppAnimations.defaultCurve,
    ).drive(Tween<double>(begin: AppAnimations.fadeBegin, end: 1.0));
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: AppAnimations.defaultCurve,
    ).drive(Tween<double>(begin: AppAnimations.selectScaleBegin, end: 1.0));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          const AppFieldLabel(label: 'Assigned to'),
          const SizedBox(height: 8),
          
          // Trigger Button
          AppSelectTrigger(
            text: _selected.name, 
            isOpen: _isOpen, 
            onTap: _toggle,
            imageUrl: _selected.imageUrl,
          ),
          
          const SizedBox(height: 4),

          // Options Menu with Advanced Animation
          SizeTransition(
            sizeFactor: _fadeAnimation,
            axisAlignment: -1,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                alignment: Alignment.topCenter,
                child: AppSurface(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 240),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      itemCount: _options.length,
                      itemBuilder: (context, index) {
                        final option = _options[index];
                        final isSelected = option.id == _selected.id;
                        return AppSelectOption(
                          imageUrl: option.imageUrl,
                          name: option.name,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() => _selected = option);
                            _toggle();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
