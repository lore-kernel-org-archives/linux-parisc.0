Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5890B4840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 20 Oct 2003 11:35:22 -0600 (MDT)
Date: Mon, 20 Oct 2003 13:31:24 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: HPPA FPU Specification? (FE_INEXACT raised by accident)
Message-ID: <20031020173124.GD32666@systemhalted>
References: <20031020160158.GC32666@systemhalted> <200310201631.h9KGVZ49001423@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200310201631.h9KGVZ49001423@hiauly1.hia.nrc.ca>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> > Does having them both at the same time violates the behaviour of
> > "feraiseexcept" in the ISO C standard (especially in the case of
> > underflow)? If feraiseexcept is called and only an underflow 
> > requested, but underflow and inexact are enabled, what then?
> 
> Does this help?  The standard says
> 
> "Whether the feraiseexcept function additionally raises the inexact
> exception whenever it raises the overflow or underflow exceptions is
> implementation defined."

Ah! I must admit I missed that bit. It does help. It means that I can
officially mark our 'fenv' as compliant and wash my hands clean of any
worry :)

c.
