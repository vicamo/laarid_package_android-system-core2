if HAVE_GTEST
check_PROGRAMS += \
    %reldir%/test-pixelflinger-arm64-assembler-test

TESTS += \
    %reldir%/test-pixelflinger-arm64-assembler-test

%canon_reldir%_test_pixelflinger_arm64_assembler_test_SOURCES = \
    %reldir%/arm64_assembler_test.cpp \
    %reldir%/asm_test_jacket.S

%canon_reldir%_test_pixelflinger_arm64_assembler_test_LDADD = \
    $(CUTILS_LIBS) \
    $(GTEST_LIBS) \
    libpixelflinger/libandroid-pixelflinger.la
%canon_reldir%_test_pixelflinger_arm64_assembler_test_DEPENDENCIES = \
    $(GTEST_LIBS) \
    libpixelflinger/libandroid-pixelflinger.la

%canon_reldir%_test_pixelflinger_arm64_assembler_test_CPPFLAGS = \
    $(AM_CPPFLAGS) \
    $(BIONIC_CFLAGS) \
    $(LOG_CFLAGS) \
    $(GTEST_CPPFLAGS) \
    -I$(top_srcdir)/libpixelflinger
endif # HAVE_GTEST
