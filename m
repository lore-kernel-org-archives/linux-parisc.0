Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A7914852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 28 Feb 2004 12:48:09 -0700 (MST)
Date: Sat, 28 Feb 2004 12:48:08 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
Message-ID: <20040228194808.GB11659@colo.lackof.org>
References: <20040226051124.GB3645@colo.lackof.org>
	<Pine.LNX.4.58.0402260513010.28003@sal.ucc.ie>
	<20040226155659.GA11451@colo.lackof.org>
	<1077907459.29711.13.camel@dhcp23.swansea.linux.org.uk>
	<20040227212356.GA28668@colo.lackof.org>
	<Pine.LNX.4.58.0402272325410.9660@sal.ucc.ie>
	<Pine.LNX.4.58.0402280055400.10811@sal.ucc.ie>
	<1077984432.31248.4.camel@dhcp23.swansea.linux.org.uk>
	<20040228164506.GA11659@colo.lackof.org>
	<20040228174149.GD25779@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040228174149.GD25779@parcelfarce.linux.theplanet.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Feb 28, 2004 at 05:41:49PM +0000, Matthew Wilcox wrote:
> > Uhoh..no swapping at all in this case.
> > I was expecting readw to swap bytes.
> > Am I just confused again about how a BE is supposed to behave?
> > *sigh*
> 
> You're confused by looking at the unused definition ;-)

Worse - I was confused by looking at linux-2.6/asm/io.h my laptop. :^(
/me hides

> #define readw(addr) le16_to_cpu(__raw_readw(addr))

yes - so I went on a very short goose chase.
ide_insw_mm stuff should be fine too.

thanks,
grant
