import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4279135064),
      surfaceTint: Color(4279135064),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288869082),
      onPrimaryContainer: Color(4278198297),
      secondary: Color(4283000622),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291489446),
      onSecondaryContainer: Color(4279050240),
      tertiary: Color(4287450665),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294958026),
      onTertiaryContainer: Color(4281536768),
      error: Color(4287514967),
      onError: Color(4294967295),
      errorContainer: Color(4294957534),
      onErrorContainer: Color(4282058518),
      background: Color(4294310903),
      onBackground: Color(4279704859),
      surface: Color(4294376190),
      onSurface: Color(4279770143),
      surfaceVariant: Color(4292731882),
      onSurfaceVariant: Color(4282468429),
      outline: Color(4285626494),
      outlineVariant: Color(4290889678),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086261),
      inverseOnSurface: Color(4293849590),
      inversePrimary: Color(4287026878),
      primaryFixed: Color(4288869082),
      onPrimaryFixed: Color(4278198297),
      primaryFixedDim: Color(4287026878),
      onPrimaryFixedVariant: Color(4278210882),
      secondaryFixed: Color(4291489446),
      onSecondaryFixed: Color(4279050240),
      secondaryFixedDim: Color(4289712524),
      onSecondaryFixedVariant: Color(4281486872),
      tertiaryFixed: Color(4294958026),
      onTertiaryFixed: Color(4281536768),
      tertiaryFixedDim: Color(4294948495),
      onTertiaryFixedVariant: Color(4285544212),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294376190),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981432),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292862951),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278209598),
      surfaceTint: Color(4279135064),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281303662),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281223700),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284448066),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285215761),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289160253),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285345596),
      onError: Color(4294967295),
      errorContainer: Color(4289224557),
      onErrorContainer: Color(4294967295),
      background: Color(4294310903),
      onBackground: Color(4279704859),
      surface: Color(4294376190),
      onSurface: Color(4279770143),
      surfaceVariant: Color(4292731882),
      onSurfaceVariant: Color(4282205257),
      outline: Color(4284047462),
      outlineVariant: Color(4285889665),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086261),
      inverseOnSurface: Color(4293849590),
      inversePrimary: Color(4287026878),
      primaryFixed: Color(4281303662),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278741078),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284448066),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282868779),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4289160253),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4287253543),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294376190),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981432),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292862951),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278200351),
      surfaceTint: Color(4279135064),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209598),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279379712),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281223700),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282259200),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285215761),
      onTertiaryContainer: Color(4294967295),
      error: Color(4282584604),
      onError: Color(4294967295),
      errorContainer: Color(4285345596),
      onErrorContainer: Color(4294967295),
      background: Color(4294310903),
      onBackground: Color(4279704859),
      surface: Color(4294376190),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292731882),
      onSurfaceVariant: Color(4280165674),
      outline: Color(4282205257),
      outlineVariant: Color(4282205257),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086261),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4289461475),
      primaryFixed: Color(4278209598),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203433),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281223700),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279841537),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285215761),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283309568),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294376190),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981432),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292862951),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4287026878),
      surfaceTint: Color(4287026878),
      onPrimary: Color(4278204461),
      primaryContainer: Color(4278210882),
      onPrimaryContainer: Color(4288869082),
      secondary: Color(4289712524),
      onSecondary: Color(4280104707),
      secondaryContainer: Color(4281486872),
      onSecondaryContainer: Color(4291489446),
      tertiary: Color(4294948495),
      onTertiary: Color(4283638273),
      tertiaryContainer: Color(4285544212),
      onTertiaryContainer: Color(4294958026),
      error: Color(4294947518),
      onError: Color(4283833642),
      errorContainer: Color(4285608768),
      onErrorContainer: Color(4294957534),
      background: Color(4279178515),
      onBackground: Color(4292797664),
      surface: Color(4279178263),
      onSurface: Color(4292862951),
      surfaceVariant: Color(4282468429),
      onSurfaceVariant: Color(4290889678),
      outline: Color(4287336856),
      outlineVariant: Color(4282468429),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862951),
      inverseOnSurface: Color(4281086261),
      inversePrimary: Color(4279135064),
      primaryFixed: Color(4288869082),
      onPrimaryFixed: Color(4278198297),
      primaryFixedDim: Color(4287026878),
      onPrimaryFixedVariant: Color(4278210882),
      secondaryFixed: Color(4291489446),
      onSecondaryFixed: Color(4279050240),
      secondaryFixedDim: Color(4289712524),
      onSecondaryFixedVariant: Color(4281486872),
      tertiaryFixed: Color(4294958026),
      onTertiaryFixed: Color(4281536768),
      tertiaryFixedDim: Color(4294948495),
      onTertiaryFixedVariant: Color(4285544212),
      surfaceDim: Color(4279178263),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849298),
      surfaceContainerLow: Color(4279770143),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691502),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4287290051),
      surfaceTint: Color(4287026878),
      onPrimary: Color(4278197012),
      primaryContainer: Color(4283408265),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4289975952),
      onSecondary: Color(4278852096),
      secondaryContainer: Color(4286224987),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294950041),
      onTertiary: Color(4281011456),
      tertiaryContainer: Color(4291329878),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949059),
      onError: Color(4281533201),
      errorContainer: Color(4291394184),
      onErrorContainer: Color(4278190080),
      background: Color(4279178515),
      onBackground: Color(4292797664),
      surface: Color(4279178263),
      onSurface: Color(4294507519),
      surfaceVariant: Color(4282468429),
      onSurfaceVariant: Color(4291152850),
      outline: Color(4288521386),
      outlineVariant: Color(4286416010),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862951),
      inverseOnSurface: Color(4280691502),
      inversePrimary: Color(4278211139),
      primaryFixed: Color(4288869082),
      onPrimaryFixed: Color(4278195471),
      primaryFixedDim: Color(4287026878),
      onPrimaryFixedVariant: Color(4278206002),
      secondaryFixed: Color(4291489446),
      onSecondaryFixed: Color(4278654208),
      secondaryFixedDim: Color(4289712524),
      onSecondaryFixedVariant: Color(4280433928),
      tertiaryFixed: Color(4294958026),
      onTertiaryFixed: Color(4280486400),
      tertiaryFixedDim: Color(4294948495),
      onTertiaryFixedVariant: Color(4284163845),
      surfaceDim: Color(4279178263),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849298),
      surfaceContainerLow: Color(4279770143),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691502),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4293722103),
      surfaceTint: Color(4287026878),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4287290051),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294180833),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4289975952),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966008),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294950041),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949059),
      onErrorContainer: Color(4278190080),
      background: Color(4279178515),
      onBackground: Color(4292797664),
      surface: Color(4279178263),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282468429),
      onSurfaceVariant: Color(4294507519),
      outline: Color(4291152850),
      outlineVariant: Color(4291152850),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862951),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278202663),
      primaryFixed: Color(4289132510),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4287290051),
      onPrimaryFixedVariant: Color(4278197012),
      secondaryFixed: Color(4291752618),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4289975952),
      onSecondaryFixedVariant: Color(4278852096),
      tertiaryFixed: Color(4294959571),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294950041),
      onTertiaryFixedVariant: Color(4281011456),
      surfaceDim: Color(4279178263),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849298),
      surfaceContainerLow: Color(4279770143),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691502),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
