Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C28A4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 23:25:02 -0600 (MDT)
Message-Id: <200209210524.g8L5OtNw006246@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] malloc limits
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Sat, 21 Sep 2002 01:24:54 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, carlos@baldric.uwo.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020921044612.A753D4829@dsl2.external.hp.com> from "Grant Grundler" at Sep 20, 2002 10:46:12 pm
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

> is 0x80000000 the address or the size?

It's the address of the next contiguous chunk.  This is roughly the sum
of the address plus the size of the chunk to be freed.  The segv occurs
loading the size of the next chunk using the address.

I haven't been successful debugging the code directly.  I can get the
code to seg fault by setting SIG37 to nostop noprint, but the debugger
seems to think the fault occurs following the INLINE_SYSCALL in
__sigsuspend.  However, the address points to an ldi instruction
which can't seg fault, so I don't know what's up.  The data that
I posted were from a core dump.

> If it's the size then you get up into 0xc0000000 (which is ok).
> Getting up into 0xf0000000 - 0xffffffff address is not.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
