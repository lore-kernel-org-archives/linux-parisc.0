Return-Path: <alan@lxorguk.ukuu.org.uk>
Received: from dhcp23.swansea.linux.org.uk
	(cpc1-cwma1-5-0-cust4.swan.cable.ntl.com [80.5.120.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0AF5E4852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 28 Feb 2004 09:11:08 -0700 (MST)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10) with ESMTP id
	i1SG7E0r031312; Sat, 28 Feb 2004 16:07:14 GMT
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10/Submit) id
	i1SG7EaS031310; Sat, 28 Feb 2004 16:07:14 GMT
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: "M. Grabert" <xam@cs.ucc.ie>
In-Reply-To: <Pine.LNX.4.58.0402280055400.10811@sal.ucc.ie>
References: <Pine.LNX.4.58.0402260003140.26587@sal.ucc.ie>
	<1077757727.26560.7.camel@dhcp23.swansea.linux.org.uk>
	<Pine.LNX.4.58.0402260127230.26951@sal.ucc.ie>
	<20040226051124.GB3645@colo.lackof.org>
	<Pine.LNX.4.58.0402260513010.28003@sal.ucc.ie>
	<20040226155659.GA11451@colo.lackof.org>
	<1077907459.29711.13.camel@dhcp23.swansea.linux.org.uk>
	<20040227212356.GA28668@colo.lackof.org>
	<Pine.LNX.4.58.0402272325410.9660@sal.ucc.ie>
	<Pine.LNX.4.58.0402280055400.10811@sal.ucc.ie>
Content-Type: text/plain
Message-Id: <1077984432.31248.4.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Sat, 28 Feb 2004 16:07:13 +0000
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sad, 2004-02-28 at 01:05, M. Grabert wrote:
> It really looks as either the Promise and the onboard-IDE have big-endian
> issues (which were revealed by these modifications), or the siimage driver
> has a big-endian problem.

None of the drivers have big endian problems (tested on other archs)

> I will test the Promise card (perhaps even the Silicon Image card), and
> the 2.6-kernel tomorrow.

The SI goes via mmio promise via PIO, so it may be you unfixed the one
that was right ?
