import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saga/auth/viewmodels/sign_in.dart';
import 'package:saga/auth/views/components/primary_button.dart';
import 'package:saga/theme/theme.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[300],
            ),
          ),
          Expanded(
            flex: 2,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Your books, your progress, all in ',
                        children: [
                          TextSpan(
                            text: 'ONE',
                            style: GoogleFonts.kanit(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(text: ' place'),
                        ],
                        style: GoogleFonts.kanit(
                          color: Prism.colors(context).text.primary,
                          fontSize: 32,
                          height: 1.35,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(),
                    Column(
                      spacing: Prism.base.m,
                      children: [
                        CustomPrimaryButton(
                          'Continue with Google',
                          // enabled: !isLoading,
                          onTap: () => ref.read(googleSignInProvider),
                          expanded: true,
                          suffixPrefix: const ButtonSuffixPrefix(prefix: FontAwesomeIcons.google),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
