lib_LTLIBRARIES += \
	%reldir%/libandroid-processgroup-0.la

%canon_reldir%_libandroid_processgroup_0_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	-I$(top_srcdir)/%reldir%/include
%canon_reldir%_libandroid_processgroup_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_processgroup_0_la_LIBADD = \
	liblog/libandroid-log-0.la \
	libutils/libandroid-utils-0.la
%canon_reldir%_libandroid_processgroup_0_la_SOURCES = \
	%reldir%/processgroup.cpp

bin_PROGRAMS += \
	%reldir%/processgroup_cleanup

%canon_reldir%_processgroup_cleanup_CPPFLAGS = \
	$(libsparse_libandroid_sparse_0_la_CPPFLAGS)
%canon_reldir%_processgroup_cleanup_LDADD = \
	%reldir%/libandroid-processgroup-0.la
%canon_reldir%_processgroup_cleanup_SOURCES = \
	%reldir%/cleanup.cpp

pkgconfig_DATA += \
	%reldir%/android-processgroup-$(SYSTEMCORE_API_VERSION).pc
