Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 50FF748B6
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Dec 2003 04:11:15 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Date: Sun, 14 Dec 2003 12:11:07 +0100
MIME-Version: 1.0
Message-Id: <200312141209.28283.deller@gmx.de>
Content-Type: text/plain;
  charset="us-ascii"
Subject: [parisc-linux] strange GNU ld / libgcc_s.so problems
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I'm trying to compile KDE and during one step the following command is exec=
uted:

/usr/lib/gcc-lib/hppa-linux/3.3.2/collect2 --verbose --eh-frame-hdr -dynami=
c-linker /lib/ld.so.1 -o .libs/meinproc /usr/lib/gcc-lib/hppa-linux/3.3.2/.=
=2E/../../crt1.o /usr/lib/gcc-lib/hppa-linux/3.3.2/../../../crti.o /usr/lib=
/gcc-lib/hppa-linux/3.3.2/crtbegin.o -L/usr/X11R6/lib -L/opt/kde/qt/lib -L/=
opt/kde/lib -L/usr/lib -L/usr/lib/gcc-lib/hppa-linux/3.3.2 -L/usr/lib/gcc-l=
ib/hppa-linux/3.3.2/../../.. meinproc.o xslt_pure.o /usr/lib/libgcc_s.so.1 =
=2E/.libs/libkbzipfilter_dummy.a /home/cvs/xc/c3000-debian/kdelibs/kio/.lib=
s/libkio.so /home/cvs/xc/c3000-debian/kdelibs/kdeui/.libs/libkdeui.so /home=
/cvs/xc/c3000-debian/kdelibs/kdesu/.libs/libkdesu.so /home/cvs/xc/c3000-deb=
ian/kdelibs/kdecore/.libs/libkdecore.so /home/cvs/xc/c3000-debian/kdelibs/d=
cop/.libs/libDCOP.so -lresolv /usr/lib/libart_lgpl_2.so /home/cvs/xc/c3000-=
debian/kdelibs/kdefx/.libs/libkdefx.so /opt/qt-copy/lib/libqt-mt.so /usr/li=
b/libXft.so /usr/lib/libfreetype.so -lfontconfig -ldl -lpng -lXext -lSM -lI=
CE /usr/lib/libXrender.so -lX11 -lutil  -lbz2 /usr/lib/libxslt.so /usr/lib/=
libxml2.so /usr/lib/libgcc_s.so.1 -lz -lpthread --rpath /opt/kde/lib --rpat=
h /opt/qt-copy/lib --rpath /opt/kde/qt/lib --rpath /usr/X11R6/lib --rpath /=
usr/lib -lstdc++ -lm -lgcc_s -lgcc -lgcc -lc -lgcc_s -lgcc /usr/lib/gcc-lib=
/hppa-linux/3.3.2/crtend.o /usr/lib/gcc-lib/hppa-linux/3.3.2/../../../crtn.o

Below is the output and I don't understand the part which I marked with "##=
####".
Why does collect2 suddenly tries to resolve libstdc++.so while it searched =
for=20
libgcc_s.so ? All other libraries (e.g.-lutil) behave IMHO normal.
Any ideas ? This seems to me like a bug in gcc 3.3.2, but I'm no expert her=
e.

Thanks,
Helge

GNU ld version 2.14.90.0.7 20031029 Debian GNU/Linux
  Supported emulations:
   hppalinux
   hppa64linux
using internal linker script:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
/* Script for -z combreloc: combine and sort reloc sections */
OUTPUT_FORMAT("elf32-hppa-linux", "elf32-hppa-linux",
	      "elf32-hppa-linux")
OUTPUT_ARCH(hppa:hppa1.1)
ENTRY(_start)
SEARCH_DIR("/usr/hppa-linux/lib"); SEARCH_DIR("/usr/lib"); SEARCH_DIR("/usr=
/local/lib"); SEARCH_DIR("/lib");
/* Do we need any of these for elf?
   __DYNAMIC =3D 0;    */
SECTIONS
{
  /* Read-only sections, merged into text segment: */
  PROVIDE (__executable_start =3D 0x10000); . =3D 0x10000 + SIZEOF_HEADERS;
  .interp         : { *(.interp) }
  .hash           : { *(.hash) }
  .dynsym         : { *(.dynsym) }
  .dynstr         : { *(.dynstr) }
  .gnu.version    : { *(.gnu.version) }
  .gnu.version_d  : { *(.gnu.version_d) }
  .gnu.version_r  : { *(.gnu.version_r) }
  .rel.dyn        :
    {
      *(.rel.init)
      *(.rel.text .rel.text.* .rel.gnu.linkonce.t.*)
      *(.rel.fini)
      *(.rel.rodata .rel.rodata.* .rel.gnu.linkonce.r.*)
      *(.rel.data .rel.data.* .rel.gnu.linkonce.d.*)
      *(.rel.tdata .rel.tdata.* .rel.gnu.linkonce.td.*)
      *(.rel.tbss .rel.tbss.* .rel.gnu.linkonce.tb.*)
      *(.rel.ctors)
      *(.rel.dtors)
      *(.rel.got)
      *(.rel.sdata .rel.sdata.* .rel.gnu.linkonce.s.*)
      *(.rel.sbss .rel.sbss.* .rel.gnu.linkonce.sb.*)
      *(.rel.sdata2 .rel.sdata2.* .rel.gnu.linkonce.s2.*)
      *(.rel.sbss2 .rel.sbss2.* .rel.gnu.linkonce.sb2.*)
      *(.rel.bss .rel.bss.* .rel.gnu.linkonce.b.*)
    }
  .rela.dyn       :
    {
      *(.rela.init)
      *(.rela.text .rela.text.* .rela.gnu.linkonce.t.*)
      *(.rela.fini)
      *(.rela.rodata .rela.rodata.* .rela.gnu.linkonce.r.*)
      *(.rela.data .rela.data.* .rela.gnu.linkonce.d.*)
      *(.rela.tdata .rela.tdata.* .rela.gnu.linkonce.td.*)
      *(.rela.tbss .rela.tbss.* .rela.gnu.linkonce.tb.*)
      *(.rela.ctors)
      *(.rela.dtors)
      *(.rela.got)
      *(.rela.sdata .rela.sdata.* .rela.gnu.linkonce.s.*)
      *(.rela.sbss .rela.sbss.* .rela.gnu.linkonce.sb.*)
      *(.rela.sdata2 .rela.sdata2.* .rela.gnu.linkonce.s2.*)
      *(.rela.sbss2 .rela.sbss2.* .rela.gnu.linkonce.sb2.*)
      *(.rela.bss .rela.bss.* .rela.gnu.linkonce.b.*)
    }
  .rel.plt        : { *(.rel.plt) }
  .rela.plt       : { *(.rela.plt) }
  .init           :
  {
    KEEP (*(.init))
  } =3D0x08000240
  .text           :
  {
    *(.text .stub .text.* .gnu.linkonce.t.*)
    /* .gnu.warning sections are handled specially by elf32.em.  */
    *(.gnu.warning)
  } =3D0x08000240
  .fini           :
  {
    KEEP (*(.fini))
  } =3D0x08000240
  PROVIDE (__etext =3D .);
  PROVIDE (_etext =3D .);
  PROVIDE (etext =3D .);
  .rodata         : { *(.rodata .rodata.* .gnu.linkonce.r.*) }
  .rodata1        : { *(.rodata1) }
  .sdata2         : { *(.sdata2 .sdata2.* .gnu.linkonce.s2.*) }
  .sbss2          : { *(.sbss2 .sbss2.* .gnu.linkonce.sb2.*) }
  .PARISC.unwind   : { *(.PARISC.unwind) }
  .eh_frame_hdr : { *(.eh_frame_hdr) }
  /* Adjust the address for the data segment.  We want to adjust up to
     the same address within the page on the next page up.  */
  . =3D ALIGN(0x10000) + (. & (0x10000 - 1));
  /* Ensure the __preinit_array_start label is properly aligned.  We
     could instead move the label definition inside the section, but
     the linker would then create the section even if it turns out to
     be empty, which isn't pretty.  */
  . =3D ALIGN(32 / 8);
  PROVIDE (__preinit_array_start =3D .);
  .preinit_array     : { *(.preinit_array) }
  PROVIDE (__preinit_array_end =3D .);
  PROVIDE (__init_array_start =3D .);
  .init_array     : { *(.init_array) }
  PROVIDE (__init_array_end =3D .);
  PROVIDE (__fini_array_start =3D .);
  .fini_array     : { *(.fini_array) }
  PROVIDE (__fini_array_end =3D .);
  .data           :
  {
    PROVIDE ($global$ =3D .);
    *(.data .data.* .gnu.linkonce.d.*)
    SORT(CONSTRUCTORS)
  }
  .data1          : { *(.data1) }
  .tdata	  : { *(.tdata .tdata.* .gnu.linkonce.td.*) }
  .tbss		  : { *(.tbss .tbss.* .gnu.linkonce.tb.*) *(.tcommon) }
  .eh_frame       : { KEEP (*(.eh_frame)) }
  .gcc_except_table   : { *(.gcc_except_table) }
  .dynamic        : { *(.dynamic) }
  .ctors          :
  {
    /* gcc uses crtbegin.o to find the start of
       the constructors, so we make sure it is
       first.  Because this is a wildcard, it
       doesn't matter if the user does not
       actually link against crtbegin.o; the
       linker won't look for a file to match a
       wildcard.  The wildcard also means that it
       doesn't matter which directory crtbegin.o
       is in.  */
    KEEP (*crtbegin*.o(.ctors))
    /* We don't want to include the .ctor section from
       from the crtend.o file until after the sorted ctors.
       The .ctor section from the crtend file contains the
       end of ctors marker and it must be last */
    KEEP (*(EXCLUDE_FILE (*crtend*.o ) .ctors))
    KEEP (*(SORT(.ctors.*)))
    KEEP (*(.ctors))
  }
  .dtors          :
  {
    KEEP (*crtbegin*.o(.dtors))
    KEEP (*(EXCLUDE_FILE (*crtend*.o ) .dtors))
    KEEP (*(SORT(.dtors.*)))
    KEEP (*(.dtors))
  }
  .jcr            : { KEEP (*(.jcr)) }
  .plt            : { *(.plt) }
  .got            : { *(.got.plt) *(.got) }
  /* We want the small data sections together, so single-instruction offsets
     can access them all, and initialized data all before uninitialized, so
     we can shorten the on-disk segment size.  */
  .sdata          :
  {
    *(.sdata .sdata.* .gnu.linkonce.s.*)
  }
  _edata =3D .;
  PROVIDE (edata =3D .);
  __bss_start =3D .;
  .sbss           :
  {
    PROVIDE (__sbss_start =3D .);
    PROVIDE (___sbss_start =3D .);
    *(.dynsbss)
    *(.sbss .sbss.* .gnu.linkonce.sb.*)
    *(.scommon)
    PROVIDE (__sbss_end =3D .);
    PROVIDE (___sbss_end =3D .);
  }
  .bss            :
  {
   *(.dynbss)
   *(.bss .bss.* .gnu.linkonce.b.*)
   *(COMMON)
   /* Align here to ensure that the .bss section occupies space up to
      _end.  Align after .bss to ensure correct alignment even if the
      .bss section disappears because there are no input sections.  */
   . =3D ALIGN(32 / 8);
  }
  . =3D ALIGN(32 / 8);
  _end =3D .;
  PROVIDE (end =3D .);
  /* Stabs debugging sections.  */
  .stab          0 : { *(.stab) }
  .stabstr       0 : { *(.stabstr) }
  .stab.excl     0 : { *(.stab.excl) }
  .stab.exclstr  0 : { *(.stab.exclstr) }
  .stab.index    0 : { *(.stab.index) }
  .stab.indexstr 0 : { *(.stab.indexstr) }
  .comment       0 : { *(.comment) }
  /* DWARF debug sections.
     Symbols in the DWARF debugging sections are relative to the beginning
     of the section so we begin them at 0.  */
  /* DWARF 1 */
  .debug          0 : { *(.debug) }
  .line           0 : { *(.line) }
  /* GNU DWARF 1 extensions */
  .debug_srcinfo  0 : { *(.debug_srcinfo) }
  .debug_sfnames  0 : { *(.debug_sfnames) }
  /* DWARF 1.1 and DWARF 2 */
  .debug_aranges  0 : { *(.debug_aranges) }
  .debug_pubnames 0 : { *(.debug_pubnames) }
  /* DWARF 2 */
  .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
  .debug_abbrev   0 : { *(.debug_abbrev) }
  .debug_line     0 : { *(.debug_line) }
  .debug_frame    0 : { *(.debug_frame) }
  .debug_str      0 : { *(.debug_str) }
  .debug_loc      0 : { *(.debug_loc) }
  .debug_macinfo  0 : { *(.debug_macinfo) }
  /* SGI/MIPS DWARF 2 extensions */
  .debug_weaknames 0 : { *(.debug_weaknames) }
  .debug_funcnames 0 : { *(.debug_funcnames) }
  .debug_typenames 0 : { *(.debug_typenames) }
  .debug_varnames  0 : { *(.debug_varnames) }
  /DISCARD/ : { *(.note.GNU-stack) }
}


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
attempt to open /usr/lib/gcc-lib/hppa-linux/3.3.2/../../../crt1.o succeeded
/usr/lib/gcc-lib/hppa-linux/3.3.2/../../../crt1.o
attempt to open /usr/lib/gcc-lib/hppa-linux/3.3.2/../../../crti.o succeeded
/usr/lib/gcc-lib/hppa-linux/3.3.2/../../../crti.o
attempt to open /usr/lib/gcc-lib/hppa-linux/3.3.2/crtbegin.o succeeded
/usr/lib/gcc-lib/hppa-linux/3.3.2/crtbegin.o
attempt to open meinproc.o succeeded
meinproc.o
attempt to open xslt_pure.o succeeded
xslt_pure.o
attempt to open /usr/lib/libgcc_s.so.1 succeeded
/usr/lib/libgcc_s.so.1
attempt to open ./.libs/libkbzipfilter_dummy.a succeeded
(./.libs/libkbzipfilter_dummy.a)kbzip2filter.o
attempt to open /home/cvs/xc/c3000-debian/kdelibs/kio/.libs/libkio.so succe=
eded
/home/cvs/xc/c3000-debian/kdelibs/kio/.libs/libkio.so
attempt to open /home/cvs/xc/c3000-debian/kdelibs/kdeui/.libs/libkdeui.so s=
ucceeded
/home/cvs/xc/c3000-debian/kdelibs/kdeui/.libs/libkdeui.so
attempt to open /home/cvs/xc/c3000-debian/kdelibs/kdesu/.libs/libkdesu.so s=
ucceeded
/home/cvs/xc/c3000-debian/kdelibs/kdesu/.libs/libkdesu.so
attempt to open /home/cvs/xc/c3000-debian/kdelibs/kdecore/.libs/libkdecore.=
so succeeded
/home/cvs/xc/c3000-debian/kdelibs/kdecore/.libs/libkdecore.so
attempt to open /home/cvs/xc/c3000-debian/kdelibs/dcop/.libs/libDCOP.so suc=
ceeded
/home/cvs/xc/c3000-debian/kdelibs/dcop/.libs/libDCOP.so
attempt to open /usr/X11R6/lib/libresolv.so failed
attempt to open /usr/X11R6/lib/libresolv.a failed
attempt to open /opt/kde/qt/lib/libresolv.so failed
attempt to open /opt/kde/qt/lib/libresolv.a failed
attempt to open /opt/kde/lib/libresolv.so failed
attempt to open /opt/kde/lib/libresolv.a failed
attempt to open /usr/lib/libresolv.so succeeded
=2Dlresolv (/usr/lib/libresolv.so)
attempt to open /usr/lib/libart_lgpl_2.so succeeded
/usr/lib/libart_lgpl_2.so
attempt to open /home/cvs/xc/c3000-debian/kdelibs/kdefx/.libs/libkdefx.so s=
ucceeded
/home/cvs/xc/c3000-debian/kdelibs/kdefx/.libs/libkdefx.so
attempt to open /opt/qt-copy/lib/libqt-mt.so succeeded
/opt/qt-copy/lib/libqt-mt.so
attempt to open /usr/lib/libXft.so succeeded
/usr/lib/libXft.so
attempt to open /usr/lib/libfreetype.so succeeded
/usr/lib/libfreetype.so
attempt to open /usr/X11R6/lib/libfontconfig.so failed
attempt to open /usr/X11R6/lib/libfontconfig.a failed
attempt to open /opt/kde/qt/lib/libfontconfig.so failed
attempt to open /opt/kde/qt/lib/libfontconfig.a failed
attempt to open /opt/kde/lib/libfontconfig.so failed
attempt to open /opt/kde/lib/libfontconfig.a failed
attempt to open /usr/lib/libfontconfig.so succeeded
=2Dlfontconfig (/usr/lib/libfontconfig.so)
attempt to open /usr/X11R6/lib/libdl.so failed
attempt to open /usr/X11R6/lib/libdl.a failed
attempt to open /opt/kde/qt/lib/libdl.so failed
attempt to open /opt/kde/qt/lib/libdl.a failed
attempt to open /opt/kde/lib/libdl.so failed
attempt to open /opt/kde/lib/libdl.a failed
attempt to open /usr/lib/libdl.so succeeded
=2Dldl (/usr/lib/libdl.so)
attempt to open /usr/X11R6/lib/libpng.so failed
attempt to open /usr/X11R6/lib/libpng.a failed
attempt to open /opt/kde/qt/lib/libpng.so failed
attempt to open /opt/kde/qt/lib/libpng.a failed
attempt to open /opt/kde/lib/libpng.so failed
attempt to open /opt/kde/lib/libpng.a failed
attempt to open /usr/lib/libpng.so succeeded
=2Dlpng (/usr/lib/libpng.so)
attempt to open /usr/X11R6/lib/libXext.so succeeded
=2DlXext (/usr/X11R6/lib/libXext.so)
attempt to open /usr/X11R6/lib/libSM.so succeeded
=2DlSM (/usr/X11R6/lib/libSM.so)
attempt to open /usr/X11R6/lib/libICE.so succeeded
=2DlICE (/usr/X11R6/lib/libICE.so)
attempt to open /usr/lib/libXrender.so succeeded
/usr/lib/libXrender.so
attempt to open /usr/X11R6/lib/libX11.so succeeded
=2DlX11 (/usr/X11R6/lib/libX11.so)
attempt to open /usr/X11R6/lib/libutil.so failed
attempt to open /usr/X11R6/lib/libutil.a failed
attempt to open /opt/kde/qt/lib/libutil.so failed
attempt to open /opt/kde/qt/lib/libutil.a failed
attempt to open /opt/kde/lib/libutil.so failed
attempt to open /opt/kde/lib/libutil.a failed
attempt to open /usr/lib/libutil.so succeeded
=2Dlutil (/usr/lib/libutil.so)
attempt to open /usr/X11R6/lib/libbz2.so failed
attempt to open /usr/X11R6/lib/libbz2.a failed
attempt to open /opt/kde/qt/lib/libbz2.so failed
attempt to open /opt/kde/qt/lib/libbz2.a failed
attempt to open /opt/kde/lib/libbz2.so failed
attempt to open /opt/kde/lib/libbz2.a failed
attempt to open /usr/lib/libbz2.so succeeded
=2Dlbz2 (/usr/lib/libbz2.so)
attempt to open /usr/lib/libxslt.so succeeded
/usr/lib/libxslt.so
attempt to open /usr/lib/libxml2.so succeeded
/usr/lib/libxml2.so
attempt to open /usr/lib/libgcc_s.so.1 succeeded
/usr/lib/libgcc_s.so.1
attempt to open /usr/X11R6/lib/libz.so failed
attempt to open /usr/X11R6/lib/libz.a failed
attempt to open /opt/kde/qt/lib/libz.so failed
attempt to open /opt/kde/qt/lib/libz.a failed
attempt to open /opt/kde/lib/libz.so failed
attempt to open /opt/kde/lib/libz.a failed
attempt to open /usr/lib/libz.so succeeded
=2Dlz (/usr/lib/libz.so)
attempt to open /usr/X11R6/lib/libpthread.so failed
attempt to open /usr/X11R6/lib/libpthread.a failed
attempt to open /opt/kde/qt/lib/libpthread.so failed
attempt to open /opt/kde/qt/lib/libpthread.a failed
attempt to open /opt/kde/lib/libpthread.so failed
attempt to open /opt/kde/lib/libpthread.a failed
attempt to open /usr/lib/libpthread.so succeeded
opened script file /usr/lib/libpthread.so
opened script file /usr/lib/libpthread.so
attempt to open /lib/libpthread.so.0 succeeded
/lib/libpthread.so.0
attempt to open /usr/lib/libpthread_nonshared.a succeeded
attempt to open /usr/X11R6/lib/libstdc++.so failed
attempt to open /usr/X11R6/lib/libstdc++.a failed
attempt to open /opt/kde/qt/lib/libstdc++.so failed
attempt to open /opt/kde/qt/lib/libstdc++.a failed
attempt to open /opt/kde/lib/libstdc++.so failed
attempt to open /opt/kde/lib/libstdc++.a failed
attempt to open /usr/lib/libstdc++.so succeeded
=2Dlstdc++ (/usr/lib/libstdc++.so)
attempt to open /usr/X11R6/lib/libm.so failed
attempt to open /usr/X11R6/lib/libm.a failed
attempt to open /opt/kde/qt/lib/libm.so failed
attempt to open /opt/kde/qt/lib/libm.a failed
attempt to open /opt/kde/lib/libm.so failed
attempt to open /opt/kde/lib/libm.a failed
attempt to open /usr/lib/libm.so succeeded
=2Dlm (/usr/lib/libm.so)
attempt to open /usr/X11R6/lib/libgcc_s.so failed
attempt to open /usr/X11R6/lib/libgcc_s.a failed
attempt to open /opt/kde/qt/lib/libgcc_s.so failed
attempt to open /opt/kde/qt/lib/libgcc_s.a failed
attempt to open /opt/kde/lib/libgcc_s.so failed
attempt to open /opt/kde/lib/libgcc_s.a failed
attempt to open /usr/lib/libgcc_s.so succeeded
=2Dlgcc_s (/usr/lib/libgcc_s.so)
attempt to open /usr/X11R6/lib/libgcc.so failed
attempt to open /usr/X11R6/lib/libgcc.a failed
attempt to open /opt/kde/qt/lib/libgcc.so failed
attempt to open /opt/kde/qt/lib/libgcc.a failed
attempt to open /opt/kde/lib/libgcc.so failed
attempt to open /opt/kde/lib/libgcc.a failed
attempt to open /usr/lib/libgcc.so failed
attempt to open /usr/lib/libgcc.a failed
attempt to open /usr/lib/gcc-lib/hppa-linux/3.3.2/libgcc.so failed
attempt to open /usr/lib/gcc-lib/hppa-linux/3.3.2/libgcc.a succeeded
(/usr/lib/gcc-lib/hppa-linux/3.3.2/libgcc.a)_divU.oS
(/usr/lib/gcc-lib/hppa-linux/3.3.2/libgcc.a)_div_const.oS
(/usr/lib/gcc-lib/hppa-linux/3.3.2/libgcc.a)_dyncall.oS
(/usr/lib/gcc-lib/hppa-linux/3.3.2/libgcc.a)fptr.oS
attempt to open /usr/X11R6/lib/libgcc.so failed
attempt to open /usr/X11R6/lib/libgcc.a failed
attempt to open /opt/kde/qt/lib/libgcc.so failed
attempt to open /opt/kde/qt/lib/libgcc.a failed
attempt to open /opt/kde/lib/libgcc.so failed
attempt to open /opt/kde/lib/libgcc.a failed
attempt to open /usr/lib/libgcc.so failed
attempt to open /usr/lib/libgcc.a failed
attempt to open /usr/lib/gcc-lib/hppa-linux/3.3.2/libgcc.so failed
attempt to open /usr/lib/gcc-lib/hppa-linux/3.3.2/libgcc.a succeeded
attempt to open /usr/X11R6/lib/libc.so failed
attempt to open /usr/X11R6/lib/libc.a failed
attempt to open /opt/kde/qt/lib/libc.so failed
attempt to open /opt/kde/qt/lib/libc.a failed
attempt to open /opt/kde/lib/libc.so failed
attempt to open /opt/kde/lib/libc.a failed
attempt to open /usr/lib/libc.so succeeded
opened script file /usr/lib/libc.so
opened script file /usr/lib/libc.so
attempt to open /lib/libc.so.6 succeeded
/lib/libc.so.6
attempt to open /usr/lib/libc_nonshared.a succeeded
(/usr/lib/libc_nonshared.a)elf-init.oS
attempt to open /usr/X11R6/lib/libgcc_s.so failed
attempt to open /usr/X11R6/lib/libgcc_s.a failed
attempt to open /opt/kde/qt/lib/libgcc_s.so failed
attempt to open /opt/kde/qt/lib/libgcc_s.a failed
attempt to open /opt/kde/lib/libgcc_s.so failed
attempt to open /opt/kde/lib/libgcc_s.a failed
attempt to open /usr/lib/libgcc_s.so succeeded
=2Dlgcc_s (//usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Res=
ume@GCC_3.0'
/usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Register@GCC_3.=
0'
/usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_RaiseException@=
GCC_3.0'
/usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Unregister@GCC_=
3.0'
/usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Resume_or_Rethr=
ow@GCC_3.3'
usr/lib/libgcc_s.so)

##### ^^^ Why does /usr/lib/libstdc++.so comes into the game here ?
##### The double "//" seems suspect too, since it continues with "usr/lib/l=
ibgcc_s.so"=20
##### in the last line without the trailing "/". It seems this "string" was=
 broken up
##### right in the middle....

attempt to open /usr/X11R6/lib/libgcc.so failed
attempt to open /usr/X11R6/lib/libgcc.a failed
attempt to open /opt/kde/qt/lib/libgcc.so failed
attempt to open /opt/kde/qt/lib/libgcc.a failed
attempt to open /opt/kde/lib/libgcc.so failed
attempt to open /opt/kde/lib/libgcc.a failed
attempt to open /usr/lib/libgcc.so failed
attempt to open /usr/lib/libgcc.a failed
attempt to open /usr/lib/gcc-lib/hppa-linux/3.3.2/libgcc.so failed
attempt to open /usr/lib/gcc-lib/hppa-linux/3.3.2/libgcc.a succeeded
attempt to open /usr/lib/gcc-lib/hppa-linux/3.3.2/crtend.o succeeded
/usr/lib/gcc-lib/hppa-linux/3.3.2/crtend.o
attempt to open /usr/lib/gcc-lib/hppa-linux/3.3.2/../../../crtn.o succeeded
/usr/lib/gcc-lib/hppa-linux/3.3.2/../../../crtn.o
libfam.so.0 needed by /home/cvs/xc/c3000-debian/kdelibs/kio/.libs/libkio.so
found libfam.so.0 at /usr/lib/libfam.so.0
libexpat.so.1 needed by /usr/lib/libfontconfig.so
found libexpat.so.1 at /usr/lib/libexpat.so.1
ld.so.1 needed by /usr/lib/libdl.so
found ld.so.1 at /lib/ld.so.1
collect2: ld returned 1 exit status
