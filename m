Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB320482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Feb 2003 10:32:34 -0700 (MST)
Message-Id: <200302101732.h1AHWW6m006054@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] pppd, pthread and hppa-linux question?
To: jsoe0708@tiscali.be (Joel Soete)
Date: Mon, 10 Feb 2003 12:32:32 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E476CFE000007AD@ocpmta3.freegates.net> from "Joel Soete" at Feb 10, 2003 05:55:56 pm
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

> Well, analysing sources, it seems to come from thread? 
> Is there some known pb regarding hppa-linux thread implementation (kernel,
> glibc, pppd, ...)?

Yes.  There have been issues with locking in glibc wrt threads.  Also,
the functions in atomicity.h are not atomic.  There may also be problems
in the kernel, particularly SMP.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
