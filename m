Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5FDDC482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jul 2003 14:43:20 -0600 (MDT)
Message-Id: <200307192043.h6JKhHvH002128@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.6.0-test1-pa1 crashes on 715/100
To: rscholz@hrzpub.tu-darmstadt.de (Ruediger Scholz)
Date: Sat, 19 Jul 2003 16:43:16 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3F19A776.2040001@hrzpub.tu-darmstadt.de> from "Ruediger Scholz" at Jul 19, 2003 10:17:58 pm
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

> >Check the list for a kernel patch to avoid this.  The 3.2 branch has
> >canonicalize_funcptr_for_compare.  Debian 3.0.4 doesn't.
> >
> But it was accidently compiled with gcc-3.3.1. Is this kernelpatch also 
> for gcc-3.3?

All hppa-linux versions from 3.2 on have canonicalize_funcptr_for_compare.
This fixes the comparison of function pointers in user space.  However,
the version of canonicalize_funcptr_for_compare in libgcc.a isn't suitable
for the kernel.

This arises because function pointers are implemented using pointers
to non-unique function descriptors.  -1 to 4095 are also special.
This is allowed in the C standard but the current kernel code doesn't
take this into account when comparing function pointers.  The only
other linux port to use function descriptors is ia64 and I believe
that its function pointers are unique, so no special code is needed
to resolve the pointers.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
