Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 66F1F483B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Jun 2002 22:12:18 -0600 (MDT)
Message-Id: <200206170412.g5H4CGP8011158@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Unaligned access failures with apt-get on SMP
To: rbradetich@uswest.net (Ryan Bradetich)
Date: Mon, 17 Jun 2002 00:12:16 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, richard_hirst@linuxcare.com
In-Reply-To: <1024283062.27050.29.camel@beavis> from "Ryan Bradetich" at Jun 16, 2002 09:04:22 pm
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

> any way I can tell from the binary?

Not that I am aware of.  On further thought, I think the user code is ok.

Studying you original message further, I see that the printout from
unaligned.c is fully consistent with the register dump and user code.
Thus, I have to think that the problem is actually in the kernel.

If the failure occurs all the time, I would put a break at 0x4005e47c
and then set a large ignore count.  Run the program and see how many
times the break is hit before the fault occurs.  Then, set the ignore
count to 1 less than the number of hits and rerun.  If the fault is
deterministic, you should be able to determine the exact conditions
which cause the "trap".

Oh, I remember that gdb may not print r3 correctly with info reg.
It's better to use p $r3 or printf "0x%x\n", $r3.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
