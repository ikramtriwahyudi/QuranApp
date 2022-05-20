import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    Key? key,
    required this.name,
    this.label,
    this.validators,
    this.textInputType = TextInputType.text,
    this.initialValue,
  }) : super(key: key);
  final String? initialValue;
  final String name;
  final String? label;
  final Function? validators;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label != null
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  label!,
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
              initialValue: initialValue ?? '',
              name: name,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
              ),
              keyboardType: textInputType,
              validator: validators != null
                  ? FormBuilderValidators.email()
                  : (value) => null),
        ),
      ],
    );
  }
}
