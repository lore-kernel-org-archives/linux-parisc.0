Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C6CC4852
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 27 Feb 2004 14:23:58 -0700 (MST)
Date: Fri, 27 Feb 2004 14:23:56 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
Message-ID: <20040227212356.GA28668@colo.lackof.org>
References: <Pine.LNX.4.58.0402260003140.26587@sal.ucc.ie>
	<1077757727.26560.7.camel@dhcp23.swansea.linux.org.uk>
	<Pine.LNX.4.58.0402260127230.26951@sal.ucc.ie>
	<20040226051124.GB3645@colo.lackof.org>
	<Pine.LNX.4.58.0402260513010.28003@sal.ucc.ie>
	<20040226155659.GA11451@colo.lackof.org>
	<1077907459.29711.13.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1077907459.29711.13.camel@dhcp23.swansea.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org, "M. Grabert" <xam@cs.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Feb 27, 2004 at 06:44:20PM +0000, Alan Cox wrote:
> On Iau, 2004-02-26 at 15:56, Grant Grundler wrote:
> > yes - the endian issue is probably harder to fix.
> 
> All mmio and pio goes through helper functions, so it suggests the
> helper ifdefs are simply wrong in ide-iops.c - which should make fixing
> stuff easier - probably the insw() op is the problem.

Correct. parisc insw/insl/outsw/outsl are all broken.
They all have cpu_to_leXX (or leXX_to_cpu()) calls and the
basic inw/outw are already taking care of the byte swap.
This has been mostly my fault since I originally didn't
know how the byte swapping was supposed to be
handled for a big endian arch.

Anyone interested in deleted all use of the cpu_to_leXX
and leXX_to_cpu in linux-2.6/arch/parisc/lib/io.c?

please post the tested patch here. I'll review and assign
bla^H^H^Hglory to the submitter when I commit it.

BTW, linux-2.4 has the same issue.
I expect the same patch will apply to both if it's
easier to test with linux-2.4.

thanks,
grant
