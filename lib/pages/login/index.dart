import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:zulhijaya_task_project/components/alert.dart';
import 'package:zulhijaya_task_project/components/loading.dart';
import 'package:zulhijaya_task_project/components/rounded_passwordfield.dart';
import 'package:zulhijaya_task_project/components/rounded_textfield.dart';
import 'package:zulhijaya_task_project/services/auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Login'),
        ),
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    RoundedTextField(
                      key: const Key('login_email'),
                      name: 'email',
                      label: 'Email',
                      validators: FormBuilderValidators.email(),
                      textInputType: TextInputType.emailAddress,
                    ),
                    const RoundedPasswordField(
                      key: Key('login_password'),
                      name: 'password',
                      label: 'Password',
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      key: const Key('login_button'),
                      onPressed: () async {
                        showLoading(context, 'Logging in...');
                        try {
                          _formKey.currentState?.save();
                          if (_formKey.currentState!.validate()) {
                            await Auth.login(
                              email: _formKey.currentState!.value['email'],
                              password:
                                  _formKey.currentState!.value['password'],
                            );
                            Get.offAllNamed('/');
                          }
                          Get.back();
                        } catch (e) {
                          Get.back();
                          showAlert(context, e.toString());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.login),
                      label: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
