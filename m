Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 42C02482A
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 28 Mar 2004 16:51:37 -0700 (MST)
Message-Id: <200403282351.i2SNpZdU010717@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] spinlock align code triggering bug in gcc?
To: randolph@tausq.org
Date: Sun, 28 Mar 2004 18:51:35 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040328233637.GM750@tausq.org> from "Randolph Chung" at Mar 28,
	2004 03:36:37 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> pointer.  where the heck does it get 183 from (or 23 in the test 
> program)? :) i'm guessing it inlined the __ldcw_align() and did some 
> constant folding to do the alignment and then the offset becomes wrong?

23 = 8 + 15.  The 15 is from ldcw align.  Don't know why we are using
this value in a ldd.  I think the ldcw is aligned ok.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
