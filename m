Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA19011
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 03:53:52 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 20 Nov 2000 10:56:03 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13xoXJ-0001b2-00; Mon, 20 Nov 2000 10:50:57 +0000
Date: Mon, 20 Nov 2000 10:50:57 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Ingo Matthaes <imatthae@grc.hp.com>
Cc: lrisc-Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] A500 and glibc woes
Message-ID: <20001120105057.B5196@parcelfarce.linux.theplanet.co.uk>
References: <20001119193557.A8796@grccd310.grc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001119193557.A8796@grccd310.grc.hp.com>; from imatthae@grc.hp.com on Sun, Nov 19, 2000 at 07:35:57PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Nov 19, 2000 at 07:35:57PM +0100, Ingo Matthaes wrote:
> finally we've got a A500 for palinux testing. Unfortunately
> we have some problems with it.
> A 32 bit kernel complains about a very old firmware and claims
> "that machine will probably never run linux"  But in fact, it 
> will :-)
> First question: Did anyone ever succeeded with a 32bit kernel
> on that hardware ?

It's not intended to work; I doubt anyone has tried.  You should build
a 64 bit kernel.

> A 64 bit Kernel boots fine and recognizes all available hardware 
> including the additional 100BT card. But it traps with the init
> which comes with the latest nfsroot tarball. I built a new one
> from the sourcesw of debians sysvlinux-2.78 and it does not trap
> anymore, but the kernel told me about unimplemented 32 syscalls.
> At this point I tried to build a 64 bit glibc in order to get
> a crt1.o , which is needed to builf for a 64bit init.

Don't try a 64-bit userland yet.  What you need to do is implement
some of the 32-bit syscalls.

-- 
Revolutions do not require corporate support.
