Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from humbolt.nl.linux.org (humbolt.nl.linux.org [131.211.28.48])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69831482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 May 2002 09:26:10 -0600 (MDT)
Received: (from localhost user: 'armijn' uid#1008 fake: STDIN
	(armijn@humbolt.nl.linux.org)) by humbolt.nl.linux.org
	id <S16043AbSEQP0A>; Fri, 17 May 2002 17:26:00 +0200
Date: Fri, 17 May 2002 17:26:00 +0200
From: Armijn Hemel <armijn@nl.linux.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Armijn Hemel <armijn@nl.linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing on b2600 fails
Message-ID: <20020517172600.I29738@humbolt.geo.uu.nl>
References: <20020517130527.J32014@humbolt.geo.uu.nl> <armijn@nl.linux.org> <20020517152054.4F2CE482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020517152054.4F2CE482A@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Fri, May 17, 2002 at 09:20:54AM -0600
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, May 17, 2002 at 09:20:54AM -0600, Grant Grundler wrote:

> > I also tried the 0.9.3 release PARISC-Linux (full
> > install) which also didn't work.
> 
> The kernel on that ISO is too old.

Ah...that explains a lot...

> No matter what, you need network access since the 0.9.3 bits are 6 monthes old.
> ie apt-get upgrade will replace everything anyway.
> 
> Steps Paul Bame uses goes something like:
> o burn Debian boot floppies image on a CD (it's a lifimage).
> o boot CD
> o do a network install to get the rest of the bits.

Hmmkay, worth a try :)

> > HPMC initiated, bus timeout, bad os HPMC cksm, OS HPMC br err
> 
> The bits are too old and Debian 3.0 is about ready to release.

I did try an unoffical ISO (Debian 3.0), but that also didn't work.
Best to just wait for Debian 3.0?

Thanks!

armijn

-- 
 ---------------------------------------------------------------------------
   armijn@nl.linux.org | http://people.nl.linux.org/~armijn/ | Penguin Power
 ---------------------------------------------------------------------------
                 http://nl.linux.org/ | Alles over Linux
 ---------------------------------------------------------------------------
