import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281231449),
      surfaceTint: Color(4281231449),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285442455),
      onPrimaryContainer: Color(4278194958),
      secondary: Color(4283065904),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4289383306),
      onSecondaryContainer: Color(4280236039),
      tertiary: Color(4288431104),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294938703),
      onTertiaryContainer: Color(4282259200),
      error: Color(4288806976),
      onError: Color(4294967295),
      errorContainer: Color(4292488290),
      onErrorContainer: Color(4294967295),
      surface: Color(4294638074),
      onSurface: Color(4279901213),
      onSurfaceVariant: Color(4282533708),
      outline: Color(4285757564),
      outlineVariant: Color(4290955212),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282610),
      inversePrimary: Color(4288139968),
      primaryFixed: Color(4289916891),
      onPrimaryFixed: Color(4278198297),
      primaryFixedDim: Color(4288139968),
      onPrimaryFixedVariant: Color(4279259202),
      secondaryFixed: Color(4291620265),
      onSecondaryFixed: Color(4279050240),
      secondaryFixedDim: Color(4289778063),
      onSecondaryFixedVariant: Color(4281617947),
      tertiaryFixed: Color(4294958026),
      onTertiaryFixed: Color(4281536768),
      tertiaryFixedDim: Color(4294948495),
      onTertiaryFixedVariant: Color(4286001664),
      surfaceDim: Color(4292598491),
      surfaceBright: Color(4294638074),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243316),
      surfaceContainer: Color(4293914095),
      surfaceContainerHigh: Color(4293519593),
      surfaceContainerHighest: Color(4293124835),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278799422),
      surfaceTint: Color(4281231449),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282744687),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281354775),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284513604),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285607680),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290729216),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287168565),
      onError: Color(4294967295),
      errorContainer: Color(4292488290),
      onErrorContainer: Color(4294967295),
      surface: Color(4294638074),
      onSurface: Color(4279901213),
      onSurfaceVariant: Color(4282270536),
      outline: Color(4284178532),
      outlineVariant: Color(4285954944),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282610),
      inversePrimary: Color(4288139968),
      primaryFixed: Color(4282744687),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281034327),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284513604),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282934318),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4290729216),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4288233984),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598491),
      surfaceBright: Color(4294638074),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243316),
      surfaceContainer: Color(4293914095),
      surfaceContainerHigh: Color(4293519593),
      surfaceContainerHighest: Color(4293124835),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200351),
      surfaceTint: Color(4281231449),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278799422),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279379712),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281354775),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282259200),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285607680),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283170842),
      onError: Color(4294967295),
      errorContainer: Color(4287168565),
      onErrorContainer: Color(4294967295),
      surface: Color(4294638074),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280231208),
      outline: Color(4282270536),
      outlineVariant: Color(4282270536),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282610),
      inversePrimary: Color(4290574821),
      primaryFixed: Color(4278799422),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203433),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281354775),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279907075),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285607680),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283309568),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598491),
      surfaceBright: Color(4294638074),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243316),
      surfaceContainer: Color(4293914095),
      surfaceContainerHigh: Color(4293519593),
      surfaceContainerHighest: Color(4293124835),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288139968),
      surfaceTint: Color(4288139968),
      onPrimary: Color(4278204461),
      primaryContainer: Color(4282744687),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4291028129),
      onSecondary: Color(4280170246),
      secondaryContainer: Color(4288330363),
      onSecondaryContainer: Color(4279511808),
      tertiary: Color(4294948495),
      onTertiary: Color(4283703552),
      tertiaryContainer: Color(4294277158),
      onTertiaryContainer: Color(4280026880),
      error: Color(4294947518),
      onError: Color(4284874790),
      errorContainer: Color(4292488290),
      onErrorContainer: Color(4294967295),
      surface: Color(4279374613),
      onSurface: Color(4293124835),
      onSurfaceVariant: Color(4290955212),
      outline: Color(4287402390),
      outlineVariant: Color(4282533708),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124835),
      inversePrimary: Color(4281231449),
      primaryFixed: Color(4289916891),
      onPrimaryFixed: Color(4278198297),
      primaryFixedDim: Color(4288139968),
      onPrimaryFixedVariant: Color(4279259202),
      secondaryFixed: Color(4291620265),
      onSecondaryFixed: Color(4279050240),
      secondaryFixedDim: Color(4289778063),
      onSecondaryFixedVariant: Color(4281617947),
      tertiaryFixed: Color(4294958026),
      onTertiaryFixed: Color(4281536768),
      tertiaryFixedDim: Color(4294948495),
      onTertiaryFixedVariant: Color(4286001664),
      surfaceDim: Color(4279374613),
      surfaceBright: Color(4281874746),
      surfaceContainerLowest: Color(4279045647),
      surfaceContainerLow: Color(4279901213),
      surfaceContainer: Color(4280229921),
      surfaceContainerHigh: Color(4280887851),
      surfaceContainerHighest: Color(4281611574),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288403396),
      surfaceTint: Color(4288139968),
      onPrimary: Color(4278197012),
      primaryContainer: Color(4284652683),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291028129),
      onSecondary: Color(4279445760),
      secondaryContainer: Color(4288330363),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294950041),
      onTertiary: Color(4281011456),
      tertiaryContainer: Color(4294277158),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949059),
      onError: Color(4281729040),
      errorContainer: Color(4294921598),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374613),
      onSurface: Color(4294769403),
      onSurfaceVariant: Color(4291283920),
      outline: Color(4288652200),
      outlineVariant: Color(4286547080),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124835),
      inversePrimary: Color(4279390531),
      primaryFixed: Color(4289916891),
      onPrimaryFixed: Color(4278195471),
      primaryFixedDim: Color(4288139968),
      onPrimaryFixedVariant: Color(4278206002),
      secondaryFixed: Color(4291620265),
      onSecondaryFixed: Color(4278654208),
      secondaryFixedDim: Color(4289778063),
      onSecondaryFixedVariant: Color(4280499467),
      tertiaryFixed: Color(4294958026),
      onTertiaryFixed: Color(4280486400),
      tertiaryFixedDim: Color(4294948495),
      onTertiaryFixedVariant: Color(4284294656),
      surfaceDim: Color(4279374613),
      surfaceBright: Color(4281874746),
      surfaceContainerLowest: Color(4279045647),
      surfaceContainerLow: Color(4279901213),
      surfaceContainer: Color(4280229921),
      surfaceContainerHigh: Color(4280887851),
      surfaceContainerHighest: Color(4281611574),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293722103),
      surfaceTint: Color(4288139968),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288403396),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294180833),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290041235),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966008),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294950041),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949059),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374613),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294507519),
      outline: Color(4291283920),
      outlineVariant: Color(4291283920),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124835),
      inversePrimary: Color(4278202663),
      primaryFixed: Color(4290245600),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288403396),
      onPrimaryFixedVariant: Color(4278197012),
      secondaryFixed: Color(4291883693),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290041235),
      onSecondaryFixedVariant: Color(4278852096),
      tertiaryFixed: Color(4294959571),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294950041),
      onTertiaryFixedVariant: Color(4281011456),
      surfaceDim: Color(4279374613),
      surfaceBright: Color(4281874746),
      surfaceContainerLowest: Color(4279045647),
      surfaceContainerLow: Color(4279901213),
      surfaceContainer: Color(4280229921),
      surfaceContainerHigh: Color(4280887851),
      surfaceContainerHighest: Color(4281611574),
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
  );

  /// Dark blue
  static const darkBlue = ExtendedColor(
    seed: Color(4280499533),
    value: Color(4280499533),
    light: ColorFamily(
      color: Color(4279184186),
      onColor: Color(4294967295),
      colorContainer: Color(4281551965),
      onColorContainer: Color(4291684605),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(4279184186),
      onColor: Color(4294967295),
      colorContainer: Color(4281551965),
      onColorContainer: Color(4291684605),
    ),
    lightHighContrast: ColorFamily(
      color: Color(4279184186),
      onColor: Color(4294967295),
      colorContainer: Color(4281551965),
      onColorContainer: Color(4291684605),
    ),
    dark: ColorFamily(
      color: Color(4289710814),
      onColor: Color(4279841603),
      colorContainer: Color(4279841859),
      onColorContainer: Color(4289250006),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(4289710814),
      onColor: Color(4279841603),
      colorContainer: Color(4279841859),
      onColorContainer: Color(4289250006),
    ),
    darkHighContrast: ColorFamily(
      color: Color(4289710814),
      onColor: Color(4279841603),
      colorContainer: Color(4279841859),
      onColorContainer: Color(4289250006),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    darkBlue,
  ];
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
