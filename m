Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA08641
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 08:21:09 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 22 Jan 2001 15:24:53 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id AAD76B005; Mon, 22 Jan 2001 15:15:15 +0000 (GMT)
Date: Mon, 22 Jan 2001 15:15:15 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Jim Buttafuoco <jim@tylerdrive.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble booting a 710 (bushmaster)
Message-ID: <20010122151515.N3571@linuxcare.com>
References: <200101221502.f0MF2kO05633@openbsd1.buttafuoco.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101221502.f0MF2kO05633@openbsd1.buttafuoco.net>; from jim@tylerdrive.org on Mon, Jan 22, 2001 at 10:02:46AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 22, 2001 at 10:02:46AM -0500, Jim Buttafuoco wrote:
> 	This also fails.  attached is the boot log.  

> SCSI subsystem driver Revision: 1.00
> sim700: Couldn't get consistent shared memory
> sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
> scsi0: Revision 0x0
> Post test1, istat 05, sstat0 00, dstat 84
> sim700: WARNING IRQ probe failed, (returned 0)
> scsi0: WARNING: target data areas are not dma coherent!
> scsi0: test 1 completed ok.

Well, scsi is happier now.  The messages above are expected, and
test 1 passing means the scsi chip can access memeory ok.

> scsi0 : LASI/Simple 53c7xx
> scsi0: Unable to abort command for target 0
> scsi0: Unable to send Bus Device Reset for target 0
> scsi0: Unable to do SCSI bus reset
> scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
> scsi0: could not halt NCR chip, stage 0
> scsi0: Unable to abort command for target 1
> scsi0: Unable to send Bus Device Reset for target 1
> scsi0: Unable to do SCSI bus reset
> scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<

Those messages might be caused by an unterminated scsi bus, or by
a problem with interrupts.

The network problem still looks like interrupts from the 82596 are
disabled somehwere and not getting to the processor.

Still seems likely to me that the kernel is not enabling some interrupts
properly for the 710 bushmaster machines.

Anyone on the list got a similar machine working?  The h/w database
lists quite a few people as owning one of these boxes.

My 715 now works as far as scsi and network are concerned, but (a) I
have to disable nscd, (b) tar hangs, and (c) I have disabled parallel
port support.  nscd and tar both seem to go in to a loop calling
sched_yield() from libc.

Richard
