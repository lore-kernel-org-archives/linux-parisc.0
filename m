Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP
	id 094CB482E; Mon, 28 Jul 2003 13:14:21 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19hDRs-0004sW-24; Mon, 28 Jul 2003 20:14:20 +0100
Date: Mon, 28 Jul 2003 20:14:20 +0100
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Matthew Wilcox <willy@debian.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030728191420.GE3840@parcelfarce.linux.theplanet.co.uk>
References: <20030725063739.GA13017@systemhalted> <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk> <20030726174845.GF31744@systemhalted> <20030726180031.GG31744@systemhalted> <20030727122745.GC16753@dsl2.external.hp.com> <20030728155703.GA32553@systemhalted> <20030728174551.GC3840@parcelfarce.linux.theplanet.co.uk> <20030728190455.GE32553@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030728190455.GE32553@systemhalted>
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

On Mon, Jul 28, 2003 at 03:04:55PM -0400, Carlos O'Donell wrote:
> > You know, you don't even need kernel help for this.  According to page
> > 2-5 of the Kane book, the Interval Timer is accessible by non-privileged
> > instructions.
> 
> Isn't this going to be different for all CPU's? Which means if you get
> scheduled around you might see negative moving time?

We discussed this in the Black Thorn ... record what value you last
returned to the user and never return less than that.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
