# Copyright 2012 The Android Open Source Project

lib_LTLIBRARIES += \
	%reldir%/libandroid-suspend-0.la

%canon_reldir%_libandroid_suspend_0_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	-I$(top_srcdir)/%reldir%/include
%canon_reldir%_libandroid_suspend_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_suspend_0_la_LIBADD = \
	liblog/libandroid-log-0.la \
	libcutils/libandroid-cutils-0.la
%canon_reldir%_libandroid_suspend_0_la_SOURCES = \
	%reldir%/autosuspend.c \
	%reldir%/autosuspend_autosleep.c \
	%reldir%/autosuspend_earlysuspend.c \
	%reldir%/autosuspend_wakeup_count.c \
	%reldir%/strerror_r.c

pkgconfig_DATA += \
	%reldir%/android-suspend-$(SYSTEMCORE_API_VERSION).pc
