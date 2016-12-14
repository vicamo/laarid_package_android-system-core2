# Copyright 2010 The Android Open Source Project

lib_LTLIBRARIES += \
	%reldir%/libandroid-sparse-0.la

%canon_reldir%_libandroid_sparse_0_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(ZLIB_CFLAGS) \
	-I$(top_srcdir)/%reldir%/include
%canon_reldir%_libandroid_sparse_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_sparse_0_la_LIBADD = \
	$(ZLIB_LIBS)
%canon_reldir%_libandroid_sparse_0_la_SOURCES = \
	%reldir%/backed_block.c \
	%reldir%/output_file.c \
	%reldir%/sparse.c \
	%reldir%/sparse_crc32.c \
	%reldir%/sparse_err.c \
	%reldir%/sparse_read.c

bin_PROGRAMS += \
	%reldir%/append2simg \
	%reldir%/img2simg \
	%reldir%/simg2img

# append2simg
# -----------
%canon_reldir%_append2simg_CPPFLAGS = \
	$(%canon_reldir%_libandroid_sparse_0_la_CPPFLAGS)
%canon_reldir%_append2simg_LDADD = \
	%reldir%/libandroid-sparse-0.la
%canon_reldir%_append2simg_SOURCES = \
	%reldir%/append2simg.c

# img2simg
# --------
%canon_reldir%_img2simg_CPPFLAGS = \
	$(%canon_reldir%_libandroid_sparse_0_la_CPPFLAGS)
%canon_reldir%_img2simg_LDADD = \
	%reldir%/libandroid-sparse-0.la
%canon_reldir%_img2simg_SOURCES = \
	%reldir%/img2simg.c

# simg2img
# --------
%canon_reldir%_simg2img_CPPFLAGS = \
	$(%canon_reldir%_libandroid_sparse_0_la_CPPFLAGS)
%canon_reldir%_simg2img_LDADD = \
	%reldir%/libandroid-sparse-0.la
%canon_reldir%_simg2img_SOURCES = \
	%reldir%/simg2img.c

bin_SCRIPTS += \
	%reldir%/simg_dump.py

pkgconfig_DATA += \
	%reldir%/android-sparse-$(SYSTEMCORE_API_VERSION).pc
