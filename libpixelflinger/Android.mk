lib_LTLIBRARIES += \
	%reldir%/libandroid-pixelflinger.la

%canon_reldir%_libandroid_pixelflinger_la_SOURCES = \
	%reldir%/codeflinger/ARMAssemblerInterface.cpp \
	%reldir%/codeflinger/ARMAssemblerInterface.h \
	%reldir%/codeflinger/ARMAssemblerProxy.cpp \
	%reldir%/codeflinger/ARMAssemblerProxy.h \
	%reldir%/codeflinger/CodeCache.cpp \
	%reldir%/codeflinger/CodeCache.h \
	%reldir%/codeflinger/GGLAssembler.cpp \
	%reldir%/codeflinger/GGLAssembler.h \
	%reldir%/codeflinger/load_store.cpp \
	%reldir%/codeflinger/blending.cpp \
	%reldir%/codeflinger/texturing.cpp \
	%reldir%/codeflinger/tinyutils/smartpointer.h \
	%reldir%/include/private/pixelflinger/ggl_context.h \
	%reldir%/include/private/pixelflinger/ggl_fixed.h \
	%reldir%/fixed.cpp \
	%reldir%/picker.cpp \
	%reldir%/picker.h \
	%reldir%/pixelflinger.cpp \
	%reldir%/trap.cpp \
	%reldir%/trap.h \
	%reldir%/scanline.cpp \
	%reldir%/scanline.h \
	%reldir%/format.cpp \
	%reldir%/clear.cpp \
	%reldir%/clear.h \
	%reldir%/raster.cpp \
	%reldir%/raster.h \
	%reldir%/buffer.cpp \
	%reldir%/buffer.h
EXTRA_DIST += \
	%reldir%/codeflinger/dlmalloc/malloc.c
%canon_reldir%_libandroid_pixelflinger_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS) \
	$(LOG_CFLAGS) \
	$(CUTILS_CFLAGS) \
	-I$(srcdir)/%reldir% \
	-I$(srcdir)/%reldir%/include
%canon_reldir%_libandroid_pixelflinger_la_CFLAGS = \
	$(AM_CFLAGS) \
	-fstrict-aliasing \
	-fomit-frame-pointer
%canon_reldir%_libandroid_pixelflinger_la_CXXFLAGS = \
	$(AM_CXXFLAGS) \
	-fstrict-aliasing \
	-fomit-frame-pointer

if CPU_ARM
%canon_reldir%_libandroid_pixelflinger_la_SOURCES += \
	%reldir%/codeflinger/ARMAssembler.cpp \
	%reldir%/codeflinger/ARMAssembler.h \
	%reldir%/codeflinger/armreg.h \
	%reldir%/codeflinger/disassem.c \
	%reldir%/codeflinger/disassem.h
if CPU_ARM_HAVE_DSP
%canon_reldir%_libandroid_pixelflinger_la_SOURCES += \
	%reldir%/col32cb16blend.S \
	%reldir%/t32cb16blend.S
if CPU_ARM_HAVE_NEON
%canon_reldir%_libandroid_pixelflinger_la_SOURCES += \
	%reldir%/col32cb16blend_neon.S
%canon_reldir%_libandroid_pixelflinger_la_CPPFLAGS += \
	-D__ARM_HAVE_NEON
endif # CPU_ARM_HAVE_NEON
endif # CPU_ARM_HAVE_DSP
else
if CPU_AARCH64
%canon_reldir%_libandroid_pixelflinger_la_SOURCES += \
	%reldir%/codeflinger/Arm64Assembler.cpp \
	%reldir%/codeflinger/Arm64Assembler.h \
	%reldir%/codeflinger/Arm64Disassembler.cpp \
	%reldir%/codeflinger/Arm64Disassembler.h \
	%reldir%/arch-arm64/col32cb16blend.S \
	%reldir%/arch-arm64/t32cb16blend.S
else
if CPU_MIPS
%canon_reldir%_libandroid_pixelflinger_la_SOURCES += \
	%reldir%/codeflinger/MIPSAssembler.cpp \
	%reldir%/codeflinger/MIPSAssembler.h \
	%reldir%/codeflinger/mips_disassem.c \
	%reldir%/codeflinger/mips_disassem.h \
	%reldir%/codeflinger/mips_opcode.h \
	%reldir%/arch-mips/t32cb16blend.S
else
if CPU_MIPS64
%canon_reldir%_libandroid_pixelflinger_la_SOURCES += \
	%reldir%/codeflinger/MIPSAssembler.cpp \
	%reldir%/codeflinger/MIPSAssembler.h \
	%reldir%/codeflinger/MIPS64Assembler.cpp \
	%reldir%/codeflinger/MIPS64Assembler.h \
	%reldir%/codeflinger/mips_disassem.h \
	%reldir%/codeflinger/mips_opcode.h \
	%reldir%/codeflinger/mips64_disassem.c \
	%reldir%/codeflinger/mips64_disassem.h \
	%reldir%/arch-mips64/col32cb16blend.S \
	%reldir%/arch-mips64/t32cb16blend.S
endif # CPU_MIPS64
endif # CPU_MIPS
endif # CPU_AARCH64
endif # CPU_ARM

%canon_reldir%_libandroid_pixelflinger_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_pixelflinger_la_LIBADD = \
	$(LOG_LIBS) \
	$(CUTILS_LIBS) \
	libutils/libandroid-utils.la

%canon_reldir%_libandroid_pixelflinger_incdir = $(androidincdir)/pixelflinger
%canon_reldir%_libandroid_pixelflinger_inc_HEADERS = \
	%reldir%/include/pixelflinger/format.h \
	%reldir%/include/pixelflinger/pixelflinger.h

pkgconfig_DATA += \
	%reldir%/android-pixelflinger-$(LAARID_API_VERSION).pc

include $(srcdir)/%reldir%/tests/Android.mk
