Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A4EF4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 10:57:46 -0700 (MST)
Message-Id: <200211121753.gACHroK0005228@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: jim_hull@hp.com
Date: Tue, 12 Nov 2002 12:53:50 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org
In-Reply-To: <00fc01c28a72$ec50fa70$6763f40f@cup.hp.com> from "Jim Hull" at Nov 12, 2002 09:42:51 am
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

> This isn't right.  According to "Delayed Trapping" on p. 10-5 of the
> PA-RISC 2.0 book, an fcpy need not raise a pending exception, because it
> is not mentioned in the "delayed trap must occur" list.

What about "The current instruction is a load or store of the detination
register of a pending trapping instruction or an operation which depends
on a pending trapping instruction"?

I think the latter part of the sentence would apply to a fcpy of the
destination register of a pending trapping instruction.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
