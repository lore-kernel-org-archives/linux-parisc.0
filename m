Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 29 Jul 2003 12:55:21 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	Matthew Wilcox <willy@debian.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030729185521.GB22989@dsl2.external.hp.com>
References: <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk> <20030726174845.GF31744@systemhalted> <20030726180031.GG31744@systemhalted> <20030727122745.GC16753@dsl2.external.hp.com> <20030728155703.GA32553@systemhalted> <20030728174551.GC3840@parcelfarce.linux.theplanet.co.uk> <20030728190455.GE32553@systemhalted> <20030728191420.GE3840@parcelfarce.linux.theplanet.co.uk> <20030728211012.GC6706@sleepie.demon.co.uk> <20030729175057.GA17107@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030729175057.GA17107@systemhalted>
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

On Tue, Jul 29, 2003 at 01:50:58PM -0400, Carlos O'Donell wrote:
>         unsigned long cr16;
>         asm("mfctl %%cr16, %0" : "=r" (cr16) : );
>         printf("cr16=%lu\n",cr16);

this only gets you the CR16 for *that* CPU.
Not useful since CR16 isn't syncronized at powerup between CPUs.
At least I don't think that's the case...maybe Kirk Bresniker knows
how that works. We've talked about this before on parisc-linux.

...
> With the comment I don't quite understand:
> linux-2.4/arch/parisc/kernel/time.c
>    /*
>     * FIXME: This won't work on smp because jiffies are updated by cpu
>     * 0.
>     *    Once parisc-linux learns the cr16 difference between
>     *    processors,
>     *    this could be made to work.
>     */

This is what I've been trying to explain.

> Does that mean that our time granularity drops drastically in the SMP
> case? We loose usec! (2.4 and 2.5 kernels)

not by much.

grant
