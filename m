Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 74C854829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Jan 2003 10:48:00 -0700 (MST)
Message-Id: <200301071747.h07HlrmN022946@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Problem with weak symbols
To: b.gunreben@web.de (b.gunreben)
Date: Tue, 7 Jan 2003 12:47:53 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E1AD095.FA5CF165@web.de> from "b.gunreben" at Jan 7, 2003 02:05:25 pm
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

> Hi,
> 
> I have a problem with weak symbols on parisc. If I use the following
> small program, the result should be always (nil), but it isn´t:

> asm (".weak linux_bla");
> asm (".weak linux_foo");

Don't use asm's to weaken symbols.  Use GCC's attribute weak.  GCC
needs to know whether a symbol is weak or not.

> extern const char * linux_bla;
> extern const int linux_foo[];

> > ./weak
> linux_bla: 0x205f0
> linux_foo: (nil)
> 
> The main difference in compiling seems to be the different relocation
> type for both symbols:

What is printed in the first case is the value of the $dp register.
For some reason, $global$ is not being subtracted from the symbol value
(zero).  This is a linker bug, not a gcc bug.

We probably should be using DPREL relocations for linux_foo.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
