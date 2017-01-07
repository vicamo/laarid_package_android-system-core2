# Copyright 2013 The Android Open Source Project

if HAVE_GTEST
check_PROGRAMS += \
	%reldir%/rsa_test \
	%reldir%/ecdsa_test

TESTS += \
	%reldir%/rsa_test \
	%reldir%/ecdsa_test

%canon_reldir%_rsa_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(GTEST_CPPFLAGS)
%canon_reldir%_rsa_test_LDADD = \
	libmincrypt/libandroid-mincrypt.la \
	$(GTEST_LIBS)
%canon_reldir%_rsa_test_DEPENDENCIES = \
	libmincrypt/libandroid-mincrypt.la \
	$(GTEST_LIBS)
%canon_reldir%_rsa_test_SOURCES = \
	%reldir%/rsa_test.c

%canon_reldir%_ecdsa_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(GTEST_CPPFLAGS)
%canon_reldir%_ecdsa_test_LDADD = \
	libmincrypt/libandroid-mincrypt.la \
	$(GTEST_LIBS)
%canon_reldir%_ecdsa_test_DEPENDENCIES = \
	libmincrypt/libandroid-mincrypt.la \
	$(GTEST_LIBS)
%canon_reldir%_ecdsa_test_SOURCES = \
	%reldir%/ecdsa_test.c
endif
