Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Duraid Madina" <duraid@fl.net.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 'foreign' PCI cards in an rp2430 
In-Reply-To: Message from "Duraid Madina" <duraid@fl.net.au>
   of "Sat, 09 Mar 2002 20:54:55 +1100." <000001c1c750$8d5f7900$022a17ac@simplex>
References: <000001c1c750$8d5f7900$022a17ac@simplex> 
Date: Sat, 09 Mar 2002 23:18:36 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020310061836.ED17848E8@dsl2.external.hp.com>
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

"Duraid Madina" wrote:
> Normally, yes. In my case, not really. To cut a long story short,
> because C++ has poor intrinsic support for reflection, even making my
> app *do* IO is non-trivial. E.g. my program instantiates millions of
> different objects (which interact in various interesting ways). The cost
> of serializing/deserializing these objects to store them in a light
> database like berkeleyDB, or simply as files is great enough that the
> job becomes CPU bound, and not I/O bound. Being CPU bound is not where I
> want to be, when I'm seeing only 2mb/sec of I/O ;)

FWIW, you should expect to see 30-40MB/s to single disk on rp2430.
More with more disks/channels.

> I would prefer to run Linux on the rp2430 though, since then I
> could use a cheap Intel gigabit NIC (instead of paying $$$ for an HP

Well, 2.4 has no e1000 driver (yet) much less one that is known to work
on hppa. I *think* the e1000 driver I "leveraged" from 2.5 release for
HP ia64 machine should also work for hppa. But that's just an educated
guess. FWIW, bcm5700 driver needed some patches to work on HP's
ia64 box and I'm looking forward to testing tg3 patch soon.

And Intel's change in strategy may not work so well in pratice.
So I'd stick with a tigon (acenic or bcm5700) board for the next
3 monthes.

> one) or better yet, stick my 3ware RAID card in the rp2430, and do away
> with the network altogether. That I *can't* do with HP-UX, so...

I've never liked RAID controllers. too complex and failure prone.
If you have spare CPU cycles, putting in simple SCSI controllers will
give you at least 4 x 80MB/s and it's easy to connect 40 or so 9 (or 18GB)
SCSI drives.  This is not shiny, new high tech stuff (eg u160 and 15KRPM).
but I expect it to be faster than any IDE solution (I could be wrong) and
re-usable for other computer science projects (read database or other
mutlithreaded IO) when you are done.  <RANT>And you don't need any
stinking x86 binaries-only software to manage the setup.</RANT>

But I'm not one to stop others from picking solutions that work
for them.

grant
