Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob05.one.net.au (mail-ob05.one.net.au [61.12.0.165])
	by dsl2.external.hp.com (Postfix) with ESMTP id 00396482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 May 2001 21:52:21 -0600 (MDT)
Received: Received: [from squeak.local (async65-ade-isp-2.nas.one.net.au [203.101.90.66])
	by mail-ob05.one.net.au  with SMTP id f4P3pwn21291
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 May 2001 13:51:58 +1000 (EST)]
From: amodra@one.net.au
Date: Fri, 25 May 2001 13:28:48 +0930
To: "H . J . Lu" <hjl@lucon.org>
Cc: binutils@sources.redhat.com, parisc-linux@lists.parisc-linux.org
Message-ID: <20010525132848.L9275@squeak.one.net.au>
References: <20010525130358.K9275@squeak.one.net.au> <20010524203356.A30247@lucon.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010524203356.A30247@lucon.org>; from hjl@lucon.org on Thu, May 24, 2001 at 08:33:56PM -0700
Subject: [parisc-linux] Re: elf32-hppa: abort rather than BFD_ASSERT
List-ID: <linux-parisc.vger.kernel.org>

On Thu, May 24, 2001 at 08:33:56PM -0700, H . J . Lu wrote:
> 
> Why not give some useful messaages? I have been doing that for new
> tests I added.

Well, the asserts (now aborts) shouldn't ever happen :-)  They indicate
some sort of internal bfd error.  Note that "abort" is #defined to
_bfd_abort, which spits out file, line and function info, so we haven't
lost any information compared to the BFD_ASSERT code.

Alan
