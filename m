Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A2E564874
	for <parisc-linux@parisc-linux.org>; Fri, 10 Jan 2003 11:48:31 -0700 (MST)
Message-Id: <200301101848.h0AImToB004181@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: floating point exception error
To: jim.hull@hp.com
Date: Fri, 10 Jan 2003 13:48:29 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@parisc-linux.org
In-Reply-To: <003101c2b8d3$477c8bb0$6763f40f@cup.hp.com> from "Jim Hull" at Jan 10, 2003 10:08:29 am
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

> What it does not explain is why the original message reported a
> difference between a PA-8600 and a PA-8700.  According to every internal
> HP processor document and PA-RISC FP designer I've been able to track
> down, this area of the design hasn't been changed since the original
> PA-8000, so there shouldn't be any differences in behavior.

I looked at the assembly code.  The original test was done under hpux.
I see that the call to ull2dbl has been optimized out of the loop.  It
is just called once.  So, the code probably is trapping there as well.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
