Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD246482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 May 2003 09:21:47 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [127.0.0.1] (may be forged))
	by hiauly1.hia.nrc.ca (8.12.9/8.12.9) with ESMTP id h4CEwngL001053
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 May 2003 10:58:49 -0400 (EDT)
Message-Id: <200305121458.h4CEwmom001051@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH-2.5] Various cleanups
To: jbglaw@lug-owl.de (Jan-Benedict Glaw)
Date: Mon, 12 May 2003 10:58:48 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030512132248.GU27494@lug-owl.de> from "Jan-Benedict Glaw" at May 12, 2003 03:22:48 pm
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

> > I'm not applying these bits.  It's just not reasonable to add (void *)
> > casts to every function pointer comparison.  I know Linus will reject it.
> > We need to find a better way to fix this one -- and I suspect the right
> > way is to implement a __canonicalize_funcptr_for_compare in the kernel
> > and EXPORT_SYMBOL it.
> 
> I thougt about that, but didn't do it this way because I didn't like the
> approach to double libgcc's __canonicalize_funcptr_for_compare. Maybe
> we'd simply find a way to EXPORT_SYMBOL libgcc's version of that one...

No, you don't want to use the libgcc version as it is specific to
user programs.  A kernel version is needed.  I think all that needs to
be done is return the function pointer passed to it.  It should totally
disappear if inlined.  Thus, __canonicalize_funcptr_for_compare could
be defined in a header.

It might actually be necessary to do function pointer canonicalization
in the kernel in situations involving loadable modules.  One would
have to look at how the loader manages the plabels.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
