Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D70E482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 03:49:26 -0600 (MDT)
Date: Wed, 29 May 2002 10:26:33 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020529092633.GJ3471@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] EARLY_BOOTUP_DEBUG, PDC_CONSOLE, register_console()
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

Hi,
  Tried turning on EARLY_BOOTUP_DEBUG in a 'standard' kernel config and
booting the resulting kernel on a B180, using sti console.  Kernel
parameters were init=/bin/sh and console=tty0.  Console output stopped
after "freeing init memory".  System wasn't hung, however, but /bin/sh
was actually talking to ttyS0.

The reason is as follows; I now have three things calling
register_console() - pdc console (ttyB0), vt (tty0), and serial console
(ttyS0).  I have specified console=tty0, so kernel/printk.c will process
that and set preferred_console=0; register_console(ttyB0) is called
next, then register_console(tty0) is called.  At this point
register_console() notes that ttyB0 was a boot console, and calls
unregister_console(ttyB0), which sets preferred_console=-1.  Finally
register_console(ttyS0) is called, which sees preferred_console=-1,
thinks this is the first register_console() call, and sets ttyS0 as the
console device.

One fix is below; it doesn't make sense to unset preferred_console if
console= was specified on the command line.

After this this fix things seem ok booting with console=tty0 or ttyS0.
I then turned on PDC_CONSOLE, and can still boot with console=tty0 or
ttyS0, so if may now be safe to have pdc console enabled by default.

Trying to boot with console=ttyB0 (using graphical console) was
interesting; console output works, although stifb messed with the
colours, so I have dark blue text on a black background.  Console input
didn't work though, I guess because the kernel keyboard driver was
grabbing keyboard interrupts.  However, if this was a system where pdc
console was needed, because linux couldn't drive graphics or keyboard
directly, it might have worked fine.

Thibaut, perhaps you can build kernels with this patch, then
boot-floppies and an ISO, for Robbie to do a test install on his
K-class?

Cheers,
  Richard


Index: kernel/printk.c
===================================================================
RCS file: /var/cvs/linux/kernel/printk.c,v
retrieving revision 1.17
diff -u -r1.17 printk.c
--- kernel/printk.c	2002/02/26 00:45:45	1.17
+++ kernel/printk.c	2002/05/29 09:47:59
@@ -668,7 +668,7 @@
 	 * one that gets registered. Without that, pmac early boot console
 	 * would prevent fbcon from taking over.
 	 */
-	if (console_drivers == NULL)
+	if (console_drivers == NULL && !console_cmdline[0].name[0])
 		preferred_console = -1;
 		
 
