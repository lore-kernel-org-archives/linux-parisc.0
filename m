Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA23568
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 04:12:47 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 15 Nov 2000 11:14:45 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 3C177B007; Wed, 15 Nov 2000 11:12:20 +0000 (GMT)
Date: Wed, 15 Nov 2000 11:12:20 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Beta CD
Message-ID: <20001115111220.J32715@linuxcare.com>
References: <20001110171406.C3196@achilles.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001110171406.C3196@achilles.net>; from pjlahaie@linuxcare.com on Fri, Nov 10, 2000 at 05:14:06PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Nov 10, 2000 at 05:14:06PM -0500, Paul J.Y. Lahaie wrote:
> Hello fellow PA-RISCers,
> 
> An preliminary beta CD for PA/Linux has been uploaded to
> puffin.external.hp.com.  If people could try it and forward any complaints
> or suggestions to me, it would be greatly appreciated.  The URL for the
> image is: ftp://puffin.external.hp.com/pub/parisc/cd-images/palinux-0.5.iso.gz

I just borrowed a CDROM drive for my 715/75 so I could try
it on there [Actually this is the palinux-0.5.iso.gz that I
commented on, not the final version].  I wasn't successful:

Sometimes the boot hangs after "ASP version 1 at 0xf0800000 found",
waits a few seconds and then HPMCs.

The scsi driver always has serious problems with the CD drive
but does detect other devices on the bus.

The kernel always crashes after "Serial driver version 5.01...",
(if it gets that far) with

Data access rights fault in kernel: Code=26 regs=c5f9c940 (Addr=00000003)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001010
r0-3     00000000 c0217800 c011e9f8 c5ff64a0
r4-7     c5ff6200 c023ab20 00000008 f0823800
r8-11    00000003 00000007 c019134c c02b20a0
r12-15   fffffffc c023a800 c023a800 c02c31cc
r16-19   c023a800 c023a800 c02b2024 00000000
r20-23   c5ff6234 f0823807 f0823800 0000000a
r24-27   ffffffff c5ff64a0 c5ff6200 c0258000
r28-31   ffffffff 000002c0 c5f9cb80 c012dfc0
sr0-4    00000000 00000000 00000000 00000000
sr4-8    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c011e710 c011e714
 IIR: 0f881093    ISR: 00000000  IOR: 00000003
ORIG_R28: 00000058


I'll investigate further when I have the time.

Richard
