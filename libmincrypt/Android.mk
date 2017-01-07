# Copyright 2008 The Android Open Source Project
#
lib_LTLIBRARIES += \
	%reldir%/libandroid-mincrypt.la

%canon_reldir%_libandroid_mincrypt_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_mincrypt_la_SOURCES = \
	%reldir%/dsa_sig.c \
	%reldir%/p256.c \
	%reldir%/p256_ec.c \
	%reldir%/p256_ecdsa.c \
	%reldir%/rsa.c \
	%reldir%/sha.c \
	%reldir%/sha256.c

pkgconfig_DATA += \
	%reldir%/android-mincrypt-$(SYSTEMCORE_API_VERSION).pc

include $(srcdir)/%reldir%/test/Android.mk
