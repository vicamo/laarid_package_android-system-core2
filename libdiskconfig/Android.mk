lib_LTLIBRARIES += \
	%reldir%/libandroid-diskconfig.la

%canon_reldir%_libandroid_diskconfig_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_diskconfig_la_LIBADD = \
	liblog/libandroid-log.la \
	libcutils/libandroid-cutils.la
%canon_reldir%_libandroid_diskconfig_la_SOURCES = \
	%reldir%/config_mbr.c \
	%reldir%/diskconfig.c \
	%reldir%/diskutils.c \
	%reldir%/write_lst.c

pkgconfig_DATA += \
	%reldir%/android-diskconfig-$(SYSTEMCORE_API_VERSION).pc
