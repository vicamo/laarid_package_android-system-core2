lib_LTLIBRARIES += \
	%reldir%/libandroid-sysutils-0.la

%canon_reldir%_libandroid_sysutils_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_sysutils_0_la_LIBADD = \
	liblog/libandroid-log-0.la \
	libcutils/libandroid-cutils-0.la
%canon_reldir%_libandroid_sysutils_0_la_DEPENDENCIES = \
	liblog/libandroid-log-0.la \
	libcutils/libandroid-cutils-0.la
%canon_reldir%_libandroid_sysutils_0_la_SOURCES = \
	%reldir%/src/FrameworkCommand.cpp \
	%reldir%/src/FrameworkListener.cpp \
	%reldir%/src/NetlinkEvent.cpp \
	%reldir%/src/NetlinkListener.cpp \
	%reldir%/src/ServiceManager.cpp \
	%reldir%/src/SocketClient.cpp \
	%reldir%/src/SocketListener.cpp

# Never used:
# %reldir%/src/FrameworkClient.cpp

pkgconfig_DATA += \
	%reldir%/android-sysutils-$(SYSTEMCORE_API_VERSION).pc
