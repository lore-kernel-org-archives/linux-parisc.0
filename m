Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA22922
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Mar 2000 12:34:35 -0700
Received: from h47clkrp.atl.hp.com (h47clkrp.atl.hp.com [15.114.131.162])
	by palrel3.hp.com (Postfix) with ESMTP id 69E55D23
	for <parisc-linux@thepuffingroup.com>; Thu,  9 Mar 2000 10:35:45 -0800 (PST)
Received: (from krp@localhost)
	by h47clkrp.atl.hp.com (8.9.3/8.8.7) id MAA21412
	for parisc-linux@thepuffingroup.com; Thu, 9 Mar 2000 12:44:02 -0600
Date: Thu, 9 Mar 2000 12:44:02 -0600
From: Bob Pflederer <krp@rsn.hp.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000309124402.F5197@h47clkrp.atl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: krp@h47clkrp.atl.hp.com
Subject: [parisc-linux] C180 experience
List-ID: <linux-parisc.vger.kernel.org>

Hi-

I wanted to share my experience with getting my C180 to boot using the
PALO, the ELF kernel, and NFSROOT.  I was successfully able to build
the "binutils" and "gcc" packages for cross compiling from x86 linux.
Although, I did have the '$global$' symbol problem which I ignored:

Testing libgcc1.  Ignore linker warning messages.
/parisc/gcc-build/gcc/xgcc -B/parisc/gcc-build/gcc/ -B/parisc/tools/gcc/hppa1.1-linux/bin/ -I/parisc/tools/gcc/hppa1.1-linux/include -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -g -O2  -I./include  libgcc1-test.o -o libgcc1-test \
  -nostartfiles -nostdlib `/parisc/gcc-build/gcc/xgcc -B/parisc/gcc-build/gcc/ -B/parisc/tools/gcc/hppa1.1-linux/bin/ -I/parisc/tools/gcc/hppa1.1-linux/include --print-libgcc-file-name`
libgcc1-test.o: In function `main_without__main':
/parisc/gcc-build/gcc/../../gcc/gcc/libgcc1-test.c:20: undefined reference to `$global$'
collect2: ld returned 1 exit status
make[1]: *** [libgcc1-test] Error 1
make[1]: Leaving directory `/parisc/gcc-build/gcc'
make: *** [all-gcc] Error 2

Using the instructions in /palo/README.CROSSCOMPILE, I was able to build an
x86 version of palo, and a parisc version if ipl.

With those tools, I could build the ELF_BRANCH version of the kernel with
make menuconfig; make dep; make palo

After setting up bootp, tftp, and NFS, I was able to start booting, but the 
machine would HPMC during the ethernet driver init:

pty: 256 Unix98 ptys configured^M
eth0: 82596 at 0xffd07000, 00 60 B0 18 39 C0 IRQ 535.^M
lasi_82596.c:v1.2 02/13/2000^M
eth0: lp at 0xc7fad000 (1716 bytes), lp->scb at 0xc7fad014^M
request_irq(535, c01a5d0c, 0x0, i82596, c7fb8020)^M
[ HPMC HERE ]

It appears that there was an interrupt already pending when the irq was 
turned on.  This caused the interrupt handler to get called
before everything was set-up, which I believe led to the HPMC:

pty: 256 Unix98 ptys configured^M
eth0: 82596 at 0xffd07000, 00 60 B0 18 39 C0 IRQ 535.^M
lasi_82596.c:v1.2 02/13/2000^M
eth0: lp at 0xc7fad000 (1716 bytes), lp->scb at 0xc7fad014^M
eth0: i596_open() irq 535.^M
request_irq(535, c01a5d0c, 0x0, i82596, c7fb8020)^M
eth0: i596_interrupt(): irq 535^M
eth0: i596 interrupt, status 0000.^M
[ HPMC HERE ]

So I hacked the driver to ignore the interrupt until the lan chip
is initialized, and was able to get to sash (see below).   Probably
not the right way to fix this, but it worked.

I hope this is helpful.

-Bob Pflederer

===================================================================
RCS file: /home/cvs/parisc/linux-2.3/drivers/net/lasi_82596.c,v
retrieving revision 1.1.2.1
diff -c -r1.1.2.1 lasi_82596.c
*** lasi_82596.c        2000/03/03 21:41:47     1.1.2.1
--- lasi_82596.c        2000/03/09 19:26:13
***************
*** 986,991 ****
--- 986,993 ----
        if (i596_debug > 1)
                printk("%s: i596_open() irq %d.\n", dev->name, dev->irq);
  
+       dev->interrupt = -1;
+ 
        if (request_irq(dev->irq, &i596_interrupt, 0, "i82596", dev))
                return -EAGAIN;
  
***************
*** 1182,1187 ****
--- 1184,1193 ----
        if (i596_debug > 3)
                printk("%s: i596_interrupt(): irq %d\n", dev->name, irq);
  
+       if (dev->interrupt == -1) {
+               printk("i596_interrupt(): irq %d skipping interrupt handler.\n", irq);
+               return;
+       }
        /* how fatal could this actually be? */
        if (dev->interrupt)
                printk("%s: Re-entering the interrupt handler.\n", dev->name);
