Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C31B54892
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 13 Dec 2003 13:33:45 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AVGSN-0006lu-HB; Sat, 13 Dec 2003 20:33:43 +0000
Date: Sat, 13 Dec 2003 20:33:43 +0000
From: Matthew Wilcox <willy@debian.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] proposed changes to dino.c
Message-ID: <20031213203343.GP27116@parcelfarce.linux.theplanet.co.uk>
References: <1071031038.1977.1.camel@mulgrave>
	<20031210045429.GA18782@colo.lackof.org>
	<1071093265.1730.27.camel@mulgrave>
	<20031212074838.GA16885@colo.lackof.org>
	<1071241131.1814.5.camel@mulgrave>
	<1071257297.21661.3.camel@dhcp23.swansea.linux.org.uk>
	<20031213035125.GB28775@colo.lackof.org>
	<1071329635.23720.2.camel@dhcp23.swansea.linux.org.uk>
	<1071330357.2024.4.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1071330357.2024.4.camel@mulgrave>
Sender: <willy@www.linux.org.uk>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
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

On Sat, Dec 13, 2003 at 10:45:54AM -0500, James Bottomley wrote:
> Hmm, yes...I completely blow away the ROM bar in the patch...what I
> should do is just to remove it's IORESOURCE_MEM flag so it isn't
> ordinarily allocated (but it's requested location and size are still
> available).  Then any driver that wanted access could get it...we still
> have 1020kB available for mapping up to three roms in the bridge window.

I rather think the generic PCI code should be fixed to not enable the
ROM resource by default.  Many PCI devices do not cope well with this
*anyway*, we definitely shouldn't be doing it in anything except the
driver.

> The alternative is just to resize the bridge window after we've counted
> the resources...I'm less enthusiastic about this beacuse the dino PCI
> window has a maximum size of 8MB for everything on the bus...plug a few
> of these four ports into a dino PCI bus and we'll still run out of
> memory.

Well, we could allocate more than 8MB for a Dino's PCI window.  As I
recall (should check the spec ...) we can set any of the 30 bits in
the status register to forward any of those 8MB chunks to the PCI bus.
I think we could also get away with allocating less than 8MB to an
individual PCI bus by programming the CCIO registers to not forward all
that space to the parent GSC bus.  But none of this has been necessay so
far, and I hope we don't manage to concoct a situation where it might be.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
