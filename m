Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02CFF482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 11:30:43 -0600 (MDT)
Message-Id: <200308111730.h7BHUf9S018795@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
To: grundler@parisc-linux.org (Grant Grundler)
Date: Mon, 11 Aug 2003 13:30:40 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030811152442.GB20405@dsl2.external.hp.com> from "Grant Grundler" at Aug 11, 2003 09:24:42 am
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

> I upgraded to gcc-3.3/unstable and got the same result when attempting
> to build glxinfo by hand.

It's not clear what's going on.  Possibly, linking with libgcc.a
is interacting in a bad way with shared libraries linked with
libgcc_s.so.  You can get more info by adding `-Wl,-v' to the link
command.  Adding `-Wl,-debug' to the gcc link command will show
the full `ld' command.

I am certain that the symbols are defined in libgcc_s.so.  It may
be that the linker isn't looking for dependent libraries correctly.
Using the g++ driver or adding `-shared-libgcc' to the link command
should work around the problem.  But I don't think that it should
be necessary.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
