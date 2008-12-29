From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix module loading failure of large kernel modules
Date: Mon, 29 Dec 2008 15:07:26 +0100
Message-ID: <4958D99E.4010201@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>
To: linux-parisc@vger.kernel.org,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Moritz Muehlenhoff <jmm@
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The parisc port (esp. the 32bit kernel) currently lacks the ability to
load large kernel modules like xfs or ipv6. This is a long outstanding
bug and has already been reported a few times, e.g.:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=350482,
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=401439,
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=508489

The symptom is like this:
# modprobe xfs
FATAL: Error inserting xfs
(/lib/modules/2.6.26-1-parisc/kernel/fs/xfs/xfs.ko): Invalid module
format

In dmesg:
module xfs relocation of symbol xfs_btree_read_bufs is out of range
(0x3ffefffe in 17 bits)

The reason for the failure is, that the architecture only provides the
R_PARISC_PCREL17F (for 32bit kernels) and R_PARISC_PCREL22F (for PA2.0
and 64bit kernels) relocations, which sometimes can't reach the target
address of the stub entry if the kernel module is too large. Currently
parisc (like other architectures) creates one big PLT section for all
stubs at the beginning of the init and core sections.

The following two patches changes the parisc module loader to put stubs
in between the code sections instead, so that the distance to the stubs
more easily fits into the available 17/22 bits.

The first patch touches the generic module loader and adds a call to the
new module_additional_section_size() function to get_offset() if
CONFIG_ARCH_WANTS_STUBS_BEHIND_SECTIONS is defined. On parisc this
function returns the additional bytes for the stub area of a given section.

The second patch implements the parisc-specific changes.

Tested with 32- and 64bit parisc kernels.

Helge
