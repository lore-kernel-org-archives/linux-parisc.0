Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE1B9482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 09:14:11 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15cTWD-00064G-00; Thu, 30 Aug 2001 16:14:09 +0100
Date: Thu, 30 Aug 2001 16:14:09 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Pedot, Wolfgang" <wpedot@harris.com>
Cc: 'Helge Deller' <helge.deller@sap.com>,
	'Parisc Linux Mailinglist' <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Kernel 2.4.9-pa10 now works on 715/75! Sound?
Message-ID: <20010830161409.B23606@parcelfarce.linux.theplanet.co.uk>
References: <8D4C69676E66D511A1CB00508BBBB19216273C@ranmx1.ran.harris.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <8D4C69676E66D511A1CB00508BBBB19216273C@ranmx1.ran.harris.com>; from wpedot@harris.com on Thu, Aug 30, 2001 at 11:06:48AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 30, 2001 at 11:06:48AM -0400, Pedot, Wolfgang wrote:
> Hi,
> 
> no luck with aumix. "Error opening mixer".
> I expected that because i get Error-Messages about problems with getting irq at
> bootup, dmesg attached.

Bugs:

1. Doesn't work on 715/old

This driver doesn't work on 715/old machines, which include the 715/75.  The
chip used for this is technically called 'Vivace', which is identical to 
Harmony.  Should be easy to fix.  It has something to do with the way it is
reported by the inventory code.  The HPA is not that of Lasi or ASP so the
interrupts aren't registered properly.

This will get fixed once we have an iotree.  Coming soon...

-- 
Revolutions do not require corporate support.
