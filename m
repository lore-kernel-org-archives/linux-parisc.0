Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mout0.freenet.de (mout0.freenet.de [194.97.50.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3957E482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 19 Aug 2001 04:07:39 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
Reply-To: Reinhard.Gimbel@freenet.de
To: parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org
Date: Sun, 19 Aug 2001 12:07:27 +0200
Cc: matt@lackof.org, gcc@packages.debian.org, ossama@debian.org
MIME-Version: 1.0
Message-Id: <01081912061400.01092@octopus>
Subject: [parisc-linux] [palinux-0.9.2] Where are the compilers (c, c++) ?
List-ID: <linux-parisc.vger.kernel.org>

Hi folks !

After successfully installing palinux-0.9.2 on my 715/64
I'm looking for the compilers (c, c++) ...

At present I'm not able to build a new kernel or utilities
from their source code :-(

During the installation process I choose something like

task-devel-common
task-c
task-c++

According to dselect- and dpkg-inquiries several packages
I would suggest to install for a C development enviroment
were installed after the base installation was completed.

What was surprising me is that '/usr/bin/cc' was a symbolic
link to '/etc/alternatives/cc' which again was a symbolic
link to the missing 'cc.1.gz' (seems to be a man page ...
!?!). '/usr/bin/gcc' was a link to the missing 'gcc-3.0'

After removing the false symbolic links and (symbolic)
linking 'hppa64-linux-gcc' to 'gcc' and 'cc' I could get
at least a more or less valid 'cc -v' output.

The compilation of the well known trivial 'hello.c' led
to the message that 'stdio.h' could not been found.

Afterwards I tried to install some packages out of the
'more_packages'-folder by hand using dpkg. I tried it in
several different sequences but wihtout success.

Enclodes some 'dpkg --info' outputs, which are somewhat
confusing (at least for me at present ... :-)

----- 8< ----- 8< ----- 8< ----- 8< ----- 8< -----

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info ../base/gcc-3.0-base_1\:3.0-1_all.deb
 new debian package, version 2.0.
 size 34502 bytes: control archive= 801 bytes.
     376 bytes,    11 lines      control
     377 bytes,     5 lines      md5sums
     273 bytes,     8 lines   *  postinst             #!/bin/sh
     202 bytes,     6 lines   *  prerm                #!/bin/sh
 Package: gcc-3.0-base
 Version: 1:3.0-1
 Section: devel
 Priority: standard
 Architecture: all
 Installed-Size: 43
 Maintainer: Debian GCC maintainers 
<debian-gcc@lists.debian.org>
 Source: gcc-3.0 (3.0.ds9-1)
 Description: The GNU compiler collection (base package).
  This package contains files common to all languages and 
libraries
  contained in the GNU compiler collection (gcc).

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info 
binutils-hppa64_2.11.90.0.7-2.0.0.1_hppa.deb
 new debian package, version 2.0.
 size 6386660 bytes: control archive= 1739 bytes.
     377 bytes,    11 lines      control
    2980 bytes,    44 lines      md5sums
     285 bytes,     8 lines   *  postinst             #!/bin/sh
     208 bytes,     6 lines   *  prerm                #!/bin/sh
 Package: binutils-hppa64
 Version: 2.11.90.0.7-2.0.0.1
 Section: alien
 Priority: extra
 Architecture: hppa
 Depends: libc6 (>= 2.2.3-1)
 Installed-Size: 17028
 Maintainer: Matt Taggart <matt@lackof.org>
 Description: Cross binutils for hppa64
  These programs are used when cross compiling anything for 
hppa64, currently
  the only thing you'd want to build is the hppa64 linux kernel.

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info binutils_2.11.90.0.7-2.0.1_hppa.deb
 new debian package, version 2.0.
 size 1423686 bytes: control archive= 2969 bytes.
     547 bytes,    15 lines      control
    4086 bytes,    65 lines      md5sums
     866 bytes,    39 lines   *  postinst             #!/bin/sh
     202 bytes,    10 lines   *  prerm                #!/bin/sh
      60 bytes,     2 lines      shlibs
 Package: binutils
 Version: 2.11.90.0.7-2.0.1
 Section: devel
 Priority: standard
 Architecture: hppa
 Depends: libc6 (>= 2.2.3-1)
 Suggests: binutils-doc (= 2.11.90.0.7-2.0.1)
 Conflicts: gas, elf-binutils
 Provides: elf-binutils
 Installed-Size: 2940
 Maintainer: Matt Taggart <matt@lackof.org>
 Description: The GNU assembler, linker and binary utilities.
  The programs in this package are used to assemble, link and 
manipulate
  binary and object files.  They may be used in conjunction 
with a compiler
  and various libraries to build programs for Linux.

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info cpp_3.0-6_hppa.deb
 new debian package, version 2.0.
 size 2998 bytes: control archive= 747 bytes.
     380 bytes,    13 lines      control
     200 bytes,     3 lines      md5sums
     237 bytes,     8 lines   *  postinst             #!/bin/sh
     184 bytes,     6 lines   *  prerm                #!/bin/sh
 Package: cpp
 Version: 2:3.0-6
 Section: interpreters
 Priority: standard
 Architecture: hppa
 Depends: cpp-3.0
 Installed-Size: 60
 Maintainer: Debian GCC maintainers 
<debian-gcc@lists.debian.org>
 Source: gcc-defaults (0.11)
 Description: The GNU C preprocessor.
  The default GNU preprocessor for Debian GNU/Linux systems.
  .
  This is currently version 3.0 for this architecture (hppa).

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info gcc-3.0-base_3.0-3_all.deb
 new debian package, version 2.0.
 size 34396 bytes: control archive= 767 bytes.
     376 bytes,    11 lines      control
     303 bytes,     4 lines      md5sums
     273 bytes,     8 lines   *  postinst             #!/bin/sh
     202 bytes,     6 lines   *  prerm                #!/bin/sh
 Package: gcc-3.0-base
 Version: 1:3.0-3
 Section: devel
 Priority: standard
 Architecture: all
 Installed-Size: 42
 Maintainer: Debian GCC maintainers 
<debian-gcc@lists.debian.org>
 Source: gcc-3.0 (3.0.ds9-3)
 Description: The GNU compiler collection (base package).
  This package contains files common to all languages and 
libraries
  contained in the GNU compiler collection (gcc).

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info gcc-hppa64_3.0-0pre010427.0.0.1_hppa.deb
 new debian package, version 2.0.
 size 2983800 bytes: control archive= 1382 bytes.
     382 bytes,    11 lines      control
    1930 bytes,    25 lines      md5sums
     265 bytes,     8 lines   *  postinst             #!/bin/sh
     198 bytes,     6 lines   *  prerm                #!/bin/sh
 Package: gcc-hppa64
 Version: 3.0-0pre010427.0.0.1
 Section: alien
 Priority: extra
 Architecture: hppa
 Depends: libc6 (>= 2.2.3-1), binutils-hppa64
 Installed-Size: 7680
 Maintainer: Matt Taggart <matt@lackof.org>
 Description: Cross gcc for hppa64
  This compiler is used when cross compiling anything for 
hppa64, currently
  the only thing you'd want to build is the hppa64 linux kernel.

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info gcc_3.0-6_hppa.deb
 new debian package, version 2.0.
 size 3222 bytes: control archive= 901 bytes.
     457 bytes,    16 lines      control
     108 bytes,     2 lines      md5sums
     395 bytes,    16 lines   *  postinst             #!/bin/sh
     126 bytes,     6 lines   *  preinst              #!/bin/sh
     274 bytes,    14 lines   *  prerm                #!/bin/sh
 Package: gcc
 Version: 2:3.0-6
 Section: devel
 Priority: standard
 Architecture: hppa
 Depends: cpp (>= 2:3.0-6), gcc-3.0, cpp-3.0
 Recommends: libc-dev
 Suggests: task-c-dev
 Provides: c-compiler
 Installed-Size: 52
 Maintainer: Debian GCC maintainers 
<debian-gcc@lists.debian.org>
 Source: gcc-defaults (0.11)
 Description: The GNU C compiler.
  The default GNU C compiler for Debian GNU/Linux systems.
  .
  This is currently version 3.0 for this architecture (hppa).

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info g++_3.0-6_hppa.deb
 new debian package, version 2.0.
 size 1192 bytes: control archive= 748 bytes.
     444 bytes,    15 lines      control
     398 bytes,    15 lines   *  postinst             #!/bin/sh
     275 bytes,    14 lines   *  prerm                #!/bin/sh
 Package: g++
 Version: 2:3.0-6
 Section: devel
 Priority: standard
 Architecture: hppa
 Depends: cpp (>= 2:3.0-6), g++-3.0, gcc-3.0
 Suggests: task-c++-dev
 Provides: c++-compiler
 Installed-Size: 40
 Maintainer: Debian GCC maintainers 
<debian-gcc@lists.debian.org>
 Source: gcc-defaults (0.11)
 Description: The GNU C++ compiler.
  The default GNU C++ compiler for Debian GNU/Linux systems.
  .
  This is currently version 3.0 for this architecture (hppa).

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info gdb-hppa_5.0-4.pehc.2_hppa.deb
 new debian package, version 2.0.
 size 1238264 bytes: control archive= 791 bytes.
     390 bytes,    11 lines      control
     246 bytes,     4 lines      md5sums
     257 bytes,     8 lines   *  postinst             #!/bin/sh
     194 bytes,     6 lines   *  prerm                #!/bin/sh
 Package: gdb-hppa
 Version: 5.0-4.pehc.2
 Section: alien
 Priority: extra
 Architecture: hppa
 Installed-Size: 3424
 Maintainer: Matt Taggart <matt@lackof.org>
 Description: Static gdb for hppa
  This is a static version of gdb for hppa based on 
puffin.external.hp.com cvs.   This is an unofficial debian 
package and will go away when hppa support has
  been integrated in to the normal gdb package.

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info libc6-dev_2.2.3-6.0.1_hppa.deb
 new debian package, version 2.0.
 size 2733850 bytes: control archive= 899 bytes.
     706 bytes,    17 lines      control
     287 bytes,    16 lines   *  postinst             #!/bin/sh
     247 bytes,     7 lines   *  preinst              #!/bin/sh
     180 bytes,    12 lines   *  prerm                #!/bin/sh
 Package: libc6-dev
 Version: 2.2.3-6.0.1
 Section: devel
 Priority: standard
 Architecture: hppa
 Depends: libc6 (= 2.2.3-6.0.1)
 Recommends: c-compiler
 Suggests: glibc-doc
 Conflicts: libstdc++2.10-dev (<< 1:2.95.2-15), gcc-2.95 (<< 
1:2.95.3-8), netkit-rpc, libc-dev
 Replaces: man-db (<= 2.3.10-41), gettext (<= 0.10.26-1), ppp 
(<= 2.2.0f-24), libgdbmg1-dev (<= 1.7.3-24), ldso (<= 
1.9.11-9), netkit-rpc, netbase (<< 4.0)
 Provides: libc-dev
 Installed-Size: 11860
 Maintainer: Ben Collins <bcollins@debian.org>
 Source: glibc
 Description: GNU C Library: Development Libraries and Header 
Files.
  Contains the symlinks, headers, and object files needed to 
compile
  and link programs which use the standard C library.

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info libc6_2.2.3-6.0.1_hppa.deb
 new debian package, version 2.0.
 size 4343044 bytes: control archive= 5160 bytes.
      20 bytes,     1 lines      conffiles
     827 bytes,    18 lines      control
    8008 bytes,   321 lines   *  postinst             
#!/bin/bash
     547 bytes,    27 lines   *  postrm               #!/bin/sh
    2901 bytes,    96 lines   *  preinst              
#!/bin/bash
     182 bytes,    11 lines   *  prerm                #!/bin/sh
     653 bytes,    22 lines      shlibs
 Package: libc6
 Version: 2.2.3-6.0.1
 Section: base
 Priority: required
 Architecture: hppa
 Depends: libdb2 (>= 2:2.7.7-4)
 Suggests: locales, glibc-doc
 Conflicts: strace (<< 4.0-0), libnss-db (<< 2.2-3), timezone, 
timezones, gconv-modules, libtricks, libc6-doc, libc6-i586, 
libc6-i686, libc6-v9, netkit-rpc
 Replaces: ldso (<= 1.9.11-9), timezone, timezones, 
gconv-modules, libtricks, netkit-rpc, netbase (<< 4.0)
 Provides: gconv-modules, glibc2.2
 Installed-Size: 14596
 Maintainer: Ben Collins <bcollins@debian.org>
 Source: glibc
 Description: GNU C Library: Shared libraries and Timezone data
  Contains the standard libraries that are used by nearly all 
programs on
  the system. This package includes shared versions of the 
standard C library
  and the standard math library, as well as many others.
  Timezone data is also included.

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info libstdc++3_3.0-1_hppa.deb
 new debian package, version 2.0.
 size 257680 bytes: control archive= 882 bytes.
     390 bytes,    12 lines      control
     282 bytes,     4 lines      md5sums
     383 bytes,    13 lines   *  postinst             #!/bin/sh
     128 bytes,     6 lines   *  postrm               #!/bin/sh
     198 bytes,     6 lines   *  prerm                #!/bin/sh
      23 bytes,     1 lines      shlibs
 Package: libstdc++3
 Version: 1:3.0-1
 Section: base
 Priority: required
 Architecture: hppa
 Depends: gcc-3.0-base, libc6 (>= 2.2.3-1)
 Installed-Size: 892
 Maintainer: Debian GCC maintainers 
<debian-gcc@lists.debian.org>
 Source: gcc-3.0 (3.0.ds9-1)
 Description: The GNU stdc++ library version 3
  This package contains an additional runtime library for C++ 
programs
  built with the GNU compiler.

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info libstdc++3-dev_3.0-1_hppa.deb
 new debian package, version 2.0.
 size 593396 bytes: control archive= 6769 bytes.
     827 bytes,    16 lines      control
   15408 bytes,   221 lines      md5sums
     224 bytes,     7 lines   *  postinst             #!/bin/sh
     146 bytes,     5 lines   *  prerm                #!/bin/sh
 Package: libstdc++3-dev
 Version: 1:3.0-1
 Section: devel
 Priority: optional
 Architecture: hppa
 Depends: gcc-3.0-base, libstdc++3 (>= 1:3.0-1), libc6-dev (>= 
2.2.3-1), g++-3.0 (>= 1:3.0-1)
 Suggests: stl-manual
 Conflicts: libg++27-dev, libg++272-dev (<< 2.7.2.8-1), 
libstdc++2.8-dev, libg++2.8-dev, libstdc++2.9-dev, 
libstdc++2.9-glibc2.1-dev, libstdc++2.10-dev (<< 1:2.95.3-2), 
libstdc++3.0-dev
 Provides: libstdc++-dev
 Installed-Size: 4032
 Maintainer: Debian GCC maintainers 
<debian-gcc@lists.debian.org>
 Source: gcc-3.0 (3.0.ds9-1)
 Description: The GNU stdc++ library version 3 (development 
files)
  This package contains the headers and static library files 
necessary for
  building C++ programs which use libstdc++. Be advised that 
this only works
  with the GNU C++ compiler (version 2.95), and no earlier 
library will work it.
/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info task-c-dev_0.7_all.deb
 new debian package, version 2.0.
 size 3570 bytes: control archive= 985 bytes.
     847 bytes,    21 lines      control
     207 bytes,     3 lines      md5sums
     265 bytes,     8 lines   *  postinst             #!/bin/sh
     198 bytes,     6 lines   *  prerm                #!/bin/sh
 Package: task-c-dev
 Version: 0.7
 Section: devel
 Priority: optional
 Architecture: all
 Depends: task-devel-common, gcc | c-compiler, cpp, manpages-dev
 Suggests: task-debug, autoproject, protoize-2.95, doc++ | cweb 
| cwebx | cweb-latex | nowebm | fweb | funnelweb, c2man, cxref, 
cutils, tendra, cflow, liwc
 Installed-Size: 12
 Maintainer: Debian GCC maintainers <gcc@packages.debian.org>
 Source: task-devel
 Description: Development in C
  A metapackage containing dependencies and suggestions for a 
complete
  environment for development of programs in the C programming 
language,
  including:
   o Tools common for C, C++ and Objective C development
   o A C preprocessor
   o A C compiler
   o Development files of the standard C library
   o Debugging tools
   o Literate programming tools for C
   o C source analysis tools and tools to manipulate C source

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info task-c++-dev_0.7_all.deb
 new debian package, version 2.0.
 size 3558 bytes: control archive= 974 bytes.
     846 bytes,    22 lines      control
     213 bytes,     3 lines      md5sums
     273 bytes,     8 lines   *  postinst             #!/bin/sh
     202 bytes,     6 lines   *  prerm                #!/bin/sh
 Package: task-c++-dev
 Version: 0.7
 Section: devel
 Priority: optional
 Architecture: all
 Depends: task-devel-common, c++-compiler, cpp, manpages-dev
 Recommends: stl-manual
 Suggests: task-debug, task-c-dev, doc++ | cweb | cwebx | 
cweb-latex | nowebm | fweb | funnelweb, openc++
 Installed-Size: 12
 Maintainer: Debian GCC maintainers <gcc@packages.debian.org>
 Source: task-devel
 Description: Development in C++
  A metapackage containing dependencies, recommendations and 
suggestions
  for a complete environment for development of programs in the
  C++ programming language, including:
   o Tools common for C, C++ and Objective C development
   o A C preprocessor
   o A C++ compiler and the standard C++ library
   o Documentation for the Standard Template Library
   o Debugging tools
   o Literate programming tools for C++
   o An extensible C++ compiler


/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info task-devel-common_0.7_all.deb
 new debian package, version 2.0.
 size 3868 bytes: control archive= 1284 bytes.
    1491 bytes,    27 lines      control
     228 bytes,     3 lines      md5sums
     293 bytes,     8 lines   *  postinst             #!/bin/sh
     212 bytes,     6 lines   *  prerm                #!/bin/sh
 Package: task-devel-common
 Version: 0.7
 Section: devel
 Priority: optional
 Architecture: all
 Depends: make, binutils | binutils-multiarch, glibc-doc, 
manpages-dev | manpages-de-dev | manpages-pl-dev, autoconf, 
automake, libtool, flex, bison, indent | astyle, patch, strace 
| hurd, cvs | rcs | aegis | prcs, gettext
 Suggests: task-c-dev | task-c++-dev | task-objc-dev | 
task-debug, icmake | pmake | xmake | cook | cons, sourcenav, 
byacc, gperf, clig | wyg | opt | autogen, colorgcc, dejagnu, 
cdecl, metrics, dist, nana, gnu-standards, ltrace
 Installed-Size: 12
 Maintainer: Debian GCC maintainers <gcc@packages.debian.org>
 Source: task-devel
 Description: Development in various languages
  A metapackage containing dependencies, recommendations and 
suggestions
  for tools commonly used in development and debugging using 
the C, C++,
  and Objective C programming languages and others, including:
   o Developer's documentation
   o An assembler, linker and tools to manipulate object files
   o Tools to script the build process
   o Tools to help deal with system differences and simplify 
the creation
     of libraries
   o Tools to generate lexical analyzers and parsers
   o Tools to automate indentation and cross-reference 
generation
   o System and library call tracers
   o Version and configuration management systems
   o I18n (internationalization) tools
   o Tools for enhanced assertion checking
   o Tools to help in command line parsing and writing help 
texts
   o Tools for regression testing

/cdrom/dists/sid/main/binary-hppa/more_packages
root@frog # dpkg --info libtool_1.4-1_all.deb
 new debian package, version 2.0.
 size 309832 bytes: control archive= 2195 bytes.
     763 bytes,    18 lines      control
    1678 bytes,    25 lines      md5sums
    1611 bytes,    65 lines   *  postinst             #!/bin/sh
     234 bytes,    18 lines   *  preinst              #!/bin/sh
     263 bytes,    13 lines   *  prerm                #!/bin/sh
 Package: libtool
 Version: 1.4-1
 Section: devel
 Priority: optional
 Architecture: all
 Depends: gcc | c-compiler, cpp, libc6-dev | libc-dev, file
 Recommends: libltdl3-dev
 Suggests: libtool-doc, autoconf, automake
 Conflicts: autoconf (<= 2.12), automake (<= 1.3)
 Installed-Size: 1099
 Maintainer: Ossama Othman <ossama@debian.org>
 Description: Generic library support script
  This is GNU libtool, a generic library support script.  
Libtool hides
  the complexity of generating special library types (such as 
shared
  libraries) behind a consistent interface.  To use libtool, 
add the
  new generic library building commands to your Makefile, 
Makefile.in,
  or Makefile.am.  See the documentation for details.  Libtool 
supports
  building static libraries on all platforms.

----- 8< ----- 8< ----- 8< ----- 8< ----- 8< -----

Some packages seem to relie on packages which are either
not present or the dependencies are not up-to-date ... 

Another way could be to configure the already installed 
utilities. Is there a central configuration file for gcc ?
How gcc knows where to look for the include files and
essential libraries ?

Anybody outthere who could help ?

Thanks in advance !

Reinhard.

P.S.: This topic was an issue in parisc-linux digest,
Vol 1 #208. The way offered there did not lead to
success ...
