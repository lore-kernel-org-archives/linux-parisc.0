Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob02.one.net.au (mail-ob02.one.net.au [61.12.0.162])
	by dsl2.external.hp.com (Postfix) with ESMTP id 789AE482A
	for <parisc-linux@parisc-linux.org>; Mon, 21 May 2001 06:24:54 -0600 (MDT)
Received: Received: [from squeak.local (async40-ade-isp-3.nas.one.net.au [203.101.88.41])
	by mail-ob02.one.net.au  with SMTP id f4LCPGg04251
	for <parisc-linux@parisc-linux.org>; Mon, 21 May 2001 22:25:31 +1000 (EST)]
From: amodra@one.net.au
Date: Mon, 21 May 2001 22:00:03 +0930
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] elf/resolvfail
Message-ID: <20010521220002.K30444@squeak.one.net.au>
References: <20010520052242.L23718@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010520052242.L23718@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Sun, May 20, 2001 at 05:22:42AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sun, May 20, 2001 at 05:22:42AM +0100, Matthew Wilcox wrote:
> 
> but i would have throught that RTLD_LAZY would mean that it didn't have to
> resolve foo immediately, only when it was used.  Can someone explain what's
> supposed to happen here?

What type is foo?  Lazy linking only works for .plt entries, ie. functions.

Alan
