Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51DA548B5
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 13 Dec 2003 13:52:22 -0700 (MST)
Date: Sat, 13 Dec 2003 13:52:20 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] proposed changes to dino.c
Message-ID: <20031213205220.GA6089@colo.lackof.org>
References: <1071031038.1977.1.camel@mulgrave>
	<20031210045429.GA18782@colo.lackof.org>
	<1071093265.1730.27.camel@mulgrave>
	<20031212074838.GA16885@colo.lackof.org>
	<1071241131.1814.5.camel@mulgrave>
	<1071257297.21661.3.camel@dhcp23.swansea.linux.org.uk>
	<20031213035125.GB28775@colo.lackof.org>
	<1071329635.23720.2.camel@dhcp23.swansea.linux.org.uk>
	<1071330357.2024.4.camel@mulgrave>
	<20031213203343.GP27116@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031213203343.GP27116@parcelfarce.linux.theplanet.co.uk>
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	PARISC list <parisc-linux@lists.parisc-linux.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Dec 13, 2003 at 08:33:43PM +0000, Matthew Wilcox wrote:
> Well, we could allocate more than 8MB for a Dino's PCI window.  As I
> recall (should check the spec ...) we can set any of the 30 bits in
> the status register to forward any of those 8MB chunks to the PCI bus.

that's correct. Only the top most and bottom most bits are fixed
at zero (both 8MB ranges are not routeable).

> I think we could also get away with allocating less than 8MB to an
> individual PCI bus by programming the CCIO registers to not forward all
> that space to the parent GSC bus.  But none of this has been necessay so
> far, and I hope we don't manage to concoct a situation where it might be.

"Doctor, when I stand like this, my neck hurts."
"Don't do that."

:^)

grant
