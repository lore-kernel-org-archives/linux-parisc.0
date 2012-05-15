From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Tue, 15 May 2012 09:06:57 +0100
Message-ID: <1337069217.3005.8.camel@dabdike.lan>
References: <4FA9975C.5060708@bergerie>
	 <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>
	 <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>
	 <4FAEE943.2030203@gmx.de> <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>
	 <4FB182F8.2040403@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: John David Anglin <dave.anglin@bell.net>,
	Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FB182F8.2040403@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2012-05-15 at 00:11 +0200, Helge Deller wrote:
> On 05/14/2012 03:10 AM, John David Anglin wrote:
> > I had a successful bot of 3.4.0-rc7+ this evening.
> >
> > I updated my running kernel patch to 3.4.  The futex patch is removed 
> > and Srivatsa S. Bhat's
> > patch added.
> 
> Ok, I applied your patch now.
> I used latest binutils and (as suggested by Dave) gcc-4.6 branch.
> I built Kernel 3.4.0-rc7 as 32bit-binary for my c3000, b160L and 715/64.
> 
> The c3000 booted nicely into userspace.
> 
> The B160L and the 715/64 (both 32bit-only PA1.X machines) crashed with 
> the following trace.
> All logs attached.
> 
> Any ideas?

Yes, I'm fairly certain there's a non-PA 1.0 instruction in the TLB
insertion code path.  The reason I didn't see it is that all the systems
I boot 32 bit kernels on have PA2.0 processors, so even in 32 bit mode,
they won't trip over an illegal 1.0 instruction.  The backtrace is bogus
because the actual problem is in the interruption after all of the trace
information is saved.  I'll see if I can get the system to trigger a
HPMC or TOC to get the actual location of the problem in the
interruption path.

I've finally got my systems, so just unpacking and setting them up now.

James


