Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA01998
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Feb 2000 14:06:45 -0700
From: willy@thepuffingroup.com
Date: Mon, 14 Feb 2000 15:06:14 -0500
To: Ulrich Strelow <ulrich_strelow@yahoo.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] State Of The Port [2000/02/13]
Message-ID: <20000214150614.M9944@thepuffingroup.com>
References: <20000214165620.28571.qmail@web502.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000214165620.28571.qmail@web502.mail.yahoo.com>; from Ulrich Strelow on Mon, Feb 14, 2000 at 08:56:20AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Feb 14, 2000 at 08:56:20AM -0800, Ulrich Strelow wrote:
> Compiling and booting the latest (20000213) cvs
> version on my 715/33 is partly successful. It ends
> with the RAMDISK loaded message because after this the
> kernel is switching to a serial console which does not
> (yet) exist.

Yup, sounds right.

> It seems that CONFIG_GSC_PS2 is needed to include
> these routines (although the 715/33 does not have a
> GSC or PS2). But after defining CONFIG_GSC_PS2=y the
> kernel boot ends with the attempt to kill the init
> task. And the are two "kernel BUG" messages again,
> this time in block_dev.c:411!

The block_dev kernel BUG messages aren't really a problem.  We get
them on every architecture; it's a `feature' of initrd not yet being
completely fixed.  I agree the HIL driver needs some work.  I've put it
on the joblist :-) [The joblist is about to be published in the website
update I'm putting together right this minute]

> So everything has improved compared to the state
> before the 2.3.42 merge, where even a defconfig-kernel
> ended with lots of kernel BUG messages on my 715/33.

Yay!

> I have attached the complete boot log of this test.
> Has anyone an idea what's going wrong?
> 
> Also: the HIL-driver is still not working. If I
> include it I get lots of kernel BUG messages in
> pagetable_init.
> 
> Ulrich

[...]

> No such device
> current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
> set_pte c2ec5068 02c1a605
> current = c2fe6000, mm = c2ec1040, mmap_sem = c2ec105c
> set_pte c2ebc038 0100e605
> Kernel panic: Attempted to kill init!


The `No such device' message makes me curious.  What ramdisk.bin are
you using?
