Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 70853482A
	for <parisc-linux@parisc-linux.org>; Tue, 21 Aug 2001 15:12:22 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Grant Grundler <grundler@puffin.external.hp.com>,
	Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] iotree thoughts
Date: Tue, 21 Aug 2001 23:12:09 +0200
Cc: parisc-linux@parisc-linux.org
References: <200108210753.BAA21158@puffin.external.hp.com>
In-Reply-To: <200108210753.BAA21158@puffin.external.hp.com>
MIME-Version: 1.0
Message-Id: <20010821211222.70853482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Tuesday 21 August 2001 09:53, Grant Grundler wrote:
> Matthew Wilcox wrote:
> > Only if they're called.  The majority of places where these functions
> > exist can provably never be called.  The others probably won't be :-)
>
> I don't bet on "probably".
>
> If the kernel is designed to not link when a dependency is not met,
> I can find problems much faster when they arise. Having to build/reboot
> to find porting/coding issues seems harder than it needs to be.

Hi Grant & Matthew,

I still think Matthew's solution is a good idea. Why should the user be
bothered to compile in that PCI stuff if he won't need it at all ?
I tried Matthew's patch and it worked without problems on my 715/64 
and this is exactlly one of those machines for which the patch was 
designed. Those machines use LASI-style LAN, PS/2 or HIL Keyboard/Mice, 
STI(fb) and the harmony sound driver. Those are well-defined drivers which we
know that they work without PCI and which other drivers should we need ? 
GSC-cards ? They should work since I think they only have additional LASI's 
or somethink like that (You may correct me if I'm wrong.).
EISA-Cards ? We don't support any yet. Maybe in the future, but then the user
will also need to add PCI support anyway.
So I don't see any reason, why we shouldn't make it possible to link
a kernel without PCI support and call BUG() (and print out the port-number as 
Alan suggested) just in case we would miss one place.
Btw, I love a small kernel if I'm running it on such a slow machine which is often 
only equipped with 32-64 MB RAM.

Just my 0.02 cents,

Helge
