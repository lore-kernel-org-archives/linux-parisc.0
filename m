Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA16343
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Dec 2000 18:21:33 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200012170122.RAA26462@opus.allegro.com>
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
To: matthew@wil.cx (Matthew Wilcox)
Date: Sat, 16 Dec 2000 17:22:38 -0800 (PST)
Cc: jes@linuxcare.com (Jes Sorensen), matthew@wil.cx (Matthew Wilcox),
        alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@thepuffingroup.com
In-Reply-To: <20001216192919.A10477@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Dec 16, 2000 07:29:19 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> > Matthew> Can we move the __spinlock to be the first element of the

Why not do it "right", with a kernel locking call of some kind?
User code should never do LDCW calls ... we've just seen yet another
example of why: it's difficult to do correctly.  Providing fast
locking mechanisms is the *kernel's* job.

(That's the real short version of the well-founded diatribe I launched
against HP for suggesting that developers do their own spinlocks...
and I was proved correct when a couple of months later HP said "oops,
our suggested code was wrong". :)

Another reason for kernel implementation: *real world experience*:
the programmer might *think* that the lock will *always* be held
for a very short time, so the spin loop is acceptable ... but ... yes,
things happen ... and sometimes the programmer is wrong, and that
can have tragic consequences.  A kernel-implemented fast-lock would
presumably ...like on MPE/iX ... have a max number of hard loops,
and then revert to a blocking-lock of some kind.

BTW, MPE's solution to misaligned semaphore structures is to select
one of 15 reserved kernel semaphores (based on the bottom 4 bits of
the address of the user's misaligned semaphore) as a temporary
"helper" semaphore (to loop/ldcws on).  At least that way,
there's a 14/15 chance that two different misaligned semaphores won't
compete with each other when they shouldn't.  

Sorry this isn't a solution, just a suggestion that requires a bit 
more work :)

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com        
