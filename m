Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id DAE8F48A5
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 27 Feb 2004 16:50:25 -0700 (MST)
Date: Fri, 27 Feb 2004 23:50:20 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
In-Reply-To: <20040227212356.GA28668@colo.lackof.org>
Message-ID: <Pine.LNX.4.58.0402272325410.9660@sal.ucc.ie>
References: <Pine.LNX.4.58.0402260003140.26587@sal.ucc.ie>
	<1077757727.26560.7.camel@dhcp23.swansea.linux.org.uk>
	<Pine.LNX.4.58.0402260127230.26951@sal.ucc.ie>
	<20040226051124.GB3645@colo.lackof.org>
	<Pine.LNX.4.58.0402260513010.28003@sal.ucc.ie>
	<20040226155659.GA11451@colo.lackof.org>
	<1077907459.29711.13.camel@dhcp23.swansea.linux.org.uk>
	<20040227212356.GA28668@colo.lackof.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org, Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, 27 Feb 2004, Grant Grundler wrote:

> Anyone interested in deleted all use of the cpu_to_leXX
> and leXX_to_cpu in linux-2.6/arch/parisc/lib/io.c?

What do I have to do?

I assumed that I just have to remove the use of the functions, nothing else.
I've created a modified io.c for 2.4 and for 2.6 (can be found here:
http://www.cs.ucc.ie/~xam/io/ ). I used a CVS version updated a couple
of minutes ago, just after the merge with 2.6.4-rc1.

Was easy to do ... but I haven't tried to compile or run a kernel with the
modifications.

I'll test the the modifications tomorrow morning (in about 10 hours that is),
and will post the results. If successful, I'll also create the neccessary patches.
(btw, is there a special way how I should make the patches?)

> please post the tested patch here. I'll review and assign
> bla^H^H^Hglory to the submitter when I commit it.

;)

> BTW, linux-2.4 has the same issue.
> I expect the same patch will apply to both if it's
> easier to test with linux-2.4.

I'll try with both 2.4.25-pa0 and 2.6.4-rc1-paX and the Promise IDE
controller. Maybe these changes make also DMA work for the internal IDE
of the C3000.

 Max
