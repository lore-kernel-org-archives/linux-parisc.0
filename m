Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BF7C483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 19 Oct 2003 12:47:00 -0600 (MDT)
Message-Id: <200310191846.h9JIkxMq027125@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [patch] handle pagefaults on unaligned access
To: randolph@tausq.org
Date: Sun, 19 Oct 2003 14:46:58 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20031019063825.GE24406@tausq.org> from "Randolph Chung" at Oct 18, 2003 11:38:25 pm
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

> while testing out gcj today, i was able to crash the machine
> consistently with both 2.4 and 2.6 kernel. turns out our unaligned
> handler doesn't handle page faults properly. in the case for gcj, there
> was a ldh on the edge of the page, the first byte is on a resident page,
> the 2nd byte is on a faulting page.

What's generating the unaligned ldh?  This will really kill performance.
GCC shouldn't do this...

My system also crashed last night, probably running the gcj testsuite.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
