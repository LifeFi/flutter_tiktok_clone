import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/generated/l10n.dart';
import 'package:flutter_tiktok_clone/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tiktok_clone/constants/gaps.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:flutter_tiktok_clone/features/authentication/username_screen.dart';
import 'package:flutter_tiktok_clone/features/authentication/login_screen.dart';
import 'package:flutter_tiktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
    if (kDebugMode) {
      print(result);
    }
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        /* if (orientation == Orientation.landscape) {
          return const Scaffold(
            body: Center(
              child: Text('Plz rotate ur phone.'),
            ),
          );
        } */
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size40,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gaps.v80,
                  Text(
                    S.of(context).signUpTitle("TikTok", DateTime.now()),
                    style: const TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v20,
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      S.of(context).signUpSubtitle(122),
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    GestureDetector(
                      onTap: () => _onEmailTap(context),
                      child: AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.user),
                        text: S.of(context).emailPasswordButton,
                      ),
                    ),
                    Gaps.v16,
                    AuthButton(
                      icon: const FaIcon(FontAwesomeIcons.apple),
                      text: S.of(context).appleButton,
                    )
                  ],
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onEmailTap(context),
                            child: AuthButton(
                              icon: const FaIcon(FontAwesomeIcons.user),
                              text: S.of(context).emailPasswordButton,
                            ),
                          ),
                        ),
                        Gaps.h16,
                        Expanded(
                          child: AuthButton(
                            icon: const FaIcon(FontAwesomeIcons.apple),
                            text: S.of(context).appleButton,
                          ),
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: isDarkMode(context) ? null : Colors.grey.shade50,
            child: Padding(
              padding: const EdgeInsets.only(
                top: Sizes.size32,
                bottom: Sizes.size64,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).alreadyHaveAnAccount,
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      S.of(context).logIn("female"),
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
