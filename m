Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA23523
	for <parisc-linux@puffin.external.hp.com>; Wed, 16 Feb 2000 15:45:26 -0700
Sender: frowand@hermes.mvista.com
Message-ID: <38AB1A96.A7469A04@mvista.com>
Date: Wed, 16 Feb 2000 13:45:58 -0800
From: Frank Rowand <frank_rowand@mvista.com>
Reply-To: frowand@mvista.com
MIME-Version: 1.0
To: John Marvin <jsm@udlkern.fc.hp.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Virtual mapping of IO cards
References: <200002161525.IAA14558@udlkern.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

John Marvin wrote:
> 
> Note: I've changed the subject, because I think this issue is mostly
> separate from the Linux syscall issue.
> 
> > An HPMC may be delayed, relative to the instruction that caused it.  The
> > worst case is that a context switch _could_ occur before the HPMC occurs
> > (and yes, we did see this problem with our HP-UX and HP-RT VME systems
> > when a VME time-out was long enough).  This can make it more difficult to
> > figure out what instruction was issued to cause the HPMC.  The advantage
> > of the page fault is that you know exactly what instruction caused the
> > fault.
> 
> But this doesn't help make your case.  You got the HPMC anyway because the
> card failed to respond in time.  The virtual mapping didn't help you.
> 
> Virtually mapping the card doesn't help with HPMC's caused by dma buffer
> mismanagement (i.e. the card causes the HPMC while mastering the bus).
> 
> Drivers for memory mapped register only cards, i.e. cards without any
> type of onboard memory (i.e. framebuffers, script memory, etc.) are
> not very likely to ever run into a bug of this type, since register
> pointers are usually set up once and never changed.
> 
> In my experience, the majority of HPMC's have been caused by VM errors.
> Then comes the two cases mentioned above (card not responding, dma
> errors).  In my experience, the majority of driver page faults were caused
> by memory references (i.e. mismanaging memory buffers), not IO space
> references.  I can't say I've ever seen a driver page fault bug (i.e. one
> that would have HPMC'd in the current Linux implementation) that was
> caused by the driver mismanaging a pointer to its virtually mapped card
> space.  That is my experience.  YMMV.
> 
> What percentage of the bugs that are caused by a driver mismanaging a
> pointer to its card space would be significantly helped by page faulting,
> rather than HPMC'ing? Although an HPMC can be delayed, I've found in
> the majority of the cases it was either right on, or one instruction off.


Yes, an HPMC caused by a read will behave as you describe.  It's the
case of a write that may be delayed by passing through one or more queues.


> I'm not trying to argue against virtually mapping the card (although I
> would be all for avoiding mapping a large graphics frame buffer in the
> kernel address space). I just want to be sure we do it for the right
> reasons.
> 
> John Marvin
> jsm@fc.hp.com
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

-Frank
-- 
MontaVista Software, Inc
frank_rowand@mvista.com
