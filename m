Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA12182
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 10:29:13 -0700
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id LAA28283
	for <parisc-linux@thepuffingroup.com>; Thu, 25 Jan 2001 11:33:07 -0600
Date: Thu, 25 Jan 2001 11:33:07 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <20010125101918.M3571@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0101250938150.27931-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C100 improvements, problems
List-ID: <linux-parisc.vger.kernel.org>


Howdy ya'll,

Failing to read all the new messages first, I did a cvs update and wound
up with unbuildable source.  So I kept the sim700 bits and unrolled the
20010124 tarball.  Now I've got my disks back.  Thanks.

Current problems:

o  I still get the 'Warning: unable to open an initial console.' message.  
Serial is working better and I get kernel messages on the serial console.  
init is running a getty on /dev/ttyS0 but I never get a login prompt.  
I've tried with and without 'console=/dev/ttyS0' as a kernel commandline
parameter.

o  I still have trouble with unligned data references.  I've discovered
that in addition to tar and make, sleep and nscd also produce this error.

o  I see a curious message when I reboot:

	Trying to free nonexistent resource <ffd07000-ffd0700b>

o  more page faults when I use SCSI but not when root is mounted via NFS.  
Hmm... why could that be?  I thought maybe it had to do with swapping, but
if I use nfsroot and then:

	# swapon /dev/sda2

more works fine.  I can mount the ext2 partition and run more from there.  
But when the SCSI disk is root, more page faults. Here's some kernel
messages:
 
	do_page_fault() pid=285 command='more' type=15 address=0xbaffffff
	vm_start = 0x4018c000, vm_end = 0x40190000
 
	     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
	PSW: 00000000000001001111111100001011
	r0-3     00000000 00008978 00003b4b 000074c0
	r4-7     bb000000 00008978 0000a978 00007000
	r8-11    00008afa 0008b810 0000a978 bb0001a0
	r12-15   00000000 00000000 000892b0 00000000
	r16-19   00000000 00000001 0000b71b 0000006d
	r20-23   0000002f bb000000 bb000004 bb000008
	r24-27   80808080 000074c0 bb000000 00008978
	r28-31   00000004 40069d2c bb000540 4009352f
	sr0-3    00000000 000001a9 00000000 000001a9
	sr4-7    000001a9 000001a9 000001a9 000001a9
 
	IASQ: 000001a9 000001a9 IAOQ: 00003b57 00003b5b
	 IIR: 0ebf3033    ISR: 000001a9  IOR: baffffff
	ORIG_R28: 00000001   

But things are definately looking up.  :)

- Greg
