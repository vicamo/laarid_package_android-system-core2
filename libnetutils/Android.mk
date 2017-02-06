lib_LTLIBRARIES += \
	%reldir%/libandroid-netutils.la

%canon_reldir%_libandroid_netutils_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS)
%canon_reldir%_libandroid_netutils_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_netutils_la_LIBADD = \
	liblog/libandroid-log.la \
	libcutils/libandroid-cutils.la
%canon_reldir%_libandroid_netutils_la_SOURCES = \
	%reldir%/dhcpclient.c \
	%reldir%/dhcpmsg.c \
	%reldir%/dhcpmsg.h \
	%reldir%/ifc_utils.c \
	%reldir%/packet.c \
	%reldir%/packet.h

bin_PROGRAMS += \
	%reldir%/dhcptool

%canon_reldir%_dhcptool_LDADD = \
	%reldir%/libandroid-netutils.la
%canon_reldir%_dhcptool_SOURCES = \
	%reldir%/dhcptool.c

pkgconfig_DATA += \
	%reldir%/android-netutils-$(LAARID_API_VERSION).pc
