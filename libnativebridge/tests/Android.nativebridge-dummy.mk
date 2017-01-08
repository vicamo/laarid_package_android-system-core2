if HAVE_GTEST

check_LTLIBRARIES += \
	%reldir%/libnativebridge-dummy.la \
	%reldir%/libnativebridge2-dummy.la

%canon_reldir%_libnativebridge_dummy_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_libnativebridge_dummy_la_CXXFLAGS = \
	$(AM_CXXFLAGS) \
	-fvisibility=protected
%canon_reldir%_libnativebridge_dummy_la_SOURCES = \
	%reldir%/DummyNativeBridge.cpp

%canon_reldir%_libnativebridge2_dummy_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_libnativebridge2_dummy_la_CXXFLAGS = \
	$(AM_CXXFLAGS) \
	-fvisibility=protected
%canon_reldir%_libnativebridge2_dummy_la_SOURCES = \
	%reldir%/DummyNativeBridge2.cpp

endif
