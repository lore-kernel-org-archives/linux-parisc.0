Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD5C14852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 28 Feb 2004 10:24:59 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i1SHP8a23490; Sat, 28 Feb 2004 12:25:08 -0500
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20040228164506.GA11659@colo.lackof.org>
References: <1077757727.26560.7.camel@dhcp23.swansea.linux.org.uk>
	<Pine.LNX.4.58.0402260127230.26951@sal.ucc.ie>
	<20040226051124.GB3645@colo.lackof.org>
	<Pine.LNX.4.58.0402260513010.28003@sal.ucc.ie>
	<20040226155659.GA11451@colo.lackof.org>
	<1077907459.29711.13.camel@dhcp23.swansea.linux.org.uk>
	<20040227212356.GA28668@colo.lackof.org>
	<Pine.LNX.4.58.0402272325410.9660@sal.ucc.ie>
	<Pine.LNX.4.58.0402280055400.10811@sal.ucc.ie>
	<1077984432.31248.4.camel@dhcp23.swansea.linux.org.uk>
	<20040228164506.GA11659@colo.lackof.org>
Content-Type: text/plain
Date: 28 Feb 2004 11:24:53 -0600
Message-Id: <1077989094.1968.62.camel@mulgrave>
Mime-Version: 1.0
Cc: "M. Grabert" <xam@cs.ucc.ie>,
	PARISC list <parisc-linux@lists.parisc-linux.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, 2004-02-28 at 10:45, Grant Grundler wrote:
> include/asm/io.h:#define readw(addr) (*(volatile unsigned short *) __io_virt(addr))
> 
> 
> Uhoh..no swapping at all in this case.
> I was expecting readw to swap bytes.
> Am I just confused again about how a BE is supposed to behave?
> *sigh*

The rule is supposed to be that inX/outX/readX/writeX be free of
endianness issues on the bus.  i.e. doing a readw() on a memory mapped
PCI config space on parisc should have a le16_to_cpu implied in the
readw().

Obviously, accesses which go straight to memory (i.e. not via accessor
macros) are the responsibility of the driver for sorting out the
endianness.

James
