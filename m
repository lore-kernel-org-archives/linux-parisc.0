Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D0144829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 15:44:49 -0700 (MST)
Date: Mon, 11 Nov 2002 17:44:58 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111224458.GC11690@systemhalted>
References: <20021111211624.GC9704@systemhalted> <200211112236.gABMaoBX003275@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211112236.gABMaoBX003275@hiauly1.hia.nrc.ca>
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

> > 
> > Test suite completed:
> >   2518 test cases plus 2306 tests for exception flags executed.
> >   14 errors occurred.
> > 
> > They look to be exception related?
> 
> I doubt this is a gcc problem but it might be.  Certain floating-point
> compare instructions can generate invalid operation exceptions.  It's
> been awhile but I don't think we use these (see page 8-16 of PA 2.0
> arch).  An invalid operation exception will always occur with
> signaling nans.
> 
> You need to try to identify the insn that is causing the exception.
> This can be difficult in some cases because the exceptions are
> inexact.
> 

Again, delayed traps can be "Invalid Operation" exceptions within these
floating point tests. We may be seeing some of those issues. I really
need to find a way to properly flush delayed exceptions.

c.
