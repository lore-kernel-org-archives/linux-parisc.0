Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3445A4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 17:22:19 -0700 (MST)
Message-Id: <200211120022.gAC0MDQs003494@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 11 Nov 2002 19:22:13 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
In-Reply-To: <20021111232711.GB12433@systemhalted> from "Carlos O'Donell" at Nov 11, 2002 06:27:11 pm
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

> And from the comment it seems that DHD wasn't sure either :)
> I don't quite understand what is meant by specifying register 0L?

You just have to do a floating-point load/store to/from register
0/0L using a doubleword/word instruction.  See the arch manual and
the comments about specify register 0 near the bottom of each
instruction description.  0L is the left part of floating 
register 0.  Doing this as a volatile asm should force completion
of all previous floating-point instructions.

A store from register 0 (the floating point status register) is a
safe barrier but you need to provide a location to store to.

I don't believe "fcpy,dbl %%fr0,%%fr0" provides the barrier
that you want.  The floating-point coprocessor is not required to
execute instructions sequentially although they must appear
sequential to software.  The above insn is a nop and the coprocessor
could throw it away early in the pipeline.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
