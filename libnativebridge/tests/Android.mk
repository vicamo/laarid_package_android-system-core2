# Build the unit tests.
if HAVE_GTEST

include %reldir%/Android.nativebridge-dummy.mk

# Build the unit tests.
check_PROGRAMS += \
	%reldir%/CodeCacheCreate_test \
	%reldir%/CodeCacheExists_test \
	%reldir%/CodeCacheStatFail_test \
	%reldir%/CompleteFlow_test \
	%reldir%/InvalidCharsNativeBridge_test \
	%reldir%/NativeBridge2Signal_test \
	%reldir%/NativeBridgeVersion_test \
	%reldir%/NeedsNativeBridge_test \
	%reldir%/PreInitializeNativeBridge_test \
	%reldir%/PreInitializeNativeBridgeFail1_test \
	%reldir%/PreInitializeNativeBridgeFail2_test \
	%reldir%/ReSetupNativeBridge_test \
	%reldir%/UnavailableNativeBridge_test \
	%reldir%/ValidNameNativeBridge_test

TESTS += \
	%reldir%/CodeCacheCreate_test \
	%reldir%/CodeCacheExists_test \
	%reldir%/CodeCacheStatFail_test \
	%reldir%/CompleteFlow_test \
	%reldir%/InvalidCharsNativeBridge_test \
	%reldir%/NativeBridge2Signal_test \
	%reldir%/NativeBridgeVersion_test \
	%reldir%/NeedsNativeBridge_test \
	%reldir%/PreInitializeNativeBridge_test \
	%reldir%/PreInitializeNativeBridgeFail1_test \
	%reldir%/PreInitializeNativeBridgeFail2_test \
	%reldir%/ReSetupNativeBridge_test \
	%reldir%/UnavailableNativeBridge_test \
	%reldir%/ValidNameNativeBridge_test

%canon_reldir%_CodeCacheCreate_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_CodeCacheCreate_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_CodeCacheCreate_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_CodeCacheCreate_test_SOURCES = \
	%reldir%/CodeCacheCreate_test.cpp

%canon_reldir%_CodeCacheExists_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_CodeCacheExists_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_CodeCacheExists_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_CodeCacheExists_test_SOURCES = \
	%reldir%/CodeCacheExists_test.cpp

%canon_reldir%_CodeCacheStatFail_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_CodeCacheStatFail_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_CodeCacheStatFail_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_CodeCacheStatFail_test_SOURCES = \
	%reldir%/CodeCacheStatFail_test.cpp

%canon_reldir%_CompleteFlow_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_CompleteFlow_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_CompleteFlow_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_CompleteFlow_test_SOURCES = \
	%reldir%/CompleteFlow_test.cpp

%canon_reldir%_InvalidCharsNativeBridge_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_InvalidCharsNativeBridge_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_InvalidCharsNativeBridge_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_InvalidCharsNativeBridge_test_SOURCES = \
	%reldir%/InvalidCharsNativeBridge_test.cpp

%canon_reldir%_NativeBridge2Signal_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_NativeBridge2Signal_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_NativeBridge2Signal_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_NativeBridge2Signal_test_SOURCES = \
	%reldir%/NativeBridge2Signal_test.cpp

%canon_reldir%_NativeBridgeVersion_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_NativeBridgeVersion_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_NativeBridgeVersion_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_NativeBridgeVersion_test_SOURCES = \
	%reldir%/NativeBridgeVersion_test.cpp

%canon_reldir%_NeedsNativeBridge_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_NeedsNativeBridge_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_NeedsNativeBridge_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_NeedsNativeBridge_test_SOURCES = \
	%reldir%/NeedsNativeBridge_test.cpp

%canon_reldir%_PreInitializeNativeBridge_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_PreInitializeNativeBridge_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_PreInitializeNativeBridge_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_PreInitializeNativeBridge_test_SOURCES = \
	%reldir%/PreInitializeNativeBridge_test.cpp

%canon_reldir%_PreInitializeNativeBridgeFail1_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_PreInitializeNativeBridgeFail1_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_PreInitializeNativeBridgeFail1_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_PreInitializeNativeBridgeFail1_test_SOURCES = \
	%reldir%/PreInitializeNativeBridgeFail1_test.cpp

%canon_reldir%_PreInitializeNativeBridgeFail2_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_PreInitializeNativeBridgeFail2_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_PreInitializeNativeBridgeFail2_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_PreInitializeNativeBridgeFail2_test_SOURCES = \
	%reldir%/PreInitializeNativeBridgeFail2_test.cpp

%canon_reldir%_ReSetupNativeBridge_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_ReSetupNativeBridge_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_ReSetupNativeBridge_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_ReSetupNativeBridge_test_SOURCES = \
	%reldir%/ReSetupNativeBridge_test.cpp

%canon_reldir%_UnavailableNativeBridge_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_UnavailableNativeBridge_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_UnavailableNativeBridge_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_UnavailableNativeBridge_test_SOURCES = \
	%reldir%/UnavailableNativeBridge_test.cpp

%canon_reldir%_ValidNameNativeBridge_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(NATIVEHELPER_CFLAGS)
%canon_reldir%_ValidNameNativeBridge_test_LDADD = \
	$(LOG_LIBS) \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_ValidNameNativeBridge_test_DEPENDENCIES = \
	libnativebridge/libandroid-nativebridge.la \
	%reldir%/libnativebridge-dummy.la \
	$(GTEST_LIBS)
%canon_reldir%_ValidNameNativeBridge_test_SOURCES = \
	%reldir%/ValidNameNativeBridge_test.cpp

endif # HAVE_GTEST
