import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5d5f5d),
      surfaceTint: Color(0xff5d5f5d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfffafaf8),
      onPrimaryContainer: Color(0xff727372),
      secondary: Color(0xff615e5a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe7e2dd),
      onSecondaryContainer: Color(0xff676460),
      tertiary: Color(0xffa73400),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd04406),
      onTertiaryContainer: Color(0xfffffbff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff444749),
      outline: Color(0xff757779),
      outlineVariant: Color(0xffc5c7c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffc6c7c5),
      primaryFixed: Color(0xffe2e3e1),
      onPrimaryFixed: Color(0xff1a1c1b),
      primaryFixedDim: Color(0xffc6c7c5),
      onPrimaryFixedVariant: Color(0xff454746),
      secondaryFixed: Color(0xffe7e2dd),
      onSecondaryFixed: Color(0xff1d1b19),
      secondaryFixedDim: Color(0xffcac6c1),
      onSecondaryFixedVariant: Color(0xff494643),
      tertiaryFixed: Color(0xffffdbd0),
      onTertiaryFixed: Color(0xff390c00),
      tertiaryFixedDim: Color(0xffffb59d),
      onTertiaryFixedVariant: Color(0xff832600),
      surfaceDim: Color(0xffddd9d8),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff353735),
      surfaceTint: Color(0xff5d5f5d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6c6d6c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff383633),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6f6d69),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff671c00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc53e00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff111111),
      onSurfaceVariant: Color(0xff333738),
      outline: Color(0xff505354),
      outlineVariant: Color(0xff6b6d6f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffc6c7c5),
      primaryFixed: Color(0xff6c6d6c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff535554),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6f6d69),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff575451),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffc53e00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff9b2f00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c6c5),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xffebe7e7),
      surfaceContainerHigh: Color(0xffe0dcdb),
      surfaceContainerHighest: Color(0xffd4d1d0),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2b2d2c),
      surfaceTint: Color(0xff5d5f5d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff484948),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2e2c29),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4b4945),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff551600),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff872800),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff292d2e),
      outlineVariant: Color(0xff474a4b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffc6c7c5),
      primaryFixed: Color(0xff484948),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff313332),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4b4945),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff34322f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff872800),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff601a00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb8b7),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f0ef),
      surfaceContainer: Color(0xffe5e2e1),
      surfaceContainerHigh: Color(0xffd7d4d3),
      surfaceContainerHighest: Color(0xffc9c6c5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffc6c7c5),
      onPrimary: Color(0xff2f3130),
      primaryContainer: Color(0xffe2e3e1),
      onPrimaryContainer: Color(0xff636563),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff32302d),
      secondaryContainer: Color(0xffe7e2dd),
      onSecondaryContainer: Color(0xff676460),
      tertiary: Color(0xffffb59d),
      onTertiary: Color(0xff5d1900),
      tertiaryContainer: Color(0xfff75f26),
      onTertiaryContainer: Color(0xff270600),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc5c7c8),
      outline: Color(0xff8e9193),
      outlineVariant: Color(0xff444749),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff5d5f5d),
      primaryFixed: Color(0xffe2e3e1),
      onPrimaryFixed: Color(0xff1a1c1b),
      primaryFixedDim: Color(0xffc6c7c5),
      onPrimaryFixedVariant: Color(0xff454746),
      secondaryFixed: Color(0xffe7e2dd),
      onSecondaryFixed: Color(0xff1d1b19),
      secondaryFixedDim: Color(0xffcac6c1),
      onSecondaryFixedVariant: Color(0xff494643),
      tertiaryFixed: Color(0xffffdbd0),
      onTertiaryFixed: Color(0xff390c00),
      tertiaryFixedDim: Color(0xffffb59d),
      onTertiaryFixedVariant: Color(0xff832600),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2b2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffc6c7c5),
      onPrimary: Color(0xff2f3130),
      primaryContainer: Color(0xffe2e3e1),
      onPrimaryContainer: Color(0xff464847),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff32302d),
      secondaryContainer: Color(0xffe7e2dd),
      onSecondaryContainer: Color(0xff4a4844),
      tertiary: Color(0xffffd3c5),
      onTertiary: Color(0xff4a1200),
      tertiaryContainer: Color(0xfff75f26),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdbdcde),
      outline: Color(0xffb0b2b4),
      outlineVariant: Color(0xff8e9192),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff464847),
      primaryFixed: Color(0xffe2e3e1),
      onPrimaryFixed: Color(0xff0f1211),
      primaryFixedDim: Color(0xffc6c7c5),
      onPrimaryFixedVariant: Color(0xff353735),
      secondaryFixed: Color(0xffe7e2dd),
      onSecondaryFixed: Color(0xff12110e),
      secondaryFixedDim: Color(0xffcac6c1),
      onSecondaryFixedVariant: Color(0xff383633),
      tertiaryFixed: Color(0xffffdbd0),
      onTertiaryFixed: Color(0xff270600),
      tertiaryFixedDim: Color(0xffffb59d),
      onTertiaryFixedVariant: Color(0xff671c00),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff454444),
      surfaceContainerLowest: Color(0xff080707),
      surfaceContainerLow: Color(0xff1e1d1d),
      surfaceContainer: Color(0xff282827),
      surfaceContainerHigh: Color(0xff333232),
      surfaceContainerHighest: Color(0xff3e3d3d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffc6c7c5),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffe2e3e1),
      onPrimaryContainer: Color(0xff282a29),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe7e2dd),
      onSecondaryContainer: Color(0xff2b2a27),
      tertiary: Color(0xffffece7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffaf95),
      onTertiaryContainer: Color(0xff1d0400),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffeef0f2),
      outlineVariant: Color(0xffc1c3c4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff464847),
      primaryFixed: Color(0xffe2e3e1),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc6c7c5),
      onPrimaryFixedVariant: Color(0xff0f1211),
      secondaryFixed: Color(0xffe7e2dd),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffcac6c1),
      onSecondaryFixedVariant: Color(0xff12110e),
      tertiaryFixed: Color(0xffffdbd0),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb59d),
      onTertiaryFixedVariant: Color(0xff270600),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff51504f),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f1f),
      surfaceContainer: Color(0xff313030),
      surfaceContainerHigh: Color(0xff3c3b3b),
      surfaceContainerHighest: Color(0xff484646),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    expansionTileTheme: ExpansionTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(25)),
      backgroundColor: colorScheme.surfaceContainerHigh,
      textColor: colorScheme.onSurface,
      collapsedBackgroundColor: colorScheme.surfaceContainer,
      iconColor: colorScheme.onSurfaceVariant,
      collapsedIconColor: colorScheme.onSurfaceVariant

    )
  );

  /// Rating Star
  static const ratingStar = ExtendedColor(
    seed: Color(0xfff5cb27),
    value: Color(0xfff5cb27),
    light: ColorFamily(
      color: Color(0xff725c00),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xfff5cb27),
      onColorContainer: Color(0xff6a5600),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff725c00),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xfff5cb27),
      onColorContainer: Color(0xff6a5600),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff725c00),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xfff5cb27),
      onColorContainer: Color(0xff6a5600),
    ),
    dark: ColorFamily(
      color: Color(0xffffeaad),
      onColor: Color(0xff3c2f00),
      colorContainer: Color(0xfff5cb27),
      onColorContainer: Color(0xff6a5600),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffffeaad),
      onColor: Color(0xff3c2f00),
      colorContainer: Color(0xfff5cb27),
      onColorContainer: Color(0xff6a5600),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffffeaad),
      onColor: Color(0xff3c2f00),
      colorContainer: Color(0xfff5cb27),
      onColorContainer: Color(0xff6a5600),
    ),
  );

  /// Success
  static const success = ExtendedColor(
    seed: Color(0xff166534),
    value: Color(0xff166534),
    light: ColorFamily(
      color: Color(0xff004c22),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff166534),
      onColorContainer: Color(0xff93e0a2),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff004c22),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff166534),
      onColorContainer: Color(0xff93e0a2),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff004c22),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff166534),
      onColorContainer: Color(0xff93e0a2),
    ),
    dark: ColorFamily(
      color: Color(0xff8bd79b),
      onColor: Color(0xff003918),
      colorContainer: Color(0xff166534),
      onColorContainer: Color(0xff93e0a2),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xff8bd79b),
      onColor: Color(0xff003918),
      colorContainer: Color(0xff166534),
      onColorContainer: Color(0xff93e0a2),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xff8bd79b),
      onColor: Color(0xff003918),
      colorContainer: Color(0xff166534),
      onColorContainer: Color(0xff93e0a2),
    ),
  );

  /// Interactive
  static const interactive = ExtendedColor(
    seed: Color(0xff0369a1),
    value: Color(0xff0369a1),
    light: ColorFamily(
      color: Color(0xff00507d),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff0369a1),
      onColorContainer: Color(0xffcbe4ff),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff00507d),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff0369a1),
      onColorContainer: Color(0xffcbe4ff),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff00507d),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff0369a1),
      onColorContainer: Color(0xffcbe4ff),
    ),
    dark: ColorFamily(
      color: Color(0xff94ccff),
      onColor: Color(0xff003352),
      colorContainer: Color(0xff0369a1),
      onColorContainer: Color(0xffcbe4ff),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xff94ccff),
      onColor: Color(0xff003352),
      colorContainer: Color(0xff0369a1),
      onColorContainer: Color(0xffcbe4ff),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xff94ccff),
      onColor: Color(0xff003352),
      colorContainer: Color(0xff0369a1),
      onColorContainer: Color(0xffcbe4ff),
    ),
  );

  List<ExtendedColor> get extendedColors => [ratingStar, success, interactive];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

