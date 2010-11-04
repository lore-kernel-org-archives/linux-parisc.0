From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Threads and fork on VIPT-WB machines
Date: Thu, 04 Nov 2010 14:25:52 -0400
Message-ID: <1288895152.10970.7.camel@mulgrave.site>
References: <AANLkTi=AaKrGn2oXypohLcCiAUfWx8mtofJz_+-awwix@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
To: "Amir G." <amir73il@users.sourceforge.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=AaKrGn2oXypohLcCiAUfWx8mtofJz_+-awwix@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2010-11-04 at 13:02 -0500, Amir G. wrote:
> Hi,
> 
> We are seeing corruption of parent stack after fork of a multi-threaded process.
> Something that resembles this reported bug:
> 
> http://wiki.parisc-linux.org/TestCases#head-b2a1d5999b1b7cbc6878005693440f9e2960e895
> 
> We have been seeing this bug on and off for the past year. very hard
> to reproduce it.
> 
> The only thing is... we are running our kernel (2.6.32) on ARM,
> so I am thinking this problem may be either a generic kernel problem
> or common to PA-RISC and ARM.
> I don't see anywhere that this problem was ever solved.
> 
> Anyway, I am sitting at Arnd's presentation in LPC at the moment (good talk).
> If any of you guys are present, please let me know so we can discuss
> the issue face to face.

OK, so just to summarise the rather hurried discussion for those not
present:  I'd always assumed that this problem is parisc specific
because no other vipt architecture saw it.  However it is possible it's
some I/D incoherency issue within the generic kernel itself ... it's
just a lot rarer on other architectures.  If you see it on arm, this
would confirm that view.  The main difference between PA and other VIPT
architectures is that our equivalency modulus for aliasing is much
bigger (we have a 4MB stride).

So what I'll do is have a look into this again.  I recently successfully
resurrected the tmpalias flushing patches (these eliminate the
possibility that it's some kind of TLB handling error because they allow
cache flushes without a corresponding TLB entry), but I'll look at our
generic paths again ... my greatest suspicions would be the
handle_mm_fault() path.

But basically, the summary is that we see the issue but have never
solved it.

James


