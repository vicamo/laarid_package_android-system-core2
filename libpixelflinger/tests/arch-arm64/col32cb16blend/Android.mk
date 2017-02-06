if HAVE_GTEST
check_PROGRAMS += \
    %reldir%/test-pixelflinger-arm64-col32cb16blend

TESTS += \
    %reldir%/test-pixelflinger-arm64-col32cb16blend

%canon_reldir%_test_pixelflinger_arm64_col32cb16blend_SOURCES = \
    %reldir%/col32cb16blend_test.c \
    libpixelflinger/arch-arm64/col32cb16blend.S
%canon_reldir%_test_pixelflinger_arm64_col32cb16blend_CPPFLAGS = \
    $(AM_CPPFLAGS) \
    $(GTEST_CPPFLAGS)
%canon_reldir%_test_pixelflinger_arm64_col32cb16blend_LDADD = \
    $(GTEST_LIBS)
%canon_reldir%_test_pixelflinger_arm64_col32cb16blend_DEPENDENCIES = \
    $(GTEST_LIBS)
endif # HAVE_GTEST
