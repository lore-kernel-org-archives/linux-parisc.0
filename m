Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA12526
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 19:20:14 -0600
Date: Thu, 22 Jun 2000 21:20:03 -0400 (EDT)
From: Pavel Roskin <proski@gnu.org>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Busybox 0.45 released 
In-Reply-To: <20000623004822.949A537E22@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0006222110110.13718-100000@sunapee.transcept.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hello, Matt!

> > I would like to see the binary of busybox on the ftp server.
> 
> Earlier today I spent some time cleaning up the pehc:/pub/parisc/binaries 
> directory. I put tarballs of all of the userspace apps(including busybox-0.43) 
> that I've compiled in,
> 
> ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/

I've been there already. What really needs to be there is libc with all
headers. It is very hard to compile libc. Its makefiles do really crazy
things. It even tried to commit something to CVS.

The only reason I'm asking to compile something is because the libc from
"gonzo" is broken - the kernel crashes if I run anything linked with it.

> I will build a new busybox ASAP. I also put a tarball of the latest 
> cross-toolchain for x86 in,
> 
> ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-latest.tgz
> 
> This toolchain is a couple weeks old but works pretty well. It will be updated 
> within the next few days.
> 
> Consider this an announcement :) I'll try to put pointers on the website soon.

Not very useful for me. I'm using Linux/PPC :-)

> Yes it would be nice. If someone else doesn't beat me to it I'll drop a new 
> kernel in there tommorrow.

Thanks.

Pavel Roskin
