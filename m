Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 29 Jul 2003 12:51:30 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030729185130.GA22989@dsl2.external.hp.com>
References: <20030725063739.GA13017@systemhalted> <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk> <20030726174845.GF31744@systemhalted> <20030726180031.GG31744@systemhalted> <20030727122745.GC16753@dsl2.external.hp.com> <20030728155703.GA32553@systemhalted> <20030728174551.GC3840@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030728174551.GC3840@parcelfarce.linux.theplanet.co.uk>
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

On Mon, Jul 28, 2003 at 06:45:51PM +0100, Matthew Wilcox wrote:
...
> > It might be too costly to do the sync'ing all the time, and too costly
> > for a fast gettimeofday to do a sync at the polling point.

If they all use the same clock source they won't drift.

> > gettimeofday. Do we even have such a fast clock on PA? What is the
> > fastest clock across the most boxes?

cr16

> You know, you don't even need kernel help for this.  According to page
> 2-5 of the Kane book, the Interval Timer is accessible by non-privileged
> instructions.

One needs kernel help in determining the difference between CPUs
and handling CR16 rollover (mostly a problem for 32-bit machines).
But then user space can read CR16 and "normalize" the time.

grant
