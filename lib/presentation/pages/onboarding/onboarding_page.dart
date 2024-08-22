import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:base_flutter/di/usecase_provider.dart';
import 'package:base_flutter/presentation/components/base_button.dart';
import 'package:base_flutter/presentation/theme/app_them.dart';
import 'package:base_flutter/shared/extensions/build_context_ext.dart';
import 'package:base_flutter/shared/gen/assets.gen.dart';

enum OnboardingPageType {
  page1,
  page2,
  page3,
}

class OnboardingPage extends ConsumerWidget {
  OnboardingPage({super.key});

  final selectedPageProvider = StateProvider<int>((ref) => 0);
  List<OnboardingPageType> pages = OnboardingPageType.values;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPage = ref.watch(selectedPageProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              _buildPageView(ref),
              _buildGetStartedButton(context, ref, selectedPage),
              SizedBox(height: 16.h),
              _buildDotIndicator(context, selectedPage),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageView(WidgetRef ref) {
    return Expanded(
      child: PageView.builder(
        onPageChanged: (index) {
          ref.read(selectedPageProvider.notifier).state = index;
        },
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return _buildPage(context, pages[index]);
        },
      ),
    );
  }

  Widget _buildGetStartedButton(
      BuildContext context, WidgetRef ref, int selectedPage) {
    if (selectedPage == pages.length - 1) {
      return BaseButton(
        title: context.l10n.onboardingGetStarted,
        isEnabled: true,
        action: () => {
          ref.read(completeOnboardingUseCaseProvider).setOnboardingComplete(),
          context.navigator.toLogin()
        },
      );
    } else {
      return Container();
    }
  }

  Widget _buildPage(BuildContext context, OnboardingPageType page) {
    String title = '';
    String description = '';
    SvgPicture? icon;
    switch (page) {
      case OnboardingPageType.page1:
        title = context.l10n.onboardingPage1Title;
        description = context.l10n.onboardingPage1Description;
        icon = Assets.images.onboardingPage1.svg(
          width: 100.w,
          height: 100.w,
        );
        break;
      case OnboardingPageType.page2:
        title = context.l10n.onboardingPage2Title;
        description = context.l10n.onboardingPage2Description;
        icon = Assets.images.onboardingPage2.svg(
          width: 100.w,
          height: 100.w,
        );
        break;
      case OnboardingPageType.page3:
        title = context.l10n.onboardingPage3Title;
        description = context.l10n.onboardingPage3Description;
        icon = Assets.images.onboardingPage3.svg(
          width: 100.w,
          height: 100.w,
        );
        break;
    }

    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 16.h),
          Text(
            title,
            style: context.theme.textTheme.headlineLarge,
          ),
          SizedBox(height: 16.h),
          Text(
            description,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildDotIndicator(BuildContext context, int selectedPage) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pages.length, (index) {
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
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
