Return-Path: <esproul@ntelos.net>
Received: from mailrtr03.ntelos.net (mailrtr03.ntelos.net [216.12.0.103])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7EBAF483B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 25 Mar 2004 06:31:56 -0700 (MST)
Received: from thunderbolt.oss.ntelos.net (thunderbolt.oss.ntelos.net
	[216.12.8.195])
	by mailrtr03.ntelos.net (8.11.7/8.11.7) with ESMTP id i2PDVuL20631
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 25 Mar 2004 08:31:56 -0500
Subject: Re: [parisc-linux] gdth driver on L2000
From: Eric Sproul <esproul@ntelos.net>
To: PA-RISC Linux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040325032743.GB7587@colo.lackof.org>
References: <1080142280.1928.35.camel@thunderbolt.oss.ntelos.net>
	<20040324173117.GA32052@colo.lackof.org>
	<1080158208.23069.6.camel@thunderbolt.oss.ntelos.net>
	<1080163275.23069.42.camel@thunderbolt.oss.ntelos.net>
	<20040325032743.GB7587@colo.lackof.org>
Content-Type: text/plain
Message-Id: <1080221515.17438.9.camel@thunderbolt.oss.ntelos.net>
Mime-Version: 1.0
Date: Thu, 25 Mar 2004 08:31:55 -0500
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

(should have replied to the list...)

On Wed, 2004-03-24 at 22:27, Grant Grundler wrote:
> On Wed, Mar 24, 2004 at 04:21:16PM -0500, Eric Sproul wrote:
> > Maybe even though CONFIG_SMP=Y it is not including smp.h?
> 
> Do not enable CONFIG_SMP on 2.6 kernels. It doesn't work.

Ah, OK.  Well that's a deal-breaker for me.  I really need SMP.

I'll see if I can adapt your gdth patch to 2.4.25 and I'll post my
results.  Thanks again for doing that.  It's one more piece of the
kernel I understand just a bit better now.  :)

Thanks,
Eric
