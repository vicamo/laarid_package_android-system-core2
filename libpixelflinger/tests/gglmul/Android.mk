if HAVE_GTEST
check_PROGRAMS += \
	%reldir%/test-pixelflinger-gglmul

TESTS += \
	%reldir%/test-pixelflinger-gglmul

%canon_reldir%_test_pixelflinger_gglmul_SOURCES = \
	%reldir%/gglmul_test.cpp

%canon_reldir%_test_pixelflinger_gglmul_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(GTEST_CPPFLAGS) \
	-I$(top_srcdir)/libpixelflinger/include
%canon_reldir%_test_pixelflinger_gglmul_LDADD = \
	$(GTEST_LIBS)
%canon_reldir%_test_pixelflinger_gglmul_DEPENDENCIES = \
	$(GTEST_LIBS)
endif
