Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB1134829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 11:40:31 -0700 (MST)
Message-Id: <200301151840.h0FIeS9I018903@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 64 userspace
To: leandro.farinati@hp.com (FARINATI, LEANDRO)
Date: Wed, 15 Jan 2003 13:40:28 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <9A0482A7BD2506488AD9417C93F3714F011A1AE6@xsp01.brazil.hp.com> from "FARINATI,LEANDRO" at Jan 15, 2003 01:14:08 pm
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

> 	Hi people,
> 
> 	Where am I find the to do list to 64 userspace (to compile 64 bits
> applications)?

To my knowledge, there isn't one.  Roughly what is required is:

1) Kernel -- design and implement 64-bit system calls.

2) Binutils -- port hpux 64-bit tools to linux.

3) Gdb -- same as binutils.

4) GCC --  same as binutils.

5) Glibc -- implement 64-bit specific parts of ABI and system calls.

The ABI hasn't been discussed in detail other than it was to be generally
similar to that used under 64-bit hpux.   There are significant differences
between 64-bit hpux and 32-bit linux.  They use different linkers and
differ in the handling of function pointers.  The 32-bit linker was
ported from the 386 code while the 64-bit linker used by hpux was written
from scratch.  As a result, the 64-bit code is less tested and has more bugs.

Are you offering support from HP?  It's taken a number of years to
get to the current state of development on the 32-bit port given the
level of volunteer effort and support from HP.  What you are asking
won't happen for months, if not years.  The time to implement a 64-bit
userspace won't be as great as for the 32-bit port, but it still a
very significant effort.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
