Return-Path: <rbradetich@uswest.net>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB28048DA
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 29 Jan 2004 03:17:26 -0700 (MST)
Subject: Re: [parisc-linux] K380 partial success, the state of the port?
From: Ryan Bradetich <rbradetich@uswest.net>
To: Heikki Hannikainen <hessu@hes.iki.fi>
In-Reply-To: <Pine.LNX.4.58.0401291151310.23965@jazz.he.fi>
References: <Pine.LNX.4.58.0401281500300.14924@jazz.he.fi>
	<20040128181511.GD959@tausq.org>
	<Pine.LNX.4.58.0401291151310.23965@jazz.he.fi>
Content-Type: text/plain
Message-Id: <1075371327.20418.90.camel@laptop.bradetich.net>
Mime-Version: 1.0
Date: Thu, 29 Jan 2004 03:15:27 -0700
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I looked through your log because this crash looked very familar to me
:(

> Kernel command line: root=/dev/sda2 HOME=/ console=ttyB0
palo_kernel=2/boot/vmlinux

Good you have palo set for the Serial Mux.

But I do not see the Serial Mux in the console log.  Can you verify that
the CONFIG_SERIAL_MUX and CONFIG_SERLIAL_MUX_CONSOLE are compiled into
your kernel?

I would bet this is your problem just from the dump output ... and
futher confirmed by lack of serial mux in your boot log.

Should look something like:

Serial mux driver (8 ports) Revision: 0.2
ttyB0 at MMIO 0xfff78800 (polling) is a Mux
.
.
.

Thanks,

- Ryan


On Thu, 2004-01-29 at 03:03, Heikki Hannikainen wrote:
> On Wed, 28 Jan 2004, Randolph Chung wrote:
> 
> > > - Should I go to the 2.6 tree? I compiled it from the CVS (to get the
> > > tulip driver working) but the SCSI failed:
> >
> > Yes, you should go to 2.6, but as Joel pointed out SMP is not yet
> > working correctly.
> >
> > We have a few scsi gurus on the parisc list so they can address the scsi
> > issues :)
> 
>   Ok! I compiled the same 2.6.1-pa10 from tuesday's CVS, uniprocessor
> 32bit, and it almost booted. The SCSI driver didn't barf, but it crashed
> just before init started. Full console log at:
> http://he.fi/misc/hppa/2.6.1-pa10-32-uni.crash1.consolelog
> I'm not a kernel hacker, but I'd be happy to try any debugging or
> testing code/patches if someone has an idea why this is failing.
> 
> EXT3-fs: mounted filesystem with ordered data mode.
> VFS: Mounted root (ext3 filesystem) readonly.
> Freeing unused kernel memory: 468k freed
> 
> Stack Dump:
> ...
> Kernel addresses on the stack:
>  [<10231f64>] elv_next_request+0x20/0x12c
>  [<10103f38>] parisc_terminate+0x60/0xb0
>  [<101041d4>] handle_interruption+0x24c/0x598
>  [<10121d20>] io_schedule+0x40/0x6c
>  [<1015f004>] __wait_on_buffer+0xbc/0x118
>  [<10109088>] intr_check_sig+0x0/0xc
>  [<102355a8>] submit_bio+0x80/0xd8
>  [<102137a0>] init_dev+0x64/0x4d0
>  [<10213798>] init_dev+0x5c/0x4d0
>  [<10214328>] tty_open+0x88/0x3cc
>  [<1016d3ac>] link_path_walk+0x788/0xa40
>  [<10168008>] chrdev_open+0xd0/0x180
>  [<1015e914>] get_empty_filp+0x68/0x118
>  [<1015ceb4>] dentry_open+0x154/0x224
>  [<1015cd40>] filp_open+0x4c/0x6c
>  [<1015d288>] sys_open+0x54/0xa8
>  [<10100204>] init+0x54/0xc8
>  [<10108c5c>] ret_from_kernel_thread+0x1c/0x24
> 
> 
> Kernel Fault: Code=15 regs=8ffa8380 (Addr=f305f306)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001111 Not tainted
> r00-03  00000000 10398010 10213798 10387178
> r04-07  1039b42c 1039b42c 8fb7b840 00500001
> r08-11  00000000 1045e99c 000f41fa 00000000
> r12-15  1038c1c8 00000000 1038f810 1045e810
> r16-19  f0001898 8ffa828c f000011c f305f306
> r20-23  00000000 00000000 1010fdf0 00000002
> r24-27  8ffa828c 00000000 10398730 10370010
> r28-31  1039b42c 00000005 8ffa8380 102145d0
> sr0-3   00000000 00000000 00000000 00000000
> sr4-7   00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 1021379c 102137a0
>  IIR: 0d130083    ISR: 00000000  IOR: f305f306
>  CPU:        0   CR30: 8ffa8000 CR31: 103d4000
>  ORIG_R28: 8ffa84c0
>  IAOQ[0]: init_dev+0x60/0x4d0
>  IAOQ[1]: init_dev+0x64/0x4d0
>  RP(r2): init_dev+0x5c/0x4d0
> 
> 
>   - Hessu
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
