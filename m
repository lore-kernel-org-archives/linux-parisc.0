Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 28 Jul 2003 15:04:55 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030728190455.GE32553@systemhalted>
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

> You know, you don't even need kernel help for this.  According to page
> 2-5 of the Kane book, the Interval Timer is accessible by non-privileged
> instructions.

Isn't this going to be different for all CPU's? Which means if you get
scheduled around you might see negative moving time?

c.
