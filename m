Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C73B4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 12:38:31 -0700 (MST)
Message-Id: <200211121938.gACJcOii005554@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: jim_hull@hp.com
Date: Tue, 12 Nov 2002 14:38:24 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org
In-Reply-To: <012c01c28a82$1b5c71a0$6763f40f@cup.hp.com> from "Jim Hull" at Nov 12, 2002 11:31:32 am
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

> Yes, you can save state without "triggering pending traps", if what you
> mean by "triggering" is that you end up at the assist exception trap
> handler.
> 
> This is described in step 5 of the numbered list on p. 10-6, which
> describes what happens when a delayed trap occurs.

Thanks.  I think it is now clear how to implement the function to
raise a specific set of exceptions, one at a time.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
