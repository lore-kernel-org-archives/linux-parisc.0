Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10605482A
	for <parisc-linux@parisc-linux.org>; Mon, 28 May 2001 09:31:01 -0600 (MDT)
Message-Id: <m154Oxb-001VltC@bame.riverrock.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org, bame@www.riverrock.org
Subject: Re: [parisc-linux] i hate cvs 
In-Reply-To: Message from Matthew Wilcox <matthew@wil.cx>
   of "Mon, 28 May 2001 00:48:58 BST." <20010528004858.L23718@parcelfarce.linux.theplanet.co.uk>
References: <20010528004858.L23718@parcelfarce.linux.theplanet.co.uk> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 28 May 2001 09:29:35 -0600
From: Paul Bame <bame@riverrock.org>
List-ID: <linux-parisc.vger.kernel.org>

> 
> someone want to tell me how to get a copy of our source tree from, say,
> May 19th?  cvs up -D'19 May 2001' is not the answer because it gets
> files off the vendor branch which is useless.

cvs -rHEAD  -D'19 May 2001'

Theoretically both a branch and a date are required because it's quite common
to have two or more branches with active files on them.  I'm surprised CVS
didn't implicitly do the '-rHEAD' thing to select the right branch, but not
terribly surprised.  The specific case of raw.h mentioned in IRC is one I'll
be looking at more closely...

	-P
