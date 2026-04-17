import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimensions.dart';
import '../../core/app_typography.dart';
import '../../core/app_animations.dart';
import '../atoms/app_surface.dart';

class SelectOption {
  final String id;
  final String name;
  final String imageUrl;

  const SelectOption({required this.id, required this.name, required this.imageUrl});
}

class SelectmenusClone extends StatefulWidget {
  const SelectmenusClone({super.key});

  @override
  State<SelectmenusClone> createState() => _SelectmenusCloneState();
}

class _SelectmenusCloneState extends State<SelectmenusClone> with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  SelectOption _selected = const SelectOption(
    id: '4', 
    name: 'Tom Cook', 
    imageUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'
  );

  final List<SelectOption> _options = const [
    SelectOption(id: '1', name: 'Wade Cooper', imageUrl: 'https://images.unsplash.com/photo-1491528323818-fdd1faba62cc?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'),
    SelectOption(id: '2', name: 'Arlene Mccoy', imageUrl: 'https://images.unsplash.com/photo-1550525811-e5869dd03032?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'),
    SelectOption(id: '3', name: 'Devon Webb', imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2.25&w=256&h=256&q=80'),
    SelectOption(id: '4', name: 'Tom Cook', imageUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'),
    SelectOption(id: '5', name: 'Tanya Fox', imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'),
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
    ).drive(Tween<double>(begin: 0.0, end: 1.0));
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: AppAnimations.defaultCurve,
    ).drive(Tween<double>(begin: 0.98, end: 1.0));
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            'Assigned to',
            style: AppTypography.labelMedium.copyWith(
              color: isDark ? Colors.white : AppColors.gray900,
            ),
          ),
          const SizedBox(height: 8),
          
          // Trigger Button
          Material(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            child: InkWell(
              onTap: _toggle,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              splashColor: AppAnimations.splashColor(context),
              splashFactory: AppAnimations.splashFactory,
              highlightColor: Colors.transparent,
              child: AnimatedContainer(
                duration: AppAnimations.fast,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _isOpen ? AppColors.gray400 : colorScheme.outline,
                    width: _isOpen ? 1.5 : 1,
                  ),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: NetworkImage(_selected.imageUrl),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _selected.name,
                        style: AppTypography.bodySmall.copyWith(
                          color: isDark ? Colors.white : AppColors.gray900,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      turns: _isOpen ? 0.5 : 0,
                      duration: AppAnimations.fast,
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: AppColors.gray400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                        return _buildOptionItem(option, isSelected, isDark);
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

  Widget _buildOptionItem(SelectOption option, bool isSelected, bool isDark) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() => _selected = option);
          _toggle();
        },
        splashColor: AppAnimations.splashColor(context),
        splashFactory: AppAnimations.splashFactory,
        highlightColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(option.imageUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  option.name,
                  style: AppTypography.bodySmall.copyWith(
                    color: isDark ? Colors.white : AppColors.gray900,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check,
                  size: 20,
                  color: AppColors.pointOrange,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
