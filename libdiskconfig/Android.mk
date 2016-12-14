lib_LTLIBRARIES += \
	%reldir%/libandroid-diskconfig-0.la

%canon_reldir%_libandroid_diskconfig_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_diskconfig_0_la_LIBADD = \
	liblog/libandroid-log-0.la \
	libcutils/libandroid-cutils-0.la
%canon_reldir%_libandroid_diskconfig_0_la_SOURCES = \
	%reldir%/config_mbr.c \
	%reldir%/diskconfig.c \
	%reldir%/diskutils.c \
	%reldir%/write_lst.c

pkgconfig_DATA += \
	%reldir%/android-diskconfig-$(SYSTEMCORE_API_VERSION).pc
