Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83452482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 16:33:37 -0700 (MST)
Subject: Re: [parisc-linux] C110 Kernel panic while installing 0.9.3
From: Ryan Bradetich <rbradetich@uswest.net>
To: Herb Radford <herbr@magma.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <5.1.0.14.0.20011217161541.026f40e0@mail.magma.ca>
References: <5.1.0.14.0.20011217161541.026f40e0@mail.magma.ca>
Content-Type: text/plain
Date: 17 Dec 2001 16:33:36 -0700
Message-Id: <1008632016.10510.0.camel@beavis>
Mime-Version: 1.0
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

Hello Herb,

Thanks to Thomas, I finally found a recipe that I can duplicate this
error with on my C200+.  I get this exact error when reading from a tape
drive with bs=10k.  I will track this down and get it fixed.  

Thanks for the bug report, and thanks to Thomas for the recipie :)

- Ryan


On Mon, 2001-12-17 at 14:25, Herb Radford wrote:
> I have had success and no problems installing the latest 0.9.3 on my B180L, 
> so I had to be a glutton for punishment and tried on the C110.
> 
> Should not have done that. I have successfully installed the kernel and 
> base for 0.9.3 and ftp'd vmlinux-32-2.4.16-pa16 kernel to the machine and 
> re-booted to avoid the FWSCSI fs corruption. After that I started to 
> install the X stuff. When I am doing an apt-get install xfonts-base (or 
> xfonts-100dpi or xfonts-75dpi) I get a kernel panic:
> 
> ccio-dma.c:349: Assertion (*res_ptr & *mask_ptr) == * mask_ptr failed!
> Kernel panic: (*res_ptr & *mask_ptr) == *mask_ptr
> In interrupt handler - not syncing
> 
> I don't have the source for this and haven't yet looked at the code but I 
> thought someone would like to know.
> 
> Regards, Herb
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
