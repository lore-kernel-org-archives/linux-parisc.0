Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id E830D482A
	for <parisc-linux@parisc-linux.org>; Sun, 27 May 2001 11:02:20 -0600 (MDT)
Message-Id: <m1543vU-001VltC@bame.riverrock.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: bame@debian.org, parisc-linux@parisc-linux.org,
	bame@www.riverrock.org
Subject: Re: [parisc-linux] some information on apt woes 
In-Reply-To: Message from Matthew Wilcox <matthew@wil.cx>
   of "Sun, 27 May 2001 05:27:07 BST." <20010527052707.J23718@parcelfarce.linux.theplanet.co.uk>
References: <m153rqb-001VltC@bame.riverrock.org>  
 <20010527052707.J23718@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 27 May 2001 11:02:00 -0600
From: Paul Bame <bame@riverrock.org>
List-ID: <linux-parisc.vger.kernel.org>

> On Sat, May 26, 2001 at 10:08:09PM -0600, bame@debian.org wrote:
> >     One current parisc apt failure mode of both 0.4.0 and 0.5.3 appears
> >     to be a kernel VM problem though that doesn't make sense since the
> >     variable to make 0.4.0 fail is to update to glibc 2.2.3 from 2.2.1
> >     unless it's just the right change to the memory map to tweek some bug.
> 
> The faults I've seen from 0.4.0 are very different from those which
> you report.

That's why I said "One" above...  That "one" seems easily repeatable across
different boxes so seemed the best candidate for investigation and sharing.

>  0.4.0 segfaults during exit as it attempts to execute code
> in the dynamic linker (possibly a destructor?), after the dynamic linker
> has been unmapped.

It's possible I didn't examine the 0.4.0 memory map carefully enough to
distinguish the dynamic linker from other code.  I'm certain of the analysis
for 0.5.3 however.

> 
> The 0.5.3 crashes I've seen look more like dereferencing random data.

Sorry I must've been obtuse. Bad value used to construct an invalid pointer
leading to a type=15 fault" was supposed to indicate the same thing.  Again
I picked and analyzed one repeatable case, so my pointer was constant
from test to test not random.  Using apt in multiple ways probably produces 
more random-looking failures.
 
> Revolutions do not require corporate support.

-- 
			-Paul Bame

    We are somehow fooled into believing that the profoundly undemocratic,
    indeed fascist, structure inside corporations, some of the most powerful
    institutions of our time, is no threat to our democracy.
						    Lip de Los Nacos
