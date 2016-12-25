lib_LTLIBRARIES += \
	%reldir%/libandroid-netutils.la

%canon_reldir%_libandroid_netutils_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_netutils_la_LIBADD = \
	liblog/libandroid-log.la \
	libcutils/libandroid-cutils.la
%canon_reldir%_libandroid_netutils_la_SOURCES = \
	%reldir%/dhcpclient.c \
	%reldir%/dhcpmsg.c \
	%reldir%/dhcp_utils.c \
	%reldir%/ifc_utils.c \
	%reldir%/packet.c

pkgconfig_DATA += \
	%reldir%/android-netutils-$(SYSTEMCORE_API_VERSION).pc
