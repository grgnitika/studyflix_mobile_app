// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:studyflix/features/auth/presentation/view/register_view.dart';
// import 'package:studyflix/features/auth/presentation/view_model/login/login_bloc.dart';

// class LoginView extends StatelessWidget {
//   LoginView({super.key});

//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController(text: '');
//   final _passwordController = TextEditingController(text: '');

//   final _gap = const SizedBox(height: 8);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Column(
//                   children: [
//                     const Text(
//                       'Login',
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontFamily: 'Brand Bold',
//                       ),
//                     ),
//                     _gap,
//                     TextFormField(
//                       key: const ValueKey('email'),
//                       controller: _emailController,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Email',
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         return null;
//                       },
//                     ),
//                     _gap,
//                     TextFormField(
//                       key: const ValueKey('password'),
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         labelText: 'Password',
//                       ),
//                       validator: ((value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         return null;
//                       }),
//                     ),
//                     _gap,
//                     ElevatedButton(
//                       onPressed: () async {
//                         if (_formKey.currentState!.validate()) {
//                           context.read<LoginBloc>().add(
//                                 LoginUserEvent(
//                                   context: context,
//                                   email: _emailController.text,
//                                   password: _passwordController.text,
//                                 ),
//                               );

//                           //   if (_usernameController.text == 'kiran' &&
//                           //       _passwordController.text == 'kiran123') {
//                           //     context.read<LoginBloc>().add(
//                           //           NavigateHomeScreenEvent(
//                           //             destination: HomeView(),
//                           //             context: context,
//                           //           ),
//                           //         );
//                           //   } else {
//                           //     showMySnackBar(
//                           //       context: context,
//                           //       message: 'Invalid username or password',
//                           //       color: Colors.red,
//                           //     );
//                           //   }
//                         }
//                       },
//                       child: const SizedBox(
//                         height: 50,
//                         child: Center(
//                           child: Text(
//                             'Login',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: 'Brand Bold',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     ElevatedButton(
//                       key: const ValueKey('registerButton'),
//                       onPressed: () {
//                         context.read<LoginBloc>().add(
//                               NavigateRegisterScreenEvent(
//                                 destination: const RegisterView(),
//                                 context: context,
//                               ),
//                             );
//                       },
//                       child: const SizedBox(
//                         height: 50,
//                         child: Center(
//                           child: Text(
//                             'Register',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: 'Brand Bold',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyflix/features/auth/presentation/view/register_view.dart';
import 'package:studyflix/features/auth/presentation/view_model/login/login_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  final _gap = const SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Brand Bold',
                      ),
                    ),
                    _gap,
                    TextFormField(
                      key: const ValueKey('email'),
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      }),
                    ),
                    _gap,
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Dispatch LoginUserEvent to log the user in
                          context.read<LoginBloc>().add(
                                LoginUserEvent(
                                  context: context,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      key: const ValueKey('registerButton'),
                      onPressed: () {
                        context.read<LoginBloc>().add(
                              NavigateRegisterScreenEvent(
                                destination: const RegisterView(),
                                context: context,
                              ),
                            );
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                            ),
                          ),
                        ),
                      ),
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
