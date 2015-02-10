From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Little endianness
Date: Tue, 10 Feb 2015 07:56:41 -0800
Message-ID: <1423583801.2167.17.camel@HansenPartnership.com>
References: <loom.20150210T112204-76@post.gmane.org>
	 <BLU436-SMTP173A5545802614E9A03A58A97240@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Held Bier <lausgans@gmail.com>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP173A5545802614E9A03A58A97240@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2015-02-10 at 10:30 -0500, John David Anglin wrote:
> On 2015-02-10 5:31 AM, Held Bier wrote:
> > Hi.
> >
> > Looks like PA-RISC 1.1 added bi-endian support.
> > What about PA-RISC Linux? I know it's big endian.
> > But does it possible to build little endian kernel? If so, how?
> > Is migration to little endian planned? It should be reasonable
> > as it will bring more  compatibility with other Linux world.

What compatibility?  x86 is LE, Arm is Schizophrenic, PPC, Sparc and PA
are BE.  We're required to support the bus standards anyway, so the SCSI
bus is BE and the PCI bus LE by spec.  There's no such thing as a
"compatible" endianness.

> Unlikely.  According to the PA 2.0 arch, implementation of this feature 
> was optional.

I think it was originally designed for some type of LASI system.
There's an endian flip in some of the LASI devices as well.  I think the
original problem was LASI was designed big endian, but the chosen SCSI
processor was designed for LE at that time, so they tried to flip the
processor.  I suspect the reason the feature became optional is that it
caused more problems than it solved.

> Further the PDC/IODC firmware and software tool chains need little 
> endian support.  This
> is a massive amount of work.  So, unless one one decided to create a 
> 64-bit embedded
> PA-RISC processor for mass deployment, it wouldn't be worth the effort.

It's a bit pointless too.  Coping with endianness isn't really an
unsolved OS problem, so it would cost a huge amount, open a large can of
worms and buy us nothing.

James


