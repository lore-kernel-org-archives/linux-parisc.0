Received: from phnxpop5.phnx.uswest.net (phnxpop5.phnx.uswest.net [206.80.192.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA14567
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Nov 2000 19:20:23 -0700
Date: Fri, 10 Nov 2000 19:18:47 -0700
From: Randolph Chung <randolph@tausq.org>
To: bame@riverrock.org
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] kernel merge
Message-ID: <20001110191847.A20509@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <E13twjn-0004fw-00@noam.fc.hp.com> <m13uLiv-001Vp3C@chalet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m13uLiv-001Vp3C@chalet>; from bame@riverrock.org on Fri, Nov 10, 2000 at 02:28:33PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> Our asm/string.h is behind the times.  Fixing it might get rid of a
> bunch of compiler warnings! (TODO)

if this is just an issue of implementing the various parisc-optimized string 
routines, i've been working on this, but don't have everything ready
yet.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
