Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 865344839
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Jul 2003 14:03:43 -0600 (MDT)
Date: Mon, 7 Jul 2003 16:02:40 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, jsoe0708@tiscali.be,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] warning: minor abi change
Message-ID: <20030707200240.GN30341@systemhalted>
References: <20030705230834.GB9682@dsl2.external.hp.com> <200307052353.h65NrZF4025169@hiauly1.hia.nrc.ca> <20030706041210.GA16894@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030706041210.GA16894@dsl2.external.hp.com>
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

> > This solution assumes that canonicalization is unnecessary in the kernel.
> > Probably, in most cases it is.  However, if you really need to canonicalize
> > a function pointer from user space, then you are going to have to figure
> > out how to call into the dynamic loader from the kernel.  This obviously
> > isn't very safe.  So, possibly this implies that function pointers passed
> > in syscalls should be canonicalized before the kernel is entered (i.e.,
> > glibc should do the canonicalization).
> > 
> > As far as kernel modules go, I don't know how function pointers are
> > handled.  If you pass a function pointer from one module to another,
> > does it need canonicalization?
> 
> I depend on willy/tausq/amodra/et al to understand stuff like this.

I can't really come up with a scenario where userspace passes a function
pointer to the kernel and has the kernel call or compare the function
pointer?

If someone can, please tell me :)

c.
