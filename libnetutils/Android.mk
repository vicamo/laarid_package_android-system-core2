lib_LTLIBRARIES += \
	%reldir%/libandroid-netutils-0.la

%canon_reldir%_libandroid_netutils_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_netutils_0_la_LIBADD = \
	liblog/libandroid-log-0.la \
	libcutils/libandroid-cutils-0.la
%canon_reldir%_libandroid_netutils_0_la_SOURCES = \
	%reldir%/dhcpclient.c \
	%reldir%/dhcpmsg.c \
	%reldir%/dhcp_utils.c \
	%reldir%/ifc_utils.c \
	%reldir%/packet.c

pkgconfig_DATA += \
	%reldir%/android-netutils-$(SYSTEMCORE_API_VERSION).pc
