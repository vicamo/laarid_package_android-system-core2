lib_LTLIBRARIES += \
	%reldir%/libandroid-zipfile.la

%canon_reldir%_libandroid_zipfile_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_zipfile_la_LIBADD = \
	$(ZLIB_LIBS)
%canon_reldir%_libandroid_zipfile_la_SOURCES = \
	%reldir%/centraldir.c \
	%reldir%/zipfile.c

noinst_PROGRAMS += \
	%reldir%/test_zipfile

%canon_reldir%_test_zipfile_LDADD = \
	%reldir%/libandroid-zipfile.la
%canon_reldir%_test_zipfile_SOURCES = \
	%reldir%/test_zipfile.c

pkgconfig_DATA += \
	%reldir%/android-zipfile-$(SYSTEMCORE_API_VERSION).pc
