if HAVE_GTEST
check_PROGRAMS += \
    %reldir%/test-pixelflinger-mips64-disassembler-test

TESTS += \
    %reldir%/test-pixelflinger-mips64-disassembler-test

%canon_reldir%_test_pixelflinger_mips64_disassembler_test_SOURCES = \
    %reldir%/mips64_disassembler_test.cpp \
    libpixelflinger/codeflinger/mips64_disassem.c \
    libpixelflinger/codeflinger/mips64_disassem.h
%canon_reldir%_test_pixelflinger_mips64_disassembler_test_CPPFLAGS = \
    $(AM_CPPFLAGS) \
    $(BIONIC_CFLAGS) \
    $(LOG_CFLAGS) \
    $(CUTILS_CFLAGS) \
    $(GTEST_CPPFLAGS)
%canon_reldir%_test_pixelflinger_mips64_disassembler_test_LDADD = \
    $(GTEST_LIBS)
%canon_reldir%_test_pixelflinger_mips64_disassembler_test_DEPENDENCIES = \
    $(GTEST_LIBS)
endif # HAVE_GTEST
