if HAVE_GTEST
check_PROGRAMS += \
    %reldir%/test-pixelflinger-arm64-disassembler-test

TESTS += \
    %reldir%/test-pixelflinger-arm64-disassembler-test

%canon_reldir%_test_pixelflinger_arm64_disassembler_test_SOURCES = \
    %reldir%/arm64_diassembler_test.cpp \
    libpixelflinger/codeflinger/Arm64Disassembler.cpp \
    libpixelflinger/codeflinger/Arm64Disassembler.h
%canon_reldir%_test_pixelflinger_arm64_disassembler_test_CPPFLAGS = \
    $(AM_CPPFLAGS) \
    $(GTEST_CPPFLAGS)
%canon_reldir%_test_pixelflinger_arm64_disassembler_test_LDADD = \
    $(GTEST_LIBS)
%canon_reldir%_test_pixelflinger_arm64_disassembler_test_DEPENDENCIES = \
    $(GTEST_LIBS)
endif # HAVE_GTEST
