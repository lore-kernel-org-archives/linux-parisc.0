Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA07805
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Dec 1999 10:37:19 -0700
Date: Wed, 1 Dec 1999 16:41:41 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Mark Klein <mklein@dis.com>, alan@lxorguk.ukuu.org.uk,
        Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        sieler@allegro.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress - Update
Message-Id: <19991201164141.B4951@mathe.stud.uni-erlangen.de>
References: <4.2.0.58.19991130120934.00cc2c10@209.60.244.235> <199911302340.SAA05430@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911302340.SAA05430@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> [deleted]
> 
> Since the exchange operation is not allowed to fail, using an exchange
> semaphore to guarantee that the operation is atomic could result in deadlock
> if xchg is called from an interrupt service routine.  Thus, it appears
> that we are stuck with using spin_lock_irqsave / spin_unlock_irqrestore.
> Exchange with 0 can be done with ldcws if the pointer is aligned on
> a 16 bye boundary.  For the present, it is probably best to just use
> spin_lock_irqsave / spin_unlock_irqrestore.
> 
> Currently, the lock variable used in xchg is static and ignored by
> spin_lock_irqsave / spin_unlock_irqrestore.  This will have to change
> for SMP.

We don't have SMP versions of spin_lock/spin_unlock yet.  (And it doesn't make
sense to write them for 2.2 just to rewrite them for 2.3 lateron).

Furthermore we have to care for cases like:

	var = 1;
x=0;
CPU0		CPU1
xchg(&var,x);	test_and_set_bit(0, &var);

Which means we have to always use the same spinlock for all atomic operations[1]
done to an integer - so either a global lock or an array of spinlocks (if the
one global lock strategy shows this spinlock as a major contention point).

IMHO we really should do the 2.3 merge first.

	Philipp Rumpf

[1] - spinlock_t, rwlock_t and atomic_t are special as no-one is going to do
any operations but the ones in spinlock.h / atomic.h on those.
