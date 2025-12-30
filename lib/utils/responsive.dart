import 'package:flutter/material.dart';

class Responsive {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Responsive padding
  static EdgeInsets getPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 20);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 30);
    } else {
      return const EdgeInsets.symmetric(horizontal: 50, vertical: 40);
    }
  }

  // Responsive font sizes - International Standards
  static double getTitleSize(BuildContext context) {
    if (isMobile(context)) {
      return 28; // Mobile: 28px
    } else if (isTablet(context)) {
      return 32; // Tablet: 32px
    } else {
      return 36; // Desktop: 36px
    }
  }

  static double getSubtitleSize(BuildContext context) {
    if (isMobile(context)) {
      return 18; // Mobile: 18px
    } else if (isTablet(context)) {
      return 20; // Tablet: 20px
    } else {
      return 22; // Desktop: 22px
    }
  }

  static double getBodySize(BuildContext context) {
    if (isMobile(context)) {
      return 15; // Mobile: 15px (0.9375rem) - slightly larger for mobile readability
    } else if (isTablet(context)) {
      return 16; // Tablet: 16px (1rem) - standard base size
    } else {
      return 17; // Desktop: 17px (1.0625rem) - optimal for desktop reading
    }
  }

  static double getSmallSize(BuildContext context) {
    if (isMobile(context)) {
      return 13; // Mobile: 13px
    } else if (isTablet(context)) {
      return 14; // Tablet: 14px
    } else {
      return 14; // Desktop: 14px
    }
  }

  static double getCardTitleSize(BuildContext context) {
    if (isMobile(context)) {
      return 18; // Mobile: 18px
    } else if (isTablet(context)) {
      return 20; // Tablet: 20px
    } else {
      return 22; // Desktop: 22px
    }
  }

  // Responsive spacing
  static double getSectionSpacing(BuildContext context) {
    if (isMobile(context)) {
      return 40;
    } else if (isTablet(context)) {
      return 60;
    } else {
      return 80;
    }
  }

  // Responsive drawer width
  static double getDrawerWidth(BuildContext context) {
    if (isMobile(context)) {
      return 280;
    } else if (isTablet(context)) {
      return 250;
    } else {
      return 280;
    }
  }

  // Responsive card padding
  static EdgeInsets getCardPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(12);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(16);
    } else {
      return const EdgeInsets.all(20);
    }
  }

  // Responsive spacing helpers
  static double getSmallSpacing(BuildContext context) {
    if (isMobile(context)) {
      return 8;
    } else if (isTablet(context)) {
      return 12;
    } else {
      return 16;
    }
  }

  static double getMediumSpacing(BuildContext context) {
    if (isMobile(context)) {
      return 16;
    } else if (isTablet(context)) {
      return 20;
    } else {
      return 24;
    }
  }

  static double getSectionPadding(BuildContext context) {
    if (isMobile(context)) {
      return 20;
    } else if (isTablet(context)) {
      return 30;
    } else {
      return 40;
    }
  }

  // Responsive icon size
  static double getIconSize(BuildContext context) {
    if (isMobile(context)) {
      return 16;
    } else if (isTablet(context)) {
      return 18;
    } else {
      return 20;
    }
  }

  // Responsive dialog padding
  static EdgeInsets getDialogPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(16);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(20);
    } else {
      return const EdgeInsets.all(24);
    }
  }

  // Responsive chip padding
  static EdgeInsets getChipPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(8);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(10);
    } else {
      return const EdgeInsets.all(12);
    }
  }

  // Responsive button padding
  static double getButtonPadding(BuildContext context) {
    if (isMobile(context)) {
      return 12;
    } else if (isTablet(context)) {
      return 14;
    } else {
      return 16;
    }
  }
}

