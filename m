Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA09950
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 15:55:59 -0700
Message-Id: <199911162256.RAA03404@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Today's boot experience on a 735
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 16 Nov 1999 17:56:32 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bame@debian.fc.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199911162052.PAA01909@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 16, 99 03:52:48 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > The _end symbol is not a reliable indicator of where
> > the kernel's memory ends.  And the hpux
> > bootloader doesn't provide the SOM header from whence this could
> > theoretically be calculated.  I haven't tried out the _end trick
> > posted last week, but it looks like it'll work (don't call the symbol
> > _end if you try it).  As long as your kernel links, the guess is
> > probably OK for now.
> 
> Ok, I see the problem now.  The section $DLT$ contains a bunch of
> undefined common symbols as well as _end.  For example,
> 
> boot_cpu_data       |       416|undef |common |$CODE$
> 
> The _end defined by the linker is the end of the bss section but not
> the end of last section of the kernel.

Ok, this is a programing problem.  For objects that don't need external
linkage, declare them static.  For those that do, initialize them!  This
will eliminate those pesky common variables.  For example,

--- setup.c.orig	Fri Nov 12 18:23:50 1999
+++ setup.c	Tue Nov 16 17:46:36 1999
@@ -57,14 +57,14 @@
 
 
 #define COMMAND_LINE_SIZE 1024
-char 	saved_command_line[COMMAND_LINE_SIZE];
+char 	saved_command_line[COMMAND_LINE_SIZE] = {};
 
 #define pdc_wrapper(args...) ({				\
 	real_routine = (void *)PAGE0->mem_pdc;		\
 	real_call(##args);				\
 })
 
-struct cpuinfo_parisc boot_cpu_data;
+struct cpuinfo_parisc boot_cpu_data = {};
 
 extern __initfunc(unsigned long hp700fb_init(unsigned long mem_start));
 extern	void dino_init(void);
@@ -73,7 +73,7 @@
 #endif
 extern void do_inventory(void);
 
-PDC_CALL pdc;
+PDC_CALL pdc = {};
 
 
 void __xchg_called_with_bad_pointer(void)
