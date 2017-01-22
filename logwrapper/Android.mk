lib_LTLIBRARIES += \
	%reldir%/libandroid-logwrap.la

%canon_reldir%_libandroid_logwrap_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(PTHREAD_CFLAGS) \
	$(BIONIC_CFLAGS) \
	-I$(srcdir)/%reldir%/include
%canon_reldir%_libandroid_logwrap_la_CFLAGS = \
	$(AM_CFLAGS) \
	-std=gnu99
%canon_reldir%_libandroid_logwrap_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_logwrap_la_LIBADD = \
	$(PTHREAD_LIBS) -lpthread \
	liblog/libandroid-log.la \
	libcutils/libandroid-cutils.la
%canon_reldir%_libandroid_logwrap_la_SOURCES = \
	%reldir%/logwrap.c

%canon_reldir%_libandroid_logwrap_incdir = $(androidincdir)/logwrap
%canon_reldir%_libandroid_logwrap_inc_HEADERS = \
	%reldir%/include/logwrap/logwrap.h

bin_PROGRAMS += \
	%reldir%/logwrapper

%canon_reldir%_logwrapper_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS) \
	-I$(srcdir)/%reldir%/include
%canon_reldir%_logwrapper_CFLAGS = \
	$(AM_CFLAGS) \
	-std=gnu99
%canon_reldir%_logwrapper_LDADD = \
	liblog/libandroid-log.la \
	libcutils/libandroid-cutils.la \
	%reldir%/libandroid-logwrap.la
%canon_reldir%_logwrapper_SOURCES = \
	%reldir%/logwrapper.c

pkgconfig_DATA += \
	%reldir%/android-logwrap-$(SYSTEMCORE_API_VERSION).pc
