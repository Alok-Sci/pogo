import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/router/app_routes.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/features/auth/view/widgets/divider_or_widget.dart';
import 'package:pogo/features/auth/view/widgets/social_login_button.dart';
import 'package:pogo/shared/widgets/app_icon.dart';
import 'package:pogo/shared/widgets/blur_circle_widget.dart';
import 'package:pogo/shared/widgets/form_header.dart';
import 'package:pogo/shared/widgets/primary_button.dart';
import 'package:pogo/shared/widgets/text_form_field_with_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _phoneController;
  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.black,
      body: SingleChildScrollView(
        child: Column(
          children: [_PageHeader(), _LoginForm(controller: _phoneController)],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    required controller,
  }) : _phoneController = controller;

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.warmOffWhite,
        borderRadius: AppRadii.m.topCircular,
      ),
      padding: EdgeInsets.all(AppSpacing.xxlMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeader(
            title: "Login or sign up using your mobile number",
            subtitle:
                "We’ll send you a one-time password (OTP) to verify your number.",
          ),
          AppSpacing.huge.vGap,
          _PhoneTextField(controller: _phoneController),
          AppSpacing.xxxl.vGap,
          DividerOrWidget(),
          AppSpacing.xxxl.vGap,
          SocialLoginButton(
            onPressed: () {},
          ),
          AppSpacing.huge.vGap,
          _LoginButton(),
          AppSpacing.lg.vGap,
          _FooterText()
        ],
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: context.sh * .3,
        maxHeight: context.sh * .49,
      ),
      color: Palette.black,
      padding: const EdgeInsets.all(AppSpacing.xxl),
      child: Stack(
        children: [
          Center(
            child: BlurCircleWidget(radius: 299.0),
          ),
          Center(
            child: AppIcon(
              AppIcons.logo,
              size: 128,
            ),
          ),
          Positioned.fill(
            bottom: AppSpacing.xxlMd,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "One app for healthy food delivery and expert health consultations!",
                style: context.textTheme.displaySmall
                    ?.copyWith(color: Palette.warmOffWhite),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PhoneTextField extends StatelessWidget {
  const _PhoneTextField({
    required TextEditingController controller,
  }) : _phoneController = controller;

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWithTitle(
      controller: _phoneController,
      title: "Verify via mobile number",
      hintText: "e.g. 9876543210",
      prefixText: "+91  |  ",
      keyboardType: TextInputType.number,
    );
  }
}

class _FooterText extends StatelessWidget {
  const _FooterText();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "By tapping, I agree the ",
            style: context.textTheme.bodySmall,
          ),
          TextSpan(
            text: "Terms of Service & Privacy Policy",
            style: context.textTheme.labelMedium?.copyWith(
              decoration: TextDecoration.underline,
              decorationThickness: 0.3,
            ),
          )
        ]),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: PrimaryButton.dark(
        "Login",
        onPressed: () {
          context.go(AppRoutes.home);
        },
      ),
    );
  }
}
