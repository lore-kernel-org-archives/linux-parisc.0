Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51CC24829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 15:37:00 -0700 (MST)
Message-Id: <200211112236.gABMaoBX003275@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 11 Nov 2002 17:36:50 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
In-Reply-To: <20021111211624.GC9704@systemhalted> from "Carlos O'Donell" at Nov 11, 2002 04:16:24 pm
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

> Failure: Real part of: csinh (-inf + NaN i) == inf + NaN i plus sign of zero/inf not specified: Exception "Invalid operation" set
> 
> Test suite completed:
>   2518 test cases plus 2306 tests for exception flags executed.
>   14 errors occurred.
> 
> 
> They look to be exception related?

I doubt this is a gcc problem but it might be.  Certain floating-point
compare instructions can generate invalid operation exceptions.  It's
been awhile but I don't think we use these (see page 8-16 of PA 2.0
arch).  An invalid operation exception will always occur with
signaling nans.

You need to try to identify the insn that is causing the exception.
This can be difficult in some cases because the exceptions are
inexact.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
