Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA10531
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Oct 1999 14:13:45 -0600
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m11caDp-0027XyC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Sat, 16 Oct 1999 21:14:33 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Received: (from tsbogend@localhost)
	by alpha.franken.de (8.8.7/8.8.5) id WAA01913
	for parisc-linux@thepuffingroup.com; Sat, 16 Oct 1999 22:12:53 +0200
Date: Sat, 16 Oct 1999 22:12:53 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Start sash ...
Message-ID: <19991016221253.A1893@alpha.franken.de>
References: <19991016124656.A811@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991016124656.A811@alpha.franken.de>; from Thomas Bogendoerfer on Sat, Oct 16, 1999 at 12:46:56PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Oct 16, 1999 at 12:46:56PM +0200, Thomas Bogendoerfer wrote:
> Well, it *smells* like a valid SOM executable
> (start_brk) 40017000
> (end_code) 0003c000
> (start_code) 00001000
> (end_data) 40008000
> (start_stack) 2000002c
> (brk) 40017000
> Stand-alone shell (version 2.1)> 

(start_stack) 2000002c
(brk) 40017000
Stand-alone shell (version 2.1)
> help
alias      [name [command]]
cd         [dirname]
-chgrp     gid filename ...
-chmod     mode filename ...
-chown     uid filename ...
-cmp       filename1 filename2
-cp        srcname ... destname
-dd        if=name of=name [bs=n] [count=n] [skip=n] [seek=n]
-echo      [args] ...
-ed        [filename]
exec       filename [args]
exit       
-grep      [-in] word filename ...
help       [word]
-kill      [-sig] pid ...
-ln        [-s] srcname ... destname
-ls        [-lid] filename ...
-mkdir     dirname ...
-mknod     filename type major minor
-more      filename ...
-mount     [-t type] [-r] [-m] devname dirname
-mv        srcname ... destname
-printenv  [name]
prompt     string
-pwd       
quit       
-rm        filename ...
-rmdir     dirname ...
setenv     name value
source     filename
-sync      
-tar       [xtv]f devname filename ...
-touch     filename ...
umask      [mask]
-umount    filename
unalias    name
-where     program
> -pwd
/
> 


Serial Interrupts are definitly not working. I'm now running the uart in 
polling mode and I had to force use 16550A mode. Below is a patchset of my
hacks.  You need a fixed posix_types.h and bitops.h, too. I haven't tested 
the cvs version, yet.

Thomas.

PS: I'll be next week at Systems in Munich. You can find me at the Linuxpark 
HP booth (hall A3, No. 404-22) during the whole week.

Index: arch/parisc/mm/fault.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/mm/fault.c,v
retrieving revision 1.11
diff -u -r1.11 fault.c
--- arch/parisc/mm/fault.c	1999/10/14 21:08:36	1.11
+++ arch/parisc/mm/fault.c	1999/10/16 20:06:43
@@ -206,6 +208,7 @@
 	}
 
 	prot = translate_pte(*ptep);
+	prot |= 0x03000000;
 
 	pa = (pte_val(*ptep)&~4095);
 
Index: drivers/char/serial.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/char/serial.c,v
retrieving revision 1.7
diff -u -r1.7 serial.c
--- drivers/char/serial.c	1999/10/15 19:30:30	1.7
+++ drivers/char/serial.c	1999/10/16 20:06:43
@@ -1175,6 +1175,8 @@
 		goto errout;
 	}
 
+	state->type = PORT_16550A; /* no idea why type is 0 at this point */
+
 	if (!CONFIGURED_SERIAL_PORT(state) || !state->type) {
 		if (info->tty)
 			set_bit(TTY_IO_ERROR, &info->tty->flags);
Index: drivers/gecko/lasi.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/gecko/lasi.c,v
retrieving revision 1.13
diff -u -r1.13 lasi.c
--- drivers/gecko/lasi.c	1999/10/15 19:30:30	1.13
+++ drivers/gecko/lasi.c	1999/10/16 20:06:44
@@ -263,7 +263,9 @@
         serial->type = PORT_UNKNOWN; // else: PORT_16550A;
         serial->line = 0;
 	serial->port = ((unsigned int) d->hpa) + 0x800;
-        serial->irq = 256 + 5;	// FIXME: lasi->region->data.irqbase + 5
+	serial->iomem_base = ((unsigned int) d->hpa) + 0x800;
+        // serial->irq = 256 + 5;	// FIXME: lasi->region->data.irqbase + 5
+        serial->irq = 0;
         serial->io_type = SERIAL_IO_GSC;
         serial->flags = ASYNC_SKIP_TEST; // else autoconfig() will fail !
         serial->xmit_fifo_size = 16;
Index: init/main.c
===================================================================
RCS file: /home/cvs/parisc/linux/init/main.c,v
retrieving revision 1.23
diff -u -r1.23 main.c
--- init/main.c	1999/10/15 19:30:31	1.23
+++ init/main.c	1999/10/16 20:06:47
@@ -1425,6 +1425,7 @@
 	 */
 
 	execute_command = "/sbin/init";
+	argv_init[1] = NULL;
 	if (execute_command)
 		do_execve(execute_command,argv_init,envp_init,NULL);
 	panic("No init found.  Try passing init= option to kernel.");





-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
