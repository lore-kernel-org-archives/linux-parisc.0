Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9D7148A7
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 12 Dec 2003 20:53:45 -0700 (MST)
Date: Fri, 12 Dec 2003 20:53:44 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] proposed changes to dino.c
Message-ID: <20031213035344.GC28775@colo.lackof.org>
References: <1071031038.1977.1.camel@mulgrave>
	<20031210045429.GA18782@colo.lackof.org>
	<1071093265.1730.27.camel@mulgrave>
	<20031212074838.GA16885@colo.lackof.org>
	<1071241131.1814.5.camel@mulgrave>
	<1071257297.21661.3.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1071257297.21661.3.camel@dhcp23.swansea.linux.org.uk>
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Dec 12, 2003 at 07:28:18PM +0000, Alan Cox wrote:
> You don't need the ROM mapped expect for reading stuff like MAC, and you
> can do that by mapping each port over the same address range.

doh...MAC is unique to each card...delete my previous mail.

But then the basic problem James is having is not with the virtual
address the ROM gets mapped to, but rather the PCI bus MMIO address
assigned to the ROM BAR.

grant
