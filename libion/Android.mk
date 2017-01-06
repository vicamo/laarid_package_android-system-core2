lib_LTLIBRARIES += \
	%reldir%/libandroid-ion.la

%canon_reldir%_libandroid_ion_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS) \
	-I$(srcdir)/%reldir%/include \
	-I$(srcdir)/%reldir%/kernel-headers
%canon_reldir%_libandroid_ion_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_ion_la_LIBADD = \
	liblog/libandroid-log.la
%canon_reldir%_libandroid_ion_la_SOURCES = \
	%reldir%/ion.c

%canon_reldir%_libandroid_ion_incdir = $(androidincdir)/ion
%canon_reldir%_libandroid_ion_inc_HEADERS = \
	%reldir%/include/ion/ion.h

%canon_reldir%_libandroid_ion_kernel_incdir = $(includedir)/linux
%canon_reldir%_libandroid_ion_kernel_inc_HEADERS = \
	%reldir%/kernel-headers/linux/ion.h \
	%reldir%/kernel-headers/linux/ion_test.h

noinst_PROGRAMS += \
	%reldir%/iontest
%canon_reldir%_iontest_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS) \
	-I$(srcdir)/%reldir%/include \
	-I$(srcdir)/%reldir%/kernel-headers
%canon_reldir%_iontest_LDADD = \
	liblog/libandroid-log.la \
	%reldir%/libandroid-ion.la
%canon_reldir%_iontest_SOURCES = \
	%reldir%/ion_test.c

pkgconfig_DATA += \
	%reldir%/android-ion-$(SYSTEMCORE_API_VERSION).pc

include %reldir%/tests/Android.mk
