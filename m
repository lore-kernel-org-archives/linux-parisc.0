Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA01084
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Nov 1999 16:39:28 -0700
Message-Id: <199911302340.SAA05430@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress - Update
To: mklein@dis.com (Mark Klein)
Date: Tue, 30 Nov 1999 18:40:48 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@lxorguk.ukuu.org.uk, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        sieler@allegro.com, parisc-linux@thepuffingroup.com
In-Reply-To: <4.2.0.58.19991130120934.00cc2c10@209.60.244.235> from "Mark Klein" at Nov 30, 99 12:14:59 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> At 07:31 PM 11/30/99 +0000, Alan Cox wrote:
> 
> 
> > > to use spin_lock_irqsave / spin_unlock_irqrestore on an array of spinlocks
> > > indexed by a hash of the address - x86istic code expecting xchg() to be
> > > fast is going to suck I'd guess.
> >
> >You can catch the suitably aligned case. I don't think anyone will have a 
> >problem
> >if you submit patches over time so that critical xchg()'d objects are 16byte
> >aligned where it doesnt impact other platforms.
> 
> You also have another option:
> 
> Create the xchg more as a "compare and swap" and separate the semaphore(s) from
> the data. You can always keep the semaphores paragraph aligned and not worry
> about where the data falls. Here's a sample of something I've used successfully
> for many years:

[deleted]

Since the exchange operation is not allowed to fail, using an exchange
semaphore to guarantee that the operation is atomic could result in deadlock
if xchg is called from an interrupt service routine.  Thus, it appears
that we are stuck with using spin_lock_irqsave / spin_unlock_irqrestore.
Exchange with 0 can be done with ldcws if the pointer is aligned on
a 16 bye boundary.  For the present, it is probably best to just use
spin_lock_irqsave / spin_unlock_irqrestore.

Currently, the lock variable used in xchg is static and ignored by
spin_lock_irqsave / spin_unlock_irqrestore.  This will have to change
for SMP.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
