Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 640D3484A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 08:30:33 -0700 (MST)
Message-Id: <200301101530.h0AFUQ9q003197@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] unaligned accesses
To: jsoe0708@tiscali.be
Date: Fri, 10 Jan 2003 10:30:25 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E1AA8D500000877@ocpmta8.freegates.net> from "jsoe0708@tiscali.be" at Jan 10, 2003 09:24:40 am
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

> >> hmmm buggy: not always, the triky case is when you have to access to
> those
> >> kind of data encapsulated into a structure. I do not yet find any workaround
> >> or how to fix this kind of pb. Any idea (gcc-3.3?)?
> >
> >eh? what do you mean? 
> >
> well I will try to find back the example I encounter (somewhere in jfs-1.0.23
> IIRC)

I think what Randolph is saying is that structures don't provide a machine
independent way of transfering data from one machine to another.  If you
want to do that, you need a machine independent specification for the data.
Having worked on code to decode realtime telemetry data from various
spacecraft, I know that you need to be very aware of type sizes, alignment
and endianness issues on each architecture.  The same kind of issues come
up in handling graphics data.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
