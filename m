Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D325483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Sep 2003 13:12:42 -0600 (MDT)
Message-Id: <200309211912.h8LJCd59011386@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Found the r19 problem!
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Sun, 21 Sep 2003 15:12:39 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030921185531.GH6963@systemhalted> from "Carlos O'Donell" at Sep 21, 2003 02:55:31 pm
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

> > So use a caller saves register, place it in the clobbers, and let gcc
> > work around the usage (e.g. r4).
> >  
> > > > 	...
> > > > 	(Many insn later)
> > > > 	(stub) (dyncall) -> libpthread.so
> > > > 	-> libc.so
> > > 
> > > The above is an indirect call. r19 should be restored after the call
> > > if it is used after the call.
> > 
> > It is, but only after the asm(...) that lists r19 in the clobber.
> > 
> 
> Sorry "It is" should read "It is used" :)

Well that's why the restore is deleted.  So, the clobber must go
and r19 must be preserved across the asm(...).  As I said, you can't
clobber r19 when generating pic code.  It's treated as fixed register,
so clobbering it can lead to undefined behavior.

If the syscall used r19, it could include a use of r19 in the asm.
This would ensure the restore occurs before the syscall.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
