if HAVE_GTEST
check_PROGRAMS += \
	%reldir%/test-opengl-codegen

TESTS += \
	%reldir%/test-opengl-codegen

%canon_reldir%_test_opengl_codegen_SOURCES = \
	%reldir%/codegen.cpp

%canon_reldir%_test_opengl_codegen_LDADD = \
	$(CUTILS_LIBS) \
	$(GTEST_LIBS) \
	libpixelflinger/libandroid-pixelflinger.la
%canon_reldir%_test_opengl_codegen_DEPENDENCIES = \
	$(GTEST_LIBS) \
	libpixelflinger/libandroid-pixelflinger.la

%canon_reldir%_test_opengl_codegen_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS) \
	$(LOG_CFLAGS) \
	$(CUTILS_CFLAGS) \
	$(GTEST_CPPFLAGS) \
	-I$(top_srcdir)/libpixelflinger \
	-I$(top_srcdir)/libpixelflinger/include
endif
