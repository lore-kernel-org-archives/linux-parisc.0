Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id D731B4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 18:39:51 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA11380;
	Wed, 7 Feb 2001 12:39:41 +1100
Date: Wed, 7 Feb 2001 12:39:39 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Bdale Garbee <bdale@gag.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ICE compiling pump
In-Reply-To: <20010206222636.647ED35CF1@rover.gag.com>
Message-ID: <Pine.LNX.4.21.0102071124540.7974-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 6 Feb 2001, Bdale Garbee wrote:

> Building the Debian pump package on a J5000 running a kernel provided by jsm
> last night and the latest taggart nfsroot updated with more or less everything
> in the new-debs directory on pehc, I get:
> 
> cc -I. -Wall -g  -D__STANDALONE__ -DVERSION=\"0.8.3\"   -c -o dhcp.o dhcp.c
> dhcp.c: In function `pumpDhcpRun':
> dhcp.c:1330: Internal compiler error in eliminate_regs, at reload1.c:2505

It's probably fixed on our "devel" branch gcc by these patches:

2001-01-28 Richard Henderson <rth@redhat.com>
	* reload1.c (eliminate_regs): Handle USE.  (supercedes 2001-01-25)

2001-01-25 John David Anglin <dave@hiauly1.hia.nrc.ca>
	* reload1.c (eliminate_regs): Don't abort on MEM USEs.

Our devel branch gcc isn't too bad at the moment,  eg. I'm running a
kernel, glibc and tools compiled by it.  However, there's a problem
running fixincl when building the compiler that I haven't yet tracked
down.  Workaround is to configure gcc, then edit gcc/Makefile to zap the
command that actually runs fixincl.  ie. these lines
        (TARGET_MACHINE=$(target); srcdir=`cd $(srcdir); pwd`; \
        INSTALL_ASSERT_H=$(INSTALL_ASSERT_H); SHELL=$(SHELL) ;\
        export TARGET_MACHINE srcdir INSTALL_ASSERT_H SHELL ; \
        $(SHELL) ./fixinc.sh `pwd`/include $(SYSTEM_HEADER_DIR) $(OTHER_FIXINCLUDES_DIRS); \    

Don't just set STMP_FIXINC empty; You need to get a copy of
/usr/include/limits.h into gcc/include/

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
