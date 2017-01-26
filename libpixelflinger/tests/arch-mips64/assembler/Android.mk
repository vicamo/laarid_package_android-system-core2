if HAVE_GTEST
check_PROGRAMS += \
    %reldir%/test-pixelflinger-mips64-assembler-test

# Disabled due to unexpected failures.
# See https://github.com/laarid/package_android-system-core2/issues/10
#TESTS += \
#    %reldir%/test-pixelflinger-mips64-assembler-test

%canon_reldir%_test_pixelflinger_mips64_assembler_test_SOURCES = \
    %reldir%/mips64_assembler_test.cpp \
    %reldir%/asm_mips_test_jacket.S

%canon_reldir%_test_pixelflinger_mips64_assembler_test_LDADD = \
    $(CUTILS_LIBS) \
    $(GTEST_LIBS) \
    libpixelflinger/libandroid-pixelflinger.la
%canon_reldir%_test_pixelflinger_mips64_assembler_test_DEPENDENCIES = \
    $(GTEST_LIBS) \
    libpixelflinger/libandroid-pixelflinger.la

%canon_reldir%_test_pixelflinger_mips64_assembler_test_CPPFLAGS = \
    $(AM_CPPFLAGS) \
    $(BIONIC_CFLAGS) \
    $(LOG_CFLAGS) \
    $(CUTILS_CFLAGS) \
    $(GTEST_CPPFLAGS) \
    -I$(top_srcdir)/libpixelflinger
endif # HAVE_GTEST
