import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool isMultiline;
  final int maxLines;
  final TextInputType inputType;
  final Color color;
  final BorderRadius borderRadius;
  final bool isReadOnly;

  const CommonTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.isPassword = false,
    this.isMultiline = false,
    this.maxLines = 1,
    this.inputType = TextInputType.text,
    this.color = AppColors.primaryColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.isReadOnly = false,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late FocusNode _focusNode;
  bool _obscureText = false;
  String? _errorText;
  bool _hasInteracted = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) _hasInteracted = true;
      setState(() {});
    });

    widget.controller.addListener(_handleTextChange);
    _obscureText = widget.isPassword;
  }

  void _handleTextChange() {
    if (!_hasInteracted && _errorText == null) return;

    if (widget.validator != null) {
      final error = widget.validator!(widget.controller.text);
      if (error != _errorText) {
        setState(() {
          _errorText = error;
        });
      }
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller.removeListener(_handleTextChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isFocused = _focusNode.hasFocus;
    final Color activeColor = widget.color ?? AppColors.primaryColor;
    final Color errorColor = AppColors.red;
    final Color textColor = AppColors.white;

    final bool hasError = _errorText != null && _errorText!.isNotEmpty;

    final Color borderColor = hasError ? errorColor : activeColor;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        obscureText: _obscureText,
        keyboardType:
            widget.isMultiline ? TextInputType.multiline : widget.inputType,
        maxLines: widget.isMultiline ? widget.maxLines : 1,
        style: TextStyle(color: textColor, fontSize: 15),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) {
          _hasInteracted = true;
          _errorText = widget.validator?.call(value);
          return _errorText;
        },
        readOnly: widget.isReadOnly ?? false,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            color: isFocused || widget.controller.text.isNotEmpty
                ? (hasError ? errorColor : activeColor)
                : Colors.white70,
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: borderColor, width: 0.8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: borderColor, width: 0.8),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: errorColor, width: 0.8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: errorColor, width: 0.8),
          ),
          // ✅ Show/hide error text dynamically
          errorText: hasError ? _errorText : null,
          errorStyle: TextStyle(color: errorColor, fontWeight: FontWeight.w500),
          isDense: true,
          errorMaxLines: 3,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white70,
                  ),
                  onPressed: () => setState(() {
                    _obscureText = !_obscureText;
                  }),
                )
              : null,
          filled: true,
          fillColor: const Color(0xFF121212),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 15,
          ),
        ),
      ),
    );
  }
}

class CommonRedTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Image? prfixIcon;
  final Image? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final bool isMultiline;
  final int maxLines;
  final TextInputType inputType;
  final Color color;
  final BorderRadius borderRadius;
  final bool isReadOnly;

  const CommonRedTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.isPassword = false,
    this.prfixIcon,
    this.suffixIcon,
    required this.onSuffixIconTap,
    this.isMultiline = false,
    this.maxLines = 1,
    this.inputType = TextInputType.text,
    this.color = AppColors.lightRed,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
    this.isReadOnly = false,
  });

  @override
  State<CommonRedTextField> createState() => _CommonRedTextFieldState();
}

class _CommonRedTextFieldState extends State<CommonRedTextField> {
  late FocusNode _focusNode;
  bool _obscureText = false;
  String? _errorText;
  bool _hasInteracted = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) _hasInteracted = true;
      setState(() {});
    });

    widget.controller.addListener(_handleTextChange);
    _obscureText = widget.isPassword;
  }

  void _handleTextChange() {
    if (!_hasInteracted && _errorText == null) return;

    if (widget.validator != null) {
      final error = widget.validator!(widget.controller.text);
      if (error != _errorText) {
        setState(() {
          _errorText = error;
        });
      }
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller.removeListener(_handleTextChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isFocused = _focusNode.hasFocus;
    final Color activeColor = widget.color ?? AppColors.lightRed;
    final Color errorColor = AppColors.red;
    final Color textColor = AppColors.white;

    final bool hasError = _errorText != null && _errorText!.isNotEmpty;

    final Color borderColor = hasError ? errorColor : activeColor;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        obscureText: _obscureText,
        keyboardType:
            widget.isMultiline ? TextInputType.multiline : widget.inputType,
        maxLines: widget.isMultiline ? widget.maxLines : 1,
        style: TextStyle(color: textColor, fontSize: 15),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) {
          _hasInteracted = true;
          _errorText = widget.validator?.call(value);
          return _errorText;
        },
        readOnly: widget.isReadOnly ?? false,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            color: isFocused || widget.controller.text.isNotEmpty
                ? (hasError ? errorColor : activeColor)
                : Colors.white70,
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: borderColor, width: 0.8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: borderColor, width: 0.8),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: errorColor, width: 0.8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: errorColor, width: 0.8),
          ),

          errorText: hasError ? _errorText : null,
          errorStyle: TextStyle(color: errorColor, fontWeight: FontWeight.w500),
          errorMaxLines: 3,
          isDense: true,
          prefixIcon: widget.prfixIcon != null
              ? Padding(
                padding:  EdgeInsets.only(left: 15.w),
                child: Container(
                  padding: EdgeInsets.all(5),
                     height: 10.h,
                    width: 10.w,
                    child: widget.prfixIcon,
                  ),
              )
              : null,

          // ✅ Suffix icon support (password toggle OR normal suffix image)
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white70,
                  ),
                  onPressed: () => setState(() {
                    _obscureText = !_obscureText;
                  }),
                )
              : (widget.suffixIcon != null
                  ? GestureDetector(
                      onTap: widget.onSuffixIconTap,
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Container(
                           padding: EdgeInsets.all(5),
                          height: 10.h,
                          width: 10.w,
                          child: widget.suffixIcon,
                        ),
                      ),
                    )
                  : null),

          filled: true,
          fillColor: const Color(0xFF121212),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 15,
          ),
        ),
      ),
    );
  }
}
