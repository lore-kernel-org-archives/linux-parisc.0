Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9527C4840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 20 Oct 2003 10:56:13 -0600 (MDT)
Message-Id: <200310201656.h9KGuAew001566@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: HPPA FPU Specification? (FE_INEXACT raised by accident)
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Mon, 20 Oct 2003 12:56:10 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <200310201631.h9KGVZ49001423@hiauly1.hia.nrc.ca> from "John David Anglin" at Oct 20, 2003 12:31:34 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Also, in F.7.6.2,

"If the argument to the feraiseexcept function in <fenv.h> represents
IEC 60559 valid coincident exceptions for atomic operations (namely
overflow and inexact, or underflow and inexact) then overflow or
underflow is raised before inexact."

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
