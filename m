Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA2E74854
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 12 Dec 2003 08:00:54 -0700 (MST)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com
	[172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	hBCF0ma01844; Fri, 12 Dec 2003 10:00:51 -0500
Subject: Re: [parisc-linux] proposed changes to dino.c
From: James Bottomley <James.Bottomley@steeleye.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
In-Reply-To: <20031212113025.GA4814@solo.franken.de>
References: <1071031038.1977.1.camel@mulgrave>
	<20031210045429.GA18782@colo.lackof.org>
	<1071093265.1730.27.camel@mulgrave>
	<20031212074838.GA16885@colo.lackof.org>
	<20031212113025.GA4814@solo.franken.de>
Content-Type: text/plain
Date: 12 Dec 2003 10:00:29 -0500
Message-Id: <1071241233.1814.9.camel@mulgrave>
Mime-Version: 1.0
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

On Fri, 2003-12-12 at 06:30, Thomas Bogendoerfer wrote:
> doesn't this also break PCI Vis-EG and FX cards setup ? On these
> cards the ROM contains PARISC firmware, which we need.

Only if we physically need acess to the ROMs from the linux driver after
the firmware is used...this is rarely true, even on x86.  I'm afraid I
only have GSC Vis-EG cards, so I can't test this though.

James
