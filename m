Return-Path: <tsbogend@alpha.franken.de>
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id EAF364854
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 12 Dec 2003 08:46:37 -0700 (MST)
Date: Fri, 12 Dec 2003 16:38:58 +0100
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] proposed changes to dino.c
Message-ID: <20031212153858.GA5892@solo.franken.de>
References: <1071031038.1977.1.camel@mulgrave>
	<20031210045429.GA18782@colo.lackof.org>
	<1071093265.1730.27.camel@mulgrave>
	<20031212074838.GA16885@colo.lackof.org>
	<20031212113025.GA4814@solo.franken.de>
	<1071241233.1814.9.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1071241233.1814.9.camel@mulgrave>
From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
Cc: Grant Grundler <grundler@parisc-linux.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Dec 12, 2003 at 10:00:29AM -0500, James Bottomley wrote:
> On Fri, 2003-12-12 at 06:30, Thomas Bogendoerfer wrote:
> > doesn't this also break PCI Vis-EG and FX cards setup ? On these
> > cards the ROM contains PARISC firmware, which we need.
> 
> Only if we physically need acess to the ROMs from the linux driver after
> the firmware is used...this is rarely true, even on x86.  I'm afraid I
> only have GSC Vis-EG cards, so I can't test this though.

sticon/stifb map the PCI ROM to copy out routines and fonts during
startup of the drivers.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
