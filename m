Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA08753
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Sep 1999 14:03:58 -0600
Sender: adevries@thepuffingroup.com
Message-ID: <37EFD1EE.6DB82C13@thepuffingroup.com>
Date: Mon, 27 Sep 1999 16:22:06 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Simen Thoresen <simen-tt@online.no>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] compiling on a 735?
References: <199909271923.VAA29471@online.no>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Simen Thoresen wrote:
> 1. has anybody compiled ncurses, so that make menuconfig works? I'll give
> it a try soon.

I don't think so, but we would like that.  I just use 'make config' in
the meantime.

> 2. Is my 735 a 712 or 715? Does it matter at this stage?

No, your 735 is a 735, but no, it doesn't matter.

> 3. Is my 735 a A class or D class? Does it matter?

It's really neither, and no, it doesn't matter yet either.   We just
don't have enough IO support yet for it to matter.

> 4. The HCL notes that the 735 has a 7100, so that part is ok.

Yuppers.

> 5. Gecko or Dino? I don't have one pci-slots, so I guess it's no Dino, right?

If it has EISA slots, it probably has WAX, for which we have no docs. 
It likely has Lasi, but I'm not sure and I'd need an HP person to tell
me.

> make[1]: *** No rule to make target `../../../ramdisk.bin', needed by
> `ramdisk.c
> '.  Stop.
> make[1]: Leaving directory `/usr/local/linux/arch/parisc/boot'
> make: *** [ramdisk.o] Error 2


You should grab ramdisk.bin from
ftp://puffin.external.hp.com/pub/parisc/binaries/ramdisks or similiar.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
