lib_LTLIBRARIES += \
	%reldir%/libandroid-sysutils.la

%canon_reldir%_libandroid_sysutils_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS) \
	$(NL_CFLAGS)
%canon_reldir%_libandroid_sysutils_la_CXXFLAGS = \
	$(AM_CXXFLAGS) \
	$(PTHREAD_CFLAGS)
%canon_reldir%_libandroid_sysutils_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(PTHREAD_CFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_sysutils_la_LIBADD = \
	-lpthread \
	$(NL_LIBS) \
	liblog/libandroid-log.la \
	libcutils/libandroid-cutils.la
%canon_reldir%_libandroid_sysutils_la_SOURCES = \
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
	%reldir%/android-sysutils-$(LAARID_API_VERSION).pc
