Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lufmech.rwth-aachen.de (karman.lufmech.RWTH-Aachen.DE [134.130.177.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8927C4A19
	for <parisc-linux@parisc-linux.org>; Fri, 23 Mar 2001 01:54:29 -0700 (MST)
Sender: markus@lufmech.rwth-aachen.de
Message-ID: <3ABB0F3C.45F3267A@lufmech.rwth-aachen.de>
Date: Fri, 23 Mar 2001 09:54:20 +0100
From: Markus Werle <markus@lufmech.rwth-aachen.de>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] configure --host=xx revisited
References: <3AB9F2BC.33E89887@lufmech.rwth-aachen.de> <20010322212029.T5491@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:

> hppa-foo -- 32 bit, pa 1.1
> hppa2.0-foo -- 32 bit, pa 2.0
> hppa2.0w-foo -- 64 bit

This is wrong, ding dong!
This is the reason I asked ...

AFAIK the "w" stands for wide mode hardware
which does _not_ always mean 64 bit.
I am aware of the fact that this naming convention has
asymmetries with hp cc manpage, but unfortuantely
my gcc configured for hppa2.0w-hp-hpux11.00 is a 32 bit.

Who can help further?
