Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA03649
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 13:53:35 -0700
Received: (1587 bytes) by baldur.fh-brandenburg.de
	via sendmail with P:stdio/R:match-inet-hosts/T:smtp
	(sender: <zippel@fh-brandenburg.de>)
	id <m14DYJ0-000pttC@baldur.fh-brandenburg.de>
	for <parisc-linux@thepuffingroup.com>; Tue, 2 Jan 2001 21:45:14 +0100 (MET)
	(Smail-3.2.0.97 1997-Aug-19 #3 built DST-Sep-15)
Date: Tue, 2 Jan 2001 21:44:42 +0100 (MET)
From: Roman Zippel <zippel@fh-brandenburg.de>
To: "David S. Miller" <davem@redhat.com>
cc: matthew@wil.cx, grundler@cup.hp.com, linux-kernel@vger.kernel.org,
        alan@lxorguk.ukuu.org.uk, parisc-linux@thepuffingroup.com
Subject: Re: [PATCH] move xchg/cmpxchg to atomic.h
In-Reply-To: <200101021121.DAA14657@pizda.ninka.net>
Message-ID: <Pine.GSO.4.10.10101022125570.20383-100000@zeus.fh-brandenburg.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi,

On Tue, 2 Jan 2001, David S. Miller wrote:

>    We really can't.  We _only_ have load-and-zero.  And it has to be
>    16-byte aligned.  xchg() is just not something the CPU implements.
> 
> Oh bugger... you do have real problems.

For 2.5 we could move all the atomic functions from atomic.h, bitops.h,
system.h and give them a common interface. We could also give them a new
argument atomic_spinlock_t, which is a normal spinlock, but only used on
architectures which need it, everyone else can "optimize" it away. I think
one such lock per major subsystem should be enough, as the lock is only
held for a very short time, so contentation should be no problem.
Anyway, this had the huge advantage that we could use the complete 32/64
bit of the atomic value, e.g. for pointer operations.

bye, Roman
