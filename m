Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from humbolt.nl.linux.org (humbolt.nl.linux.org [131.211.28.48])
	by dsl2.external.hp.com (Postfix) with ESMTP id 97E8A482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 May 2002 07:21:11 -0600 (MDT)
Received: (from localhost user: 'armijn' uid#1008 fake: STDIN
	(armijn@humbolt.nl.linux.org)) by humbolt.nl.linux.org
	id <S16341AbSEWNUx>; Thu, 23 May 2002 15:20:53 +0200
Date: Thu, 23 May 2002 15:20:53 +0200
From: Armijn Hemel <armijn@nl.linux.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Armijn Hemel <armijn@nl.linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing on b2600 fails
Message-ID: <20020523152053.I11717@humbolt.geo.uu.nl>
References: <Pine.A41.4.44.0205211630470.17882-100000@stalin.acc.umu.se> <maswan@acc.umu.se> <20020521154508.99536482A@dsl2.external.hp.com> <20020521175328.A2442@humbolt.geo.uu.nl> <armijn@nl.linux.org> <20020521180553.5470F482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020521180553.5470F482A@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Tue, May 21, 2002 at 12:05:53PM -0600
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

On Tue, May 21, 2002 at 12:05:53PM -0600, Grant Grundler wrote:

> [ back on-list ]
> 
> Armijn Hemel wrote:
> > Just burn them? How should I boot then? The b2600 doesn't have a floppy
> > drive. Don't I need PALO on the CD?
> 
> yes. CD or LAN. The lifimage has palo and vmlinux embedded in it,
> parisc firmware can boot a lifimage from LAN, tape, CD or HD.
> Any IO device the box has IODC for.

Ehr...how exactly should I do that? I know the first few steps (burn
lifimage somewhere on a CD, turn on machine, insert CD), but how
should I proceed? I looked in the FAQ, but the answer (nor the question)
is there. So, basically my question is: "How do I boot a lifimage from
a CD?"

[cut]

> > I'm quite desperate to be honest (and I think it shows). The machines I
> > have have to be returned to HP in .nl soon (they're from the demo pool,
> > trying to port yet another distro (ROCK Linux) to HPPA).
> 
> cool - keep the p-l mailing list posted on your progress.

Well, I did most of the work for our sparc64 port and most of the stuff
actually is to know what's different from x86...but finding that out can
be quite cumbersome...
I don't expect too many problems. The distro is built on top of another
distro (much like Linux From Scratch) and Debian is a great distro to
use to build on. But before I get too detailed...

armijn

-- 
 ---------------------------------------------------------------------------
   armijn@nl.linux.org | http://people.nl.linux.org/~armijn/ | Penguin Power
 ---------------------------------------------------------------------------
                 http://nl.linux.org/ | Alles over Linux
 ---------------------------------------------------------------------------
