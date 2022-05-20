import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RoundedPasswordField extends StatefulWidget {
  const RoundedPasswordField({
    Key? key,
    required this.name,
    this.label,
  }) : super(key: key);
  final String name;
  final String? label;

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.label != null
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  widget.label!,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              )
            : Container(),
        Material(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: FormBuilderTextField(
            name: widget.name,
            style: Theme.of(context).textTheme.bodyText1,
            obscureText: _obscureText,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              suffixIcon: GestureDetector(
                onTap: () => setState(() => _obscureText = !_obscureText),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
