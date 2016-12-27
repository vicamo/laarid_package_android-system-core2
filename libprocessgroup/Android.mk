lib_LTLIBRARIES += \
	%reldir%/libandroid-processgroup.la

%canon_reldir%_libandroid_processgroup_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	-I$(top_srcdir)/%reldir%/include \
	$(BIONIC_CFLAGS) \
	$(LOG_CFLAGS) \
	$(CUTILS_CFLAGS)
%canon_reldir%_libandroid_processgroup_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_processgroup_la_LIBADD = \
	$(LOG_LIBS) \
	$(BIONIC_LIBS) \
	libutils/libandroid-utils.la
%canon_reldir%_libandroid_processgroup_la_SOURCES = \
	%reldir%/processgroup.cpp

bin_PROGRAMS += \
	%reldir%/processgroup_cleanup

%canon_reldir%_processgroup_cleanup_CPPFLAGS = \
	$(%canon_reldir%_libandroid_processgroup_la_CPPFLAGS)
%canon_reldir%_processgroup_cleanup_LDADD = \
	$(BIONIC_LIBS) \
	%reldir%/libandroid-processgroup.la
%canon_reldir%_processgroup_cleanup_SOURCES = \
	%reldir%/cleanup.cpp

pkgconfig_DATA += \
	%reldir%/android-processgroup-$(SYSTEMCORE_API_VERSION).pc
