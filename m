Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9DA1D482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 21 Aug 2001 00:46:26 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15Z5Iu-00044S-00; Tue, 21 Aug 2001 07:46:24 +0100
Date: Tue, 21 Aug 2001 07:46:24 +0100
From: Matthew Wilcox <willy@debian.org>
To: Helge Deller <deller@gmx.de>
Cc: =?iso-8859-1?Q?Jo=EBl_Soete?= <jso@europay.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel 2.4.9-pa2?
Message-ID: <20010821074624.A12638@parcelfarce.linux.theplanet.co.uk>
References: <E15YmHu-0005lD-00@the-village.bc.nu> <20010820211823.D4D92482A@dsl2.external.hp.com> <20010821063716.E23D1482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010821063716.E23D1482A@dsl2.external.hp.com>; from deller@gmx.de on Tue, Aug 21, 2001 at 08:36:56AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 21, 2001 at 08:36:56AM +0200, Helge Deller wrote:
> Oops, I think you found a bug in the kernel. Don't know yet if it's
> only pa-risc specific or a general linux-kernel issue.

I think you're right.  Richard saw it on an A500 with 2.4.8 too.
I've seen a few scattered reports from people on other architectures
that they're seeing the same thing.

I went over the softirqd code this morning, and nothing jumped out at
me and said `this is something parisc is doing wrong'.  Maybe more eyes..

-- 
Revolutions do not require corporate support.
