Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06594483E
	for <parisc-linux@parisc-linux.org>; Sun, 21 Sep 2003 08:27:17 -0600 (MDT)
Date: Sun, 21 Sep 2003 10:24:58 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Helge Deller <deller@gmx.de>
Cc: Joel Soete <soete.joel@tiscali.be>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] sched_clock implementation
Message-ID: <20030921142458.GE6963@systemhalted>
References: <20030918203510.GD21596@parcelfarce.linux.theplanet.co.uk> <3F6C9622.60402@tiscali.be> <20030921000447.GC31268@dsl2.external.hp.com> <200309211320.36485.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200309211320.36485.deller@gmx.de>
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

On Sun, Sep 21, 2003 at 01:20:36PM +0200, Helge Deller wrote:
> On Sunday 21 September 2003 02:04, Grant Grundler wrote:
> > On Sat, Sep 20, 2003 at 06:02:10PM +0000, Joel Soete wrote:
> > > a quick look into paxx.pdf which about CR16 speak of "peak instruction
> > > rate" but do not define anywhere?
> > > I presume that is the cpu clock but would like somebody confirm.
> >
> > Read about "Interval Timer" (cr16) in the PA 2.0 Arch book.
> > PDC provides the exact rate that CR16 is changing.
> > Looks like PDC_TOD_ITIMER is the call but I'm not sure offhand.
> > In any case, I've only seen it used as CPU cycle counter.
> > (ie 1:1 with CPU clock).
> 
> Hi Joel,
> 
> I think we have the rate in the variable "boot_cpu_data.cpu_hz" (see 
> arch/parisc/kernel/processor.c) already.

Technically that's our highest precision timer :)

c.
