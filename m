Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay1.alcatel.be (alc119.alcatel.be [195.207.101.119])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9F3FB482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Jan 2002 01:10:14 -0700 (MST)
Received: from nlntadn.ats.nld.alcatel.nl (localhost [127.0.0.1])
	by relay1.alcatel.be (8.10.1/8.10.1) with ESMTP id g0U8A9m08626
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Jan 2002 09:10:09 +0100 (MET)
Message-ID: <03273D4BC7F4D511AC440008C7E6F881542120@nlntmail2b.ats.nld.alcatel.nl>
From: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
To: parisc-linux@lists.parisc-linux.org
Date: Wed, 30 Jan 2002 09:10:03 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] semi cross compilation
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I wonder if the "linux-to-hpux porting kitt" cdrom might be of help
(B9891-90001).

Can be ordered *FREE OF CHARGE* at http://devresource.hp.com/LPK
<http://devresource.hp.com/LPK>   (takes a while) or downloaded...


I received the porting kit some days ago.
Here a snapshot of the readme file:
This CD-ROM contains the December 2000 release of the Open Source
Developer's Toolkit for HP-UX 11.00 and 11i on PA-RISC.  The kit
contains Open Source tools and some HP software.  The tools have been
selected as being those most likely to aid in porting and development of
software to HP-UX and to enhance the usability of HP-UX.  The additional
HP software should enhance the usability of HP-UX for Open Source tool
users.
Second CD contains three depots:
There are three tape depots on this CD-ROM.  The main depot is located
at "/bin.depot" (relative to the CD-ROM mount point, thus the path
you give to swinstall is /SD_CDROM/bin.depot), and contains the
various tools. (=35 MB large)

The second depot is /src.depot (or /SD_CDROM/src.depot) and
contains the source distributions for the Open Source tools. (=88MB large)

The third depot is /hp.depot (or /SD_CDROM/hp.depot)
and contains the HP-supplied tools. (=38MB large)
Here is an alphabetical listing of all the Open Source tools on this CD-ROM.
If
there is any special information about a specific tool, it is included
here.

Open Source Software
autoconf        2.13
automake        1.4
bash    2.04
Bison   1.28
bzip2   1.0.0
ddd     3.2.1
dejagnu 20000714
diffutils       2.7
enscript        1.6.1
expect  5.32.1
fileutils       4.0
Flex    2.5.4a
gawk    3.0.4
GCC     2.9.2000-03-01 (1) (2) (3)
gdb     4.18 (4)
GDBM   1.8.0
gettext 0.10.35
Ghostscript     5.10
glib    1.2.8
gmake   3.78.1
GNU emacs 20.7
grep    2.4.2
GTK+    1.2.8
gv      3.5.8
gzip    1.2.4a
imake   R6.3 (5)
jpeg    6b
LCLint  2.5m
less    340
libgd   1.8.3
libpng  1.0.6
libtiff 3.5.4
m4      1.4
ncurses 5.1
patch   2.5.4
Perl    5.005_03
readline        4.1
sed     3.02
tar     1.13
TCL     8.2.3
tcp_wrappers    7.6
tcsh    6.09
texinfo 4.0
textutils	2.0
Tk      8.2.3
unzip   5.40
vim     5.7
Xalan	0.40.0
Xaw3d   1.5
Xemacs  21.1.10
Xerces 1.2.0a
xpm     3.4
zip     2.3
zlib    1.1.3


This package is based on a recent GNUPro distribution from RedHat
(formerly Cygnus Solutions) and contains gcc, gas, and binutils and is
based on changes made to the version 2.9 sources that are in the process
of being merged back into the public source tree.

The GCC source package contains the sources for the entire
compiler collection (gcc, binutils, gdb) plus other tools used to build
it (flex, bison, gmake, tcl, tk, and others).  Many of the latter tools
have been superseded by more recent versions and if so, the version
included in the GCC distribution was not used to build the compiler.
Nevertheless, we have packaged the entire source code distribution as we
received it.

A number of header files changed between HP-UX 11.00 and 11i.  If you
attempt to use GCC from the previous CD-ROM, then compiles may fail on HP-UX
11i.  
We strongly recommend that if you update a system to HP-UX 11i that you
reinstall
GCC from this media.

Because they are identical, the source packages for gdb can be found
in the gcc package.  If you install the gdb source package, you will only
get a 
README file telling you to install the GCC source package instead.</LI>

The version of imake was configured to use the GCC compiler, not the
HP C compiler.  If you do not intend to use the GCC compiler, you should
not install this version of imake.

hp tools listing:
This depot contains HP headers, libraries, and object files that are
normally only shipped with HP's ANSI C compiler (and the HP-UX Developer's
Toolkit).  If you have already purchased and installed this product,
you probably do not need to install from this depot (except possibly
for the patches).

If you have not installed the HP ANSI C compiler and want to use the GNU
C compiler to either compile programs that use X11 widgets or compile
programs with the profiling option then we recommend you install the
products included in this depot.

These are also patches to the X11 filesets that were shipped with 11.00.
You should install these patches to ensure that you have the most recent
headers and libraries even if you have already installed the
X11MotifDevKit product.


The products contained in this depot are as follows:
Auxiliary-Opt
DebugPrg
X11MotifDevKit

Please note that the non-patch products contain subsets of what they
would have contained if you had purchased the HP ANSI C compiler.  These
products are intended to create a proper development environment based
around the GNU C compiler.
