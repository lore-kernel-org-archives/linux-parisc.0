Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA12638
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 13:56:54 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] So you wanna get to a prompt, eh?
Date: Thu, 21 Oct 1999 21:54:11 +0200
Content-Type: text/plain
References: <Pine.LNX.4.10.9910211202300.18709-100000@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <99102121574300.00288@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Thu, 21 Oct 1999 schrieb Christopher Beard:
> > > Is the ramdisk included in the kernel-image? When I boot the kernel,
> > > I get 'no ramdisk'.
> > 
> > To build the kernel right now, you have to download a ramdisk from
> > ftp://puffin.external.hp.com/pub/parisc/binaries/ramdisks or similiar.
> 
> You don't need the ramdisk if you are booting from a binary image, you only
> need it if you are attempting to build your own from the source tarball
> that was posted. The confusion exists in that the bootloader currently
> reports:
> 
> 	Loading PA-RISC/Linux Kernel...
> 	No ramdisks available.
> 
> And then continues along with the boot process.
> 
> Support for ramdisks was built into the bootloader, which is likely the
> prefered method, however, it has never been used. It is safe to ignore this
> for now.

Yes, this is correct. I once wrote support for ramdisks loaded by the
bootloader, but this possiblility was never used until now.
If there is interrest for this, then it should be really easy to implement...
More, this method is much faster than the current method to convert
ramdisk.bin to ramdisk.c and then compile & link it statically into the kernel.

Helge Deller

BTW: I will comment out this messages in my next commit. to not get more
confusion on this point !


>  
> Chris
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
