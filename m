Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Armijn Hemel <armijn@nl.linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing on b2600 fails 
In-Reply-To: Message from Armijn Hemel <armijn@nl.linux.org>
   of "Fri, 17 May 2002 13:05:27 +0200." <20020517130527.J32014@humbolt.geo.uu.nl>
References: <20020517130527.J32014@humbolt.geo.uu.nl> 
Date: Fri, 17 May 2002 09:20:54 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020517152054.4F2CE482A@dsl2.external.hp.com>
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

Armijn Hemel wrote:
> I also tried the 0.9.3 release PARISC-Linux (full
> install) which also didn't work.

The kernel on that ISO is too old.
No matter what, you need network access since the 0.9.3 bits are 6 monthes old.
ie apt-get upgrade will replace everything anyway.

Steps Paul Bame uses goes something like:
o burn Debian boot floppies image on a CD (it's a lifimage).
o boot CD
o do a network install to get the rest of the bits.

> HPMC initiated, bus timeout, bad os HPMC cksm, OS HPMC br err

The bits are too old and Debian 3.0 is about ready to release.
It's not worth chasing. I'm certain B2600 runs parisc-linux since
at least one parisc-linux developer has one.

grant
