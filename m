Return-Path: <alan@lxorguk.ukuu.org.uk>
Received: from dhcp23.swansea.linux.org.uk
	(cpc1-cwma1-5-0-cust4.swan.cable.ntl.com [80.5.120.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E4F6C4852
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 27 Feb 2004 11:48:14 -0700 (MST)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10) with ESMTP id
	i1RIiQ0r029754; Fri, 27 Feb 2004 18:44:26 GMT
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10/Submit) id
	i1RIiN9I029752; Fri, 27 Feb 2004 18:44:24 GMT
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20040226155659.GA11451@colo.lackof.org>
References: <Pine.LNX.4.58.0402260003140.26587@sal.ucc.ie>
	<1077757727.26560.7.camel@dhcp23.swansea.linux.org.uk>
	<Pine.LNX.4.58.0402260127230.26951@sal.ucc.ie>
	<20040226051124.GB3645@colo.lackof.org>
	<Pine.LNX.4.58.0402260513010.28003@sal.ucc.ie>
	<20040226155659.GA11451@colo.lackof.org>
Content-Type: text/plain
Message-Id: <1077907459.29711.13.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Fri, 27 Feb 2004 18:44:20 +0000
Cc: parisc-linux@lists.parisc-linux.org, "M. Grabert" <xam@cs.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Iau, 2004-02-26 at 15:56, Grant Grundler wrote:
> yes - the endian issue is probably harder to fix.

All mmio and pio goes through helper functions, so it suggests the
helper ifdefs are simply wrong in ide-iops.c - which should make fixing
stuff easier - probably the insw() op is the problem.

> But I'm skeptical that's really the issue. I suspect more the IDE command
> isn't being programmed properly into the Promise controller and thus it
> doesn't DMA correctly or for some other reason complete the command.
> ie it has no reason to interrupt.

Well if the endian stuff is broken then anything could happen

> > The Promise Ultra100 TX2 controller is reported to work on PPC - not the
> > siimage one - so there is probably no difference between the PARISC and
> > PPC ports in this respect.
> 
> ok

siimage should, at least from data sheet review 
