Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3CCE5482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 07:29:01 -0600 (MDT)
Date: Tue, 28 Aug 2001 07:28:59 -0600
To: "Kurc, Marcin A." <makurc@cooperstandard.com>
Cc: 'Matthew Wilcox' <willy@debian.org>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] visualize C360/785 install
Message-ID: <20010828072859.A17545@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
References: <426B4FEBE684D411B0A60090273B1D2401AD0E65@AA0016>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <426B4FEBE684D411B0A60090273B1D2401AD0E65@AA0016>
From: rbrad@beavis.ybsoft.com (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

I see a very similar problem on the C200+ and it has to do
with the console code.  To see more information you can do
the following in arch/parisc/kernel/pdc_cons.c:

	1. #define EARLY_BOOTUP_DEBUG
	
 	2. Remove CON_BOOT from the flags in
	   struct console.

This should enable you to see additional messages.

Hope that helps!

- Ryan

On Tue, Aug 28, 2001 at 08:21:06AM -0400, Kurc, Marcin A. wrote:
> I've problems booting it from cd.
> Here is what I get
> 
> HARD Booted.
> palo ipl 0.92 root@spqr Mon Jun 25 23:03:13 CEST 2001
> .........
> 
> Kernel: partition 0 file /vmlinux
> Ramdisk: partition 0 file /ramdisk
> Warning: kernel name doesn't end with 32 or 64... Guessing 32
> ELF32 executable
> Entry 00100000 first 00100000 n 4
> Segment 0 load 00100000 size 1606948 mediaptr 0x1000
> Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
> Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
> Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8
> Loading ramdisk 1991209 bytes @ 3fe09000...
> branching to kernel entry point 0x00100000
> Set default PSW W bit to 0
> 
> 
> and then it hangs. Do you know what could be wrong?
> 
> thanks
> 
> -----Original Message-----
> From: Matthew Wilcox [mailto:willy@debian.org]
> Sent: Monday, August 27, 2001 4:39 PM
> To: Kurc, Marcin A.
> Cc: 'parisc-linux@lists.parisc-linux.org'
> Subject: Re: [parisc-linux] visualize C360/785 install
> 
> 
> On Mon, Aug 27, 2001 at 04:24:08PM -0400, Kurc, Marcin A. wrote:
> > Did anyone have any luck installing parisc-linux on HP visualize C360
> (785)?
> 
> Ought to work.  Don't have one here, but Richard has one.
> 
> -- 
> Revolutions do not require corporate support.
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 

-- 
