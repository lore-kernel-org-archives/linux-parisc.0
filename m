Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA12629
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Oct 1999 17:41:30 -0600
Message-Id: <199910262341.TAA01365@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] hack to use HPUX boot loader
To: bame@debian.fc.hp.com (Paul Bame)
Date: Tue, 26 Oct 1999 19:41:17 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199910261550.JAA13603@debian.fc.hp.com> from "Paul Bame" at Oct 26, 99 09:50:37 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Has anyone confirmed that the kernel which is started is getting good
> data (stack, etc...) or are my kernels booting purely by accident?

Probably not.  I applied som_relocate on the kernel that I built today and
it booted through the RAM disk phase on my 735 up to the following point:

bad address 0000001c (code 15)

Kernel panic: bad address

In swapper task - not syncing

Since I am booting with hpux, the early walk through the hardware
configuration scrolls off the screen.

I have had to patch the Makefile to build with gcc 2.95.1 and without GECKO.
Can someone install this patch in the cvs source?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)


*** Makefile.orig	Mon Oct 25 20:48:29 1999
--- Makefile	Tue Oct 26 18:48:31 1999
***************
*** 91,97 ****
  # standard CFLAGS
  #
  
! CFLAGS = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -mdisable-fpregs -fwritable-strings 
  
  # use '-fno-strict-aliasing', but only if the compiler can take it
  CFLAGS += $(shell if $(CC) -fno-strict-aliasing -S -o /dev/null -xc /dev/null >/dev/null 2>&1; then echo "-fno-strict-aliasing"; fi)
--- 91,97 ----
  # standard CFLAGS
  #
  
! CFLAGS = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -mdisable-fpregs # -fwritable-strings 
  
  # use '-fno-strict-aliasing', but only if the compiler can take it
  CFLAGS += $(shell if $(CC) -fno-strict-aliasing -S -o /dev/null -xc /dev/null >/dev/null 2>&1; then echo "-fno-strict-aliasing"; fi)
***************
*** 115,121 ****
  FILESYSTEMS	=fs/filesystems.a
  NETWORKS	=net/network.a
  DRIVERS		=drivers/block/block.a \
- 		 drivers/gecko/gecko.a	\
  		 drivers/char/char.a 
  #	         drivers/misc/misc.a
  LIBS		=$(TOPDIR)/lib/lib.a
--- 115,120 ----
***************
*** 207,212 ****
--- 206,215 ----
  DRIVERS := $(DRIVERS) drivers/net/irda/irda_drivers.a
  endif
  
+ ifeq ($(CONFIG_GECKO),y)
+ DRIVERS := $(DRIVERS) drivers/gecko/gecko.a
+ endif
+ 
  include arch/$(ARCH)/Makefile
  
  .S.s:
***************
*** 235,241 ****
  	@echo "If this fails, you're not using GNU nm! "
  	@echo "Make sure you have it in your path before HPUX nm."
  	$(NM) --version > /dev/null 2>&1
! 	$(NM) -td vmlinux |awk '/init_task_union/ { n = int($2); t = int(n/8192); t *= 8192; if (t >= n) printf t-n ; else printf n-(t-8192)}' FS=\| > init_task.alignment
  	@if [ `cat init_task.alignment` -ne "0" ]; then \
  		echo init_task_union alignment is `cat init_task.alignment`: rebuilding...; \
  		( cd arch/parisc/kernel ; rm -f init_task.o ; make EXTRA_CFLAGS=-DALIGN init_task.o ); \
--- 238,244 ----
  	@echo "If this fails, you're not using GNU nm! "
  	@echo "Make sure you have it in your path before HPUX nm."
  	$(NM) --version > /dev/null 2>&1
! 	$(NM) -td vmlinux |awk '/init_task_union/ { n = int($$1); t = int(n/8192); t *= 8192; if (t >= n) printf t-n ; else printf n-(t-8192)}' FS=\| > init_task.alignment
  	@if [ `cat init_task.alignment` -ne "0" ]; then \
  		echo init_task_union alignment is `cat init_task.alignment`: rebuilding...; \
  		( cd arch/parisc/kernel ; rm -f init_task.o ; make EXTRA_CFLAGS=-DALIGN init_task.o ); \
