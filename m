Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF4A0486F
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 04:24:58 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1002191096.3bbc38f8c42ed@webmail.tiscalinet.be>
Date: Thu, 04 Oct 2001 12:24:56 +0200 (CEST)
From: joel.soete@freebel.net
Cc: debian-hppa@lists.debian.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] sti broken in pa32 on B180
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I just come back to my hppa boxes (a 712/80 and a b180) and just co the last cvs 
kernel (-pa32).
I do usual make oldconfig; make dep ; make vmlinux (on the 712).

I first rebout the model 712 with this kernel.
Everything seems to work fine:
	ksoftirqd_CPU0 does not heat any more 99% of cpu,
	Xfree(4.1.0-2) comes back with its classical grey colors (not more 
blue),
	I try also to disconect-reconect kbd and after a first test the kdb was 
not re-init (receive code (7f) ?)
	but for following test I was not able to reproduce the problem and seems 
to works also?
Nice and Great job.

Then I test this kernel on the B180 model.
Too bad: the sti console stop display at "Set default PSW W bit to 0" (an old 
well know problem) but the server start-up well.
(The last kernel I used successfully with sti console was the 2.4.9-pa14 with 
just a small adaptation of the Thomas Marteau kdb patch at the beginning of 
Sept)
(So I could not test disconnect-reconnect kbd)
Is Xfree works now on this workstation?

Thanks in advance for advice,
	Joel

PS: here is the list of packages installed on those servers. Should I have 
absolutely upgrade some once?

Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
ii  adduser        3.37           Add and remove users and groups to resp. fro
ii  apt            0.5.3          Advanced front-end for dpkg
ii  apt-utils      0.5.3          APT utility programs
ii  at             3.1.8-10       Delayed job execution and batch processing
ii  autoconf       2.50-8         automatic configure script builder
ii  autoconf2.13   2.13-35        automatic configure script builder (obsolete
ii  automake       1.4-p4-1       A tool for generating GNU Standards-complian
ii  autotools-dev  20010626.2     Update infrastructure for config.{guess,sub}
ii  base-config    1.11           Debian base configuration package
ii  base-files     2.2.8          Debian base system miscellaneous files
ii  base-passwd    3.2.1          Debian Base System Password/Group Files
ii  bash           2.05-4         The GNU Bourne Again SHell
ii  bc             1.06-7         The GNU bc arbitrary precision calculator la
ii  binutils       2.11.90.0.7-2. The GNU assembler, linker and binary utiliti
ii  bison          1.28-8.1       A parser generator that is compatible with Y
ii  bsdmainutils   5.20010126-4   More utilities from FreeBSD.
ii  bsdutils       2.11f-1.0.1    Basic utilities from 4.4BSD-Lite.
ii  bzip2          1.0.1-12       A high-quality block-sorting file compressor
ii  console-common 0.7            Basic infrastructure for text console config
ii  console-data   1999.08.29-21  Keymaps, fonts, charset maps, fallback table
ii  console-tools  0.2.3-23.0.1   Linux console and font utilities.
ii  console-tools- 0.2.3-23.0.1   Shared libraries for Linux console and font 
ii  cpio           2.4.2-36       GNU cpio -- a program to manage archives of 
ii  cpp            3.0-6          The GNU C preprocessor.
ii  cpp-3.0        3.0-1          The GNU C preprocessor.
ii  cron           3.0pl1-69      management of regular background processing
ii  dc             1.06-7         The GNU dc arbitrary precision reverse-polis
ii  debconf        0.9.76         Debian configuration management system
ii  debconf-utils  0.9.76         Debconf utilities
ii  debhelper      3.0.39         helper programs for debian/rules
ii  debian-cd      2.2.7          Tools for building (Official) Debian CD set
ii  debianutils    1.15           Miscellaneous utilities specific to Debian.
ii  devscripts     2.5.30         Scripts to make the life of a Debian Package
ii  dhcp-client    2.0pl5-5       DHCP Client
ii  diff           2.7-24         File comparison utilities
ii  diffstat       1.28-1         produces graph of changes introduced by a di
ii  dnsutils       9.1.1-1        Clients provided with BIND
ii  doc-debian     2.2.3          Debian Project documentation, Debian FAQ and
ii  dpkg           1.9.14         Package maintenance system for Debian
ii  dpkg-dev       1.9.14         Package building tools for Debian
ii  dpkg-multicd   0.17           Installation methods for multiple binary CDs
ii  e2fsprogs      1.20-1         The EXT2 file system utilities and libraries
ii  ed             0.2-19         The classic unix line editor
ii  exim           3.22-4.0.1     Exim Mailer
ii  fakeroot       0.4.4-9.2.1    Gives a fake root environment.
ii  fdutils        5.3-3.2.1      Linux floppy utilities
ii  file           3.33-5         Determines file type using "magic" numbers
ii  fileutils      4.1-2          GNU file management utilities.
ii  findutils      4.1.7-2        utilities for finding files--find, xargs, an
ii  finger         0.17-3         User information lookup program.
ii  fixincludes    3.0-1          Fix non-ANSI header files
ii  flex           2.5.4a-11      A fast lexical analyzer generator.
ii  ftp            0.17-6         The FTP client.
ii  g++-3.0        3.0-1          The GNU C++ compiler.
ii  gcc            3.0-6          The GNU C compiler.
ii  gcc-3.0        3.0-1          The GNU C compiler.
ii  gcc-3.0-base   3.0-3          The GNU compiler collection (base package).
ii  gettext        0.10.38-1      GNU Internationalization utilities
ii  gettext-base   0.10.38-1      GNU Internationalization utilities for the b
ii  glibc-doc      2.1.3-19       GNU C Library: Documentation
ii  gpm            1.19.3-6       General Purpose Mouse Interface
ii  grep           2.4.2-1        GNU grep, egrep and fgrep.
ii  grep-dctrl     1.9            Grep Debian package information
ii  groff-base     1.17-4         GNU troff text-formatting system (base syste
ii  gzip           1.2.4-33       The GNU compression utility.
ii  host           20000331-1     Utility for Querying DNS Servers
ii  hostname       2.08           A utility to set/show the host name or domai
ii  html2text      1.2.4-6        An advanced HTML to text converter.
ii  ifupdown       0.6.4-3        High level tools to configure network interf
ii  imlib-base     1.9.10-5       Common files needed by the Imlib/Gdk-Imlib p
ii  indent         2.2.6-3        C language source code formatting program
ii  info           4.0-5          Standalone GNU Info documentation browser
ii  ipchains       1.3.10-11      Network firewalling for Linux 2.2.x
ii  ipmasqadm      0.4.2-2        Utility for configuring extra masquerading f
ii  klogd          1.4.1-2        Kernel logging daemon
ii  less           358-6.1        A file pager program, similar to more(1)
ii  libart2        1.2.13-9       The Gnome canvas widget
ii  libbz2-1.0     1.0.1-12       A high-quality block-sorting file compressor
ii  libc6          2.2.3-9        GNU C Library: Shared libraries and Timezone
ii  libc6-dev      2.2.3-6.0.1    GNU C Library: Development Libraries and Hea
ii  libcap1        1.10-9         support for getting/setting POSIX.1e capabil
ii  libdb2         2.7.7-8.0.2    The Berkeley database routines (run-time fil
ii  libdb3         3.2.9-10       Berkeley v3 Database Libraries [runtime]
ii  libdigest-md5- 2.13-2         MD5 Message Digest for Perl
ii  libdns4        9.1.1-1        Shared Library used by BIND
ii  libdps1        4.1.0-2        Display PostScript (DPS) client library
ii  libfreetype6   2.0.2.20010514 FreeType 2 font engine, shared library files
ii  libgcc1        3.0-1          GCC support library.
ii  libgdbmg1      1.7.3-27       GNU dbm database routines (runtime version).
ii  libglib1.2     1.2.10-1.2     The GLib library of C routines
ii  libgpmg1       1.19.3-6       General Purpose Mouse Library [libc6]
ii  libgpmg1-dev   1.19.3-6       General Purpose Mouse Library, development f
ii  libident       0.22-2         simple RFC1413 client library - runtime
ii  libisc3        9.1.1-1        Shared Library used by BIND
ii  libkpathsea3   1.0.7+20001218 shared libkpathsea for teTeX
ii  libldap2       2.0.11-2       OpenLDAP libraries.
ii  liblockfile1   1.03           NFS-safe locking library, includes dotlockfi
ii  liblwres1      9.1.1-1        Shared Library used by BIND
ii  libncurses5    5.2.20010318-2 Shared libraries for terminal handling
ii  libncurses5-de 5.2.20010318-2 Developer's libraries and docs for ncurses
ii  libnewt0       0.50.17-7.0.1  Not Erik's Windowing Toolkit - text mode win
ii  libnss-db      2.2-3          DB Name Service Module
ii  libpam-modules 0.72-25        Pluggable Authentication Modules for PAM
ii  libpam-runtime 0.72-25        Runtime support for the PAM library
ii  libpam0g       0.72-25        Pluggable Authentication Modules library
ii  libpcre3       3.4-1          Philip Hazel's Perl Compatible Regular Expre
ii  libperl5.6     5.6.1-5        Shared Perl library.
ii  libpopt0       1.6.2-5        lib for parsing cmdline parameters
ii  libreadline4   4.2-3          GNU readline and history libraries, run-time
ii  libsasl7       1.5.24-6       Authentication abstraction library.
ii  libssl0.9.6    0.9.6a-3       SSL shared libraries
ii  libstdc++3     3.0-1          The GNU stdc++ library version 3
ii  libstdc++3-dev 3.0-1          The GNU stdc++ library version 3 (developmen
ii  libwrap0       7.6-8          Wietse Venema's TCP wrappers library
ii  libxaw6        4.0.3-4        X Athena widget set library (version 6)
ii  libxaw7        4.1.0-2        X Athena widget set library
ii  libzvt2        1.2.13-9       The Gnome zvt (zterm) widget
ii  lintian        1.20.13        Debian package checker
ii  locales        2.2.3-6        GNU C Library: National Language (locale) da
ii  login          20000902-6.1   System login tools
ii  logrotate      3.5.4-2        Log rotation utility
ii  lpr            2000.05.07-4   BSD lpr/lpd line printer spooling system
ii  lsof           4.57-1         List open files.
ii  lynx           2.8.3-1.4      Text-mode WWW Browser
ii  m4             1.4-13         a macro processing language
ii  mailx          8.1.2-0.200103 A simple mail user agent.
ii  make           3.79.1-6.0.1   The GNU version of the "make" utility.
ii  makedev        2.3.1-53       Creates special device files in /dev.
ii  man-db         2.3.18-10      Display the on-line manual.
ii  manpages       1.36-2         Man pages about using a Linux system.
ii  manpages-dev   1.36-2         Linux-development man pages.
ii  mawk           1.3.3-5        a pattern scanning and text processing langu
ii  mime-support   3.11-1         MIME files 'mime.types' & 'mailcap', and sup
ii  mkisofs        1.11a6-1       Creates ISO-9660 CD-ROM filesystem images.
ii  modconf        0.2.32         Device Driver Configuration
ii  modutils       2.4.6-3        Linux module utilities.
ii  mount          2.11f-1.0.1    Tools for mounting and manipulating filesyst
ii  mpack          1.5-7          Tools for encoding/decoding MIME messages.
ii  mtools         3.9.8-3        Tools for manipulating MSDOS files
ii  mtr-tiny       0.42-7         Full screen ncurses traceroute tool
ii  mutt           1.3.18-1       Text-based mailreader supporting MIME, GPG, 
ii  nano           1.0.2-1        free Pico clone with some new features
ii  ncftp          3.0.3-6        A user-friendly and well-featured FTP client
ii  ncurses-base   5.2.20010318-2 Descriptions of common terminal types
ii  ncurses-bin    5.2.20010318-1 Terminal-related programs and man pages
ii  ncurses-term   5.2.20010318-2 Additional terminal type definitions
ii  net-tools      1.60-1         The NET-3 networking toolkit
ii  netbase        4.06           Basic TCP/IP networking system
ii  netkit-inetd   0.10-6.2       The Internet Superserver
ii  netkit-ping    0.10-6.2       The ping utility from netkit
ii  nfs-common     0.3.2-2        NFS support files common to client and serve
ii  nfs-kernel-ser 0.3.2-2        Kernel NFS server support
ii  nvi            1.79-17        4.4BSD re-implementation of vi.
ii  palo           0.92           Linux boot loader for parisc/hppa
ii  passwd         20000902-6.1   Change and administer password and group dat
ii  patch          2.5.4-4        Apply a diff file to an original
ii  pciutils       2.1.8-5        Linux PCI Utilities (for 2.[1234].x kernels)
ii  perl           5.6.1-5        Larry Wall's Practical Extraction and Report
ii  perl-base      5.6.1-5        The Pathologically Eclectic Rubbish Lister.
ii  perl-modules   5.6.1-5        Core Perl modules.
ii  pidentd        3.0.12-3       TCP/IP IDENT protocol server.
ii  portmap        5-2            The RPC portmapper
ii  ppp            2.4.1-2        Point-to-Point Protocol (PPP) daemon.
ii  pppconfig      2.0.8          A text menu based utility for configuring pp
ii  procmail       3.15.1-4       Versatile e-mail processor.
ii  procps         2.0.7-5        The /proc file system utilities.
ii  protoize       3.0-1          Create/remove ANSI prototypes from C code
ii  python-base    1.5.2-16       An interactive object-oriented scripting lan
ii  python-newt    0.50.17-7.0.1  A newt module for Python.
ii  rcs            5.7-13         The GNU Revision Control System
ii  sed            3.02-6         The GNU sed stream editor.
ii  setserial      2.17-22        Controls configuration of serial ports.
ii  sharutils      4.2.1-6        shar, unshar, uuencode, uudecode
ii  shellutils     2.0.11-9       The GNU shell programming utilities.
ii  slang1         1.4.4-3.1      The S-Lang programming library - runtime ver
ii  strace         4.3-3.0.1      A system call tracer.
ii  sysklogd       1.4.1-2        System logging daemons
ii  sysutils       1.3.8.5        Miscellaneous small system utilities.
ii  sysvinit       2.78-4         System-V like init.
ii  tar            1.13.19-1      GNU tar
ii  tasksel        1.4            Tool for selecting tasks for installation on
ii  tcpd           7.6-8          Wietse Venema's TCP wrapper utilities
ii  tcsh           6.10-0.1       TENEX C Shell, an enhanced version of Berkel
ii  telnet         0.17-13        The telnet client.
ii  telnetd        0.17-13        The telnet server.
ii  texinfo        4.0-5          Documentation system for on-line information
ii  textutils      2.0-6          The GNU text file processing utilities.
ii  time           1.7-11         The GNU time command.
iU  twm            4.0.3-4        Tab window manager
ii  update         2.11-3         daemon to periodically flush filesystem buff
ii  util-linux     2.11f-1.0.1    Miscellaneous system utilities.
ii  vacation       3.0            email autoresponder
ii  wenglish       2.0-1          English dictionary words for /usr/share/dict
ii  whiptail       0.50.17-7.0.1  Displays user-friendly dialog boxes from she
ii  whois          4.5.7          The GNU whois client
ii  xbase-clients  4.1.0-2        miscellaneous X clients
ii  xdm            4.1.0-2        X display manager
ii  xfonts-100dpi  4.1.0-2        100 dpi fonts for X
ii  xfonts-75dpi   4.1.0-2        75 dpi fonts for X
ii  xfonts-base    4.1.0-2        standard fonts for X
ii  xfonts-scalabl 4.1.0-2        scalable fonts for X
ii  xfree86-common 4.1.0-2        X Window System (XFree86) infrastructure
ii  xlib6g         4.1.0-2        pseudopackage providing X libraries
ii  xlibmesa3      4.1.0-2        XFree86 version of Mesa 3D graphics library
ii  xlibs          4.1.0-2        X Window System client libraries
ii  xserver-common 4.1.0-2        files and utilities common to all X servers
ii  xserver-xfree8 4.1.0-2        the XFree86 X server
ii  xterm          4.1.0-2        X terminal emulator
ii  xutils         4.1.0-2        X Window System utility programs
ii  zlib1g         1.1.3-15       compression library - runtime


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
