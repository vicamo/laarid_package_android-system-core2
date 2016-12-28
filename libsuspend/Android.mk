# Copyright 2012 The Android Open Source Project

lib_LTLIBRARIES += \
	%reldir%/libandroid-suspend.la

%canon_reldir%_libandroid_suspend_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	-I$(top_srcdir)/%reldir%/include
%canon_reldir%_libandroid_suspend_la_CFLAGS = \
	$(AM_CFLAGS) \
	$(PTHREAD_CFLAGS)
%canon_reldir%_libandroid_suspend_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_suspend_la_LIBADD = \
	$(PTHREAD_LIBS)\
	liblog/libandroid-log.la
%canon_reldir%_libandroid_suspend_la_SOURCES = \
	%reldir%/autosuspend.c \
	%reldir%/autosuspend_autosleep.c \
	%reldir%/autosuspend_earlysuspend.c \
	%reldir%/autosuspend_ops.h \
	%reldir%/autosuspend_wakeup_count.c \
	%reldir%/include/suspend/autosuspend.h \
	%reldir%/strerror_r.c

pkgconfig_DATA += \
	%reldir%/android-suspend-$(SYSTEMCORE_API_VERSION).pc
