Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3356D482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Jul 2001 13:10:14 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15L8KG-0002nW-00
	for parisc-linux@parisc-linux.org; Fri, 13 Jul 2001 20:10:08 +0100
Date: Fri, 13 Jul 2001 20:10:08 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20010713201008.Q3048@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] TODO list
List-ID: <linux-parisc.vger.kernel.org>

Here's some things which need to get fixed, courtesy of Alan Cox:

 * Documentation/parisc/unwritten appears out of date

 * cache_init wants some printk DEBUG levels adding
   [In general grep printk(\" is useful to check]

 * arch/parisc/kernel/irq.c has an unchecked kmalloc around line 550.

 * led_get_net_stats() is interrupt-unsafe.

 * ptrace is chock-full of intrusive debug code.  either remove it or
   macroise it.

 * smp_call_function has problems:
	If the calling thread is real time it wont yield - you need to use
	a timeout

	How do we handle IPI failures or retransmits?

 * Why does the superio driver BUG and thus oops rather than printking an
   error and continuing without that driver ?

 * binfmt_som still uses the old strlen_user and needs revisiting to solve
   DoS issues

 * extern asmlinkage long sys32_sysctl(struct __sysctl_args32 *args) is
   a little strange.  Also shouldnt oldlen32 be unsigned ?

-- 
Revolutions do not require corporate support.
