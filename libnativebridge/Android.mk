lib_LTLIBRARIES += \
	%reldir%/libandroid-nativebridge.la

%canon_reldir%_libandroid_nativebridge_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_libandroid_nativebridge_la_CXXFLAGS = \
	$(AM_CXXFLAGS) \
	$(NATIVEHELPER_CFLAGS) \
	-std=gnu++11 \
	-fvisibility=protected
%canon_reldir%_libandroid_nativebridge_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_nativebridge_la_LIBADD = \
	$(LIBADD_DLOPEN) \
	liblog/libandroid-log.la
%canon_reldir%_libandroid_nativebridge_la_SOURCES = \
	%reldir%/native_bridge.cc

pkgconfig_DATA += \
	%reldir%/android-nativebridge-$(SYSTEMCORE_API_VERSION).pc
