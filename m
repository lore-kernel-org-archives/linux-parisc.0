Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1417A4852
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 27 Feb 2004 18:05:06 -0700 (MST)
Date: Sat, 28 Feb 2004 01:05:03 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
In-Reply-To: <Pine.LNX.4.58.0402272325410.9660@sal.ucc.ie>
Message-ID: <Pine.LNX.4.58.0402280055400.10811@sal.ucc.ie>
References: <Pine.LNX.4.58.0402260003140.26587@sal.ucc.ie>
	<1077757727.26560.7.camel@dhcp23.swansea.linux.org.uk>
	<Pine.LNX.4.58.0402260127230.26951@sal.ucc.ie>
	<20040226051124.GB3645@colo.lackof.org>
	<Pine.LNX.4.58.0402260513010.28003@sal.ucc.ie>
	<20040226155659.GA11451@colo.lackof.org>
	<1077907459.29711.13.camel@dhcp23.swansea.linux.org.uk>
	<20040227212356.GA28668@colo.lackof.org>
	<Pine.LNX.4.58.0402272325410.9660@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, 27 Feb 2004, M. Grabert wrote:

> On Fri, 27 Feb 2004, Grant Grundler wrote:
>
> > Anyone interested in deleted all use of the cpu_to_leXX
> > and leXX_to_cpu in linux-2.6/arch/parisc/lib/io.c?
>
> What do I have to do?
>
> I assumed that I just have to remove the use of the functions, nothing else.
> I've created a modified io.c for 2.4 and for 2.6 (can be found here:
> http://www.cs.ucc.ie/~xam/io/ ). I used a CVS version updated a couple
> of minutes ago, just after the merge with 2.6.4-rc1.

[...]

> I'll test the the modifications tomorrow morning (in about 10 hours that is),

Well, I actually couldn't resist and tried the modifications on a
linux-2.4.25-pa0 kernel (with a hard drive attached to onboard IDE
controller of the C3000).

The 'vanilla' linux-2.4.25-pa0 works, but without DMA.
With the modifications I made, the onboard IDE shows similar big-endian
problems as when using the siimage driver with a unpatched kernel (actually what I
somehow expected).

It really looks as either the Promise and the onboard-IDE have big-endian
issues (which were revealed by these modifications), or the siimage driver
has a big-endian problem.

I will test the Promise card (perhaps even the Silicon Image card), and
the 2.6-kernel tomorrow.

BTW, all my other additional hardware seem to work correctly (second
ethernet network card, a wireless network card, 5-port USB2.0 card).


Thanks,
Greetings from Ireland,
   Max
