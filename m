From: Helge Deller <deller@gmx.de>
Subject: FUNCTION_TRACER and parisc kernel
Date: Sat, 07 Feb 2009 02:19:04 +0100
Message-ID: <498CE188.60308@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Carlos, Dave & parisc-linux mailing list,

I just started looking into implementing function tracer functionality 
into the parisc kernel (http://cateee.net/lkddb/web-lkddb/FUNCTION_TRACER.html).

While doing so, I noticed that gcc issues lots of warnings like this one:
  CC      arch/parisc/lib/iomap.o
cc1: warning: -ffunction-sections disabled; it makes profiling impossible

So it seems that this statement in arch/parisc/Makefile:
# Without this, "ld -r" results in .text sections that are too big
# (> 0x40000) for branches to reach stubs.
cflags-y        += -ffunction-sections

breaks with the -pg compile option which is needed for function tracing.

Some searching with google brought up this thread:
http://gcc.gnu.org/ml/gcc-help/2008-11/msg00128.html
and esp. this answer:
http://gcc.gnu.org/ml/gcc-help/2008-11/msg00141.html

Or this thread:
http://osdir.com/ml/linux.debian.ports.hppa/2005-06/msg00045.html

Since it's late I felt too tired to look deeply into glibc and gcc myself and
just thought I should ask here: Do you see any chance that -pg and -ffunction-sections
could work together on hppa/linux?

Helge

PS: I assume my latest patches to fix loading of xfs modules only worked
because we compile the kernel with -ffunction-sections by default. Disabling
-ffunction-sections will then probably bring back the module loading bug... :-(
