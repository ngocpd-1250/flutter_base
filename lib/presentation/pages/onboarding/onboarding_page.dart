import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:base_flutter/presentation/components/base_button.dart';
import 'package:base_flutter/presentation/router/app_navigator.dart';
import 'package:base_flutter/presentation/theme/app_them.dart';
import 'package:base_flutter/shared/build_context_ext.dart';
import 'package:base_flutter/shared/gen/assets.gen.dart';

enum OnboardingPageType {
  page1,
  page2,
  page3,
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int selectedPage = 0;
  List<OnboardingPageType> pages = OnboardingPageType.values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.backgroundPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildPageView(),
              if (selectedPage == pages.length - 1)
                _buildGetStartedButton(context),
              const SizedBox(height: 16.0),
              buildDotIndicator(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return buildPage(context, pages[index]);
        },
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    if (selectedPage == pages.length - 1) {
      return BaseButton(
        title: context.l10n.onboardingGetStarted,
        isEnabled: true,
        action: () => context.navigator.toLogin(),
      );
    } else {
      return Container();
    }
  }

  Widget buildPage(BuildContext context, OnboardingPageType page) {
    String title = '';
    String description = '';
    SvgPicture? icon;
    switch (page) {
      case OnboardingPageType.page1:
        title = context.l10n.onboardingPage1Title;
        description = context.l10n.onboardingPage1Description;
        icon = Assets.images.onboardingPage1.svg(
          width: 100,
          height: 100,
        );
        break;
      case OnboardingPageType.page2:
        title = context.l10n.onboardingPage2Title;
        description = context.l10n.onboardingPage2Description;
        icon = Assets.images.onboardingPage2.svg(
          width: 100,
          height: 100,
        );
        break;
      case OnboardingPageType.page3:
        title = context.l10n.onboardingPage3Title;
        description = context.l10n.onboardingPage3Description;
        icon = Assets.images.onboardingPage3.svg(
          width: 100,
          height: 100,
        );
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 16.0),
          Text(
            title,
            style: context.theme.textTheme.headlineLarge,
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

  Widget buildDotIndicator(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pages.length, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == selectedPage
                      ? context.theme.appColors.primary
                      : Colors.grey,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
