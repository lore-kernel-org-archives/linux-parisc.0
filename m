Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maestro.symsys.com (maestro.symsys.com [208.223.9.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 162BF4A19
	for <parisc-linux@parisc-linux.org>; Tue, 13 Feb 2001 13:20:18 -0700 (MST)
Date: Tue, 13 Feb 2001 14:16:58 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Linux/HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] C100 & Latest CVS Bits 
In-Reply-To: <200102131946.LAA10733@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0102131358430.14806-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

All good news!

On Tue, 13 Feb 2001, Grant Grundler wrote:

> Greg Ingram wrote:
> > As I recall, Grant said the stack dump itself isn't
> > helpful unless it's a kernel built with the default configuration.
> 
> I can't (or won't) help with stack/register dumps unless they are built
> with default config. That's different than saying they aren't helpful.
> The problem is the symbols are what's interesting to me and I can't
> determine them unless the bits match what's in a source tree I have.

I understand.  I've rebuilt from clean with the default config and... 
[Gulp!]  I guess another reason to use the default config is to ensure
that I haven't done something rash with my config.  Here's the end of the
session now:

	Starting internet superserver: inetd.
 
	Debian GNU/Linux 2.2 apollos ttyS0
 
	apollos login:  

I'd also made /dev/console -> /dev/ttyS0.  No log to follow.  :)
 
> I guess it's time we put together a "PARISC Kernel Debugging HOW-TO
> for Dummies". ie how to look up symbols, explain TOC (and HPMC), how
> to get/decode TOC/HPMC dumps, etc.

Dummies?!  Ack!  Phfft!  Tyros, neophytes, novices, even newbies.  But
please do.  
 
> > As a side question, is it possible to have the system automatically reboot
> > after it encounters these errors?
> 
> It can. There's a global variable someplace that is *disabled* by default.
> If someone can just remember the global's name...

Anybody?  I have to make that *long* walk through the accounting office
just to power-cycle the beast.  

- Greg
