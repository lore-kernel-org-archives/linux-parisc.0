Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 983DF4864
	for <parisc-linux@parisc-linux.org>; Mon, 15 Jul 2002 11:13:30 -0600 (MDT)
Message-Id: <200207151713.g6FHDRN3024823@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] compiling kernels with gcc-3.1
To: tausq@debian.org
Date: Mon, 15 Jul 2002 13:13:27 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: joel.soete@freebel.net, parisc-linux@parisc-linux.org
In-Reply-To: <20020715162230.GJ8724@tausq.org> from "Randolph Chung" at Jul 15, 2002 09:22:30 am
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

> in at least some of the cases, i've seen one CPU is processing an
> unaligned trap for a kernel space insn. i don't see how the particular
> pieces of code that's causing the trap are unaligned tho (eg.
> search_exception_table).
> 
> One thing about the unaligned handler is that it wlil fail silently
> while handling "non-trivial" load/store insns. For example, it doesn't
> handle the ma/mb or m/sm completors for displacement/indexed
> load/stores.

Is --disable-indexing used in kernel builds?  This should stop gcc
from generating the above.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
