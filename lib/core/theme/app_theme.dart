import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ─── Shared Radius ────────────────────────────────────────────────────────────
const _kRadius = 12.0;
const _kRadiusLg = 16.0;
const _kRadiusSm = 8.0;
final _roundedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(_kRadius),
);

class AppTheme {
  // ─── DARK THEME PALETTE ───────────────────────────────────────────────────
  static const Color background     = Color(0xFF0A0A0A);
  static const Color surface        = Color(0xFF141414);
  static const Color surfaceVariant = Color(0xFF1E1E1E);
  static const Color primary        = Color(0xFFE50914);
  static const Color secondary      = Color(0xFFFFFFFF);
  static const Color textPrimary    = Color(0xFFF3F4F6);
  static const Color textSecondary  = Color(0xFF9CA3AF);

  // ─── STREET MURAL LIGHT THEME PALETTE ────────────────────────────────────
  static const Color muralBackground     = Color(0xFFF4EFE6);
  static const Color muralSurface        = Color(0xFFEBE5D8);
  static const Color muralSurfaceVariant = Color(0xFFFFFFFF);
  static const Color muralPrimary        = Color(0xFFFF5500);
  static const Color muralAccent         = Color(0xFF00BFA5);
  static const Color muralHighlight      = Color(0xFFFFD000);
  static const Color muralMagenta        = Color(0xFFE91E8C);
  static const Color muralInk            = Color(0xFF111111);
  static const Color muralTextPrimary    = Color(0xFF111111);
  static const Color muralTextSecondary  = Color(0xFF555555);

  // ─────────────────────────────────────────────────────────────────────────
  // DARK THEME
  // ─────────────────────────────────────────────────────────────────────────
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
        surfaceContainerHighest: surfaceVariant,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: textPrimary,
        onSurfaceVariant: textSecondary,
        outline: Color(0xFF2C2C2C),
        error: Color(0xFFFF4D6D),
      ),
      textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.outfit(
            color: textPrimary, fontWeight: FontWeight.w900, letterSpacing: 2.0),
        displayMedium: GoogleFonts.outfit(
            color: textPrimary, fontWeight: FontWeight.w900, letterSpacing: 1.5),
        headlineLarge: GoogleFonts.outfit(
            color: textPrimary, fontWeight: FontWeight.w900, letterSpacing: 1.5),
        headlineMedium: GoogleFonts.outfit(
            color: textPrimary, fontWeight: FontWeight.w900, letterSpacing: 1.2),
        headlineSmall: GoogleFonts.outfit(
            color: textPrimary, fontWeight: FontWeight.w900, letterSpacing: 1.0),
        titleLarge: GoogleFonts.outfit(
            color: textPrimary, fontWeight: FontWeight.bold, letterSpacing: 1.0),
        titleMedium: GoogleFonts.outfit(
            color: textPrimary, fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.outfit(
            color: textPrimary, fontWeight: FontWeight.w500),
        bodyMedium: GoogleFonts.outfit(
            color: textSecondary, fontWeight: FontWeight.normal),
        bodySmall: GoogleFonts.outfit(color: textSecondary, fontSize: 12),
        labelLarge: GoogleFonts.outfit(
            color: textPrimary, fontWeight: FontWeight.w700, letterSpacing: 1.5),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimary,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: GoogleFonts.outfit(
            color: textPrimary,
            fontWeight: FontWeight.w900,
            fontSize: 18,
            letterSpacing: 2),
        iconTheme: const IconThemeData(color: textPrimary),
        shape: const Border(bottom: BorderSide(color: surfaceVariant, width: 1)),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: background,
        surfaceTintColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          shape: _roundedShape,
          padding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
          elevation: 0,
          textStyle: GoogleFonts.outfit(
              fontWeight: FontWeight.w900, letterSpacing: 1.2, fontSize: 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: secondary,
          shape: _roundedShape,
          side: const BorderSide(color: secondary, width: 1.5),
          padding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
          textStyle: GoogleFonts.outfit(
              fontWeight: FontWeight.w900, letterSpacing: 1.2, fontSize: 14),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_kRadiusSm)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kRadius),
          borderSide: const BorderSide(color: Color(0xFF2C2C2C), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kRadius),
          borderSide: const BorderSide(color: Color(0xFF2C2C2C), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kRadius),
          borderSide: const BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kRadius),
          borderSide: const BorderSide(color: Color(0xFFFF4D6D), width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kRadius),
          borderSide: const BorderSide(color: Color(0xFFFF4D6D), width: 2),
        ),
        labelStyle: const TextStyle(
            color: textSecondary,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5),
        hintStyle: const TextStyle(color: textSecondary),
        prefixIconColor: textSecondary,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_kRadius)),
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: surfaceVariant,
        labelStyle: GoogleFonts.outfit(
            color: textPrimary, fontWeight: FontWeight.w700, fontSize: 12),
        side: const BorderSide(color: Color(0xFF2C2C2C), width: 1),
        shape: StadiumBorder(side: BorderSide(color: Color(0xFF2C2C2C))),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_kRadius)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: primary,
        unselectedItemColor: textSecondary,
        selectedLabelStyle: GoogleFonts.outfit(fontWeight: FontWeight.w800),
        unselectedLabelStyle: GoogleFonts.outfit(),
        elevation: 0,
      ),
      dividerTheme: const DividerThemeData(
          color: surfaceVariant, thickness: 1, space: 0),
      iconTheme: const IconThemeData(color: textPrimary, size: 24),
      primaryIconTheme: const IconThemeData(color: Colors.white, size: 24),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: surfaceVariant,
        contentTextStyle: GoogleFonts.outfit(
            color: textPrimary, fontWeight: FontWeight.w600),
        actionTextColor: primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_kRadius)),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_kRadiusLg)),
        titleTextStyle: GoogleFonts.outfit(
            color: textPrimary,
            fontWeight: FontWeight.w900,
            fontSize: 18,
            letterSpacing: 0.5),
        contentTextStyle: GoogleFonts.outfit(color: textSecondary),
        elevation: 8,
      ),
      badgeTheme:
          const BadgeThemeData(backgroundColor: primary, textColor: Colors.white),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // STREET MURAL LIGHT THEME
  // ─────────────────────────────────────────────────────────────────────────
  static ThemeData get streetMuralTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: muralBackground,
      primaryColor: muralPrimary,
      colorScheme: const ColorScheme.light(
        primary: muralPrimary,
        secondary: muralAccent,
        tertiary: muralMagenta,
        surface: muralSurface,
        surfaceContainerHighest: muralSurfaceVariant,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.white,
        onSurface: muralTextPrimary,
        onSurfaceVariant: muralTextSecondary,
        outline: Color(0xFFCCC5B5),
        error: Color(0xFFD32F2F),
        onError: Colors.white,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.permanentMarker(
            color: muralTextPrimary,
            letterSpacing: 2.0,
            shadows: [
              Shadow(
                  color: muralPrimary.withValues(alpha: 0.2),
                  offset: const Offset(4, 4))
            ]),
        displayMedium: GoogleFonts.permanentMarker(
            color: muralPrimary, letterSpacing: 1.5),
        displaySmall: GoogleFonts.permanentMarker(
            color: muralAccent, letterSpacing: 1.0),
        headlineLarge: GoogleFonts.permanentMarker(
            color: muralTextPrimary, letterSpacing: 1.5),
        headlineMedium: GoogleFonts.permanentMarker(
            color: muralTextPrimary, letterSpacing: 1.2),
        headlineSmall: GoogleFonts.permanentMarker(
            color: muralPrimary, letterSpacing: 1.0),
        titleLarge: GoogleFonts.outfit(
            color: muralTextPrimary,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2),
        titleMedium: GoogleFonts.outfit(
            color: muralTextPrimary,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8),
        titleSmall: GoogleFonts.outfit(
            color: muralTextSecondary, fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.outfit(
            color: muralTextPrimary, fontWeight: FontWeight.w500),
        bodyMedium: GoogleFonts.outfit(color: muralTextSecondary),
        bodySmall:
            GoogleFonts.outfit(color: muralTextSecondary, fontSize: 12),
        labelLarge: GoogleFonts.outfit(
            color: muralTextPrimary,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: muralPrimary,
        foregroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: GoogleFonts.permanentMarker(
            color: Colors.white, fontSize: 20, letterSpacing: 1.5),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: muralBackground,
        surfaceTintColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: muralPrimary,
          foregroundColor: Colors.white,
          elevation: 3,
          shadowColor: muralPrimary.withValues(alpha: 0.35),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_kRadius)),
          padding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
          textStyle: GoogleFonts.outfit(
              fontWeight: FontWeight.w900, letterSpacing: 1.2, fontSize: 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: muralPrimary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_kRadius)),
          side: const BorderSide(color: muralPrimary, width: 2),
          padding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
          textStyle: GoogleFonts.outfit(
              fontWeight: FontWeight.w900, letterSpacing: 1.2, fontSize: 14),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: muralAccent,
          textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_kRadiusSm)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: muralSurfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kRadius),
          borderSide:
              const BorderSide(color: Color(0xFFCCC5B5), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kRadius),
          borderSide:
              const BorderSide(color: Color(0xFFCCC5B5), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kRadius),
          borderSide: const BorderSide(color: muralPrimary, width: 2.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kRadius),
          borderSide: const BorderSide(color: muralMagenta, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_kRadius),
          borderSide: const BorderSide(color: muralMagenta, width: 2.5),
        ),
        labelStyle: GoogleFonts.outfit(
            color: muralTextSecondary,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5),
        hintStyle: GoogleFonts.outfit(color: muralTextSecondary),
        prefixIconColor: muralTextSecondary,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_kRadius)),
        color: muralSurfaceVariant,
        elevation: 3,
        shadowColor: Colors.black26,
        margin: EdgeInsets.zero,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: muralHighlight,
        labelStyle: GoogleFonts.outfit(
            color: muralInk, fontWeight: FontWeight.w800, fontSize: 12),
        side: const BorderSide(color: muralInk, width: 1),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: muralAccent,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_kRadius)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: muralBackground,
        selectedItemColor: muralPrimary,
        unselectedItemColor: muralTextSecondary,
        selectedLabelStyle: GoogleFonts.outfit(fontWeight: FontWeight.w800),
        unselectedLabelStyle: GoogleFonts.outfit(),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
      dividerTheme:
          const DividerThemeData(color: Color(0xFFCCC5B5), thickness: 1, space: 0),
      iconTheme: const IconThemeData(color: muralTextPrimary, size: 24),
      primaryIconTheme: const IconThemeData(color: Colors.white, size: 24),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: muralInk,
        contentTextStyle: GoogleFonts.outfit(
            color: Colors.white, fontWeight: FontWeight.w600),
        actionTextColor: muralHighlight,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_kRadius)),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: muralSurfaceVariant,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_kRadiusLg)),
        titleTextStyle: GoogleFonts.permanentMarker(
            color: muralTextPrimary, fontSize: 20, letterSpacing: 1),
        contentTextStyle: GoogleFonts.outfit(color: muralTextSecondary),
        elevation: 8,
      ),
      badgeTheme: const BadgeThemeData(
          backgroundColor: muralMagenta, textColor: Colors.white),
    );
  }
}

