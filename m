Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7461E487D
	for <parisc-linux@parisc-linux.org>; Mon, 15 Jul 2002 09:24:55 -0600 (MDT)
Message-Id: <200207151524.g6FFOqqE023640@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] compiling kernels with gcc-3.1
To: joel.soete@freebel.net
Date: Mon, 15 Jul 2002 11:24:52 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@parisc-linux.org
In-Reply-To: <1026716599.3d3273b741097@webmail.tiscalinet.be> from "joel.soete@freebel.net" at Jul 15, 2002 09:03:19 am
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

> (I just note on the sti console)
> sshd (pid 322): illegal instruction (code 8)
> ...
> kernel panic...

This is just a guess but I will wager that this problem is related
to the problems with expect, the cc1plus crash and the mmap issues noted
elsewhere with SMP kernels.  There seem to be circumstances where the
kernel crashes when a user application traps unexpectedly.

Joel, you should be able to run sshd under gdb and find what the
cause of the illegal instruction is.  It should not be a problem
to download and build 3.4p1 with gcc 3.2 from <http://www.openssh.org>.
Build at -O1 with debugging enabled.  There are examples on their
mail list on how to run sshd in debug mode.  If the situation is
similar to the cc1plus crash, gdb will prevent the system from
crashing when the fault occurs.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
