Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B959482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 16:58:55 -0600 (MDT)
Message-Id: <200308112258.h7BMwrcv021410@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
To: grundler@parisc-linux.org (Grant Grundler)
Date: Mon, 11 Aug 2003 18:58:53 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030811223955.GC25311@dsl2.external.hp.com> from "Grant Grundler" at Aug 11, 2003 04:39:55 pm
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

> > when using the gcc driver.
> 
> ok. -debug was good.

This shows what collect2 is doing.  It is useful to see the exact way
in which gcc is running ld.  -Wl,--verbose shows what ld is doing.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
