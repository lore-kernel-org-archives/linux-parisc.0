Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39359483B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Apr 2003 13:56:35 -0600 (MDT)
Message-Id: <200304251956.h3PJuR6v013809@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructurs
To: hans_boehm@hp.com (Boehm, Hans)
Date: Fri, 25 Apr 2003 15:56:27 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org,
	hans_boehm@hp.com
In-Reply-To: <75A9FEBA25015040A761C1F74975667D01442051@hplex4.hpl.hp.com> from "Boehm, Hans" at Apr 25, 2003 12:40:00 pm
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

> > > 2) If I mark a C function as a constructor function, and 
> > compile it with -fPIC, it seems to run before globals are 
> > properly accessible.  The retrieval of the address of a 
> > global through the global offset table seems to return a bad 
> > address and the access faults.  Are there known issues in 
> > this area?  (The offending function actually ends up in the 
> > main program, if that matters.)

I'm not aware of any.  All the libstdc++ test pass and this involves
running constructors in a shared library, so it would seem the PIC
register and got table must be setup.  Function pointer canonicalization
involves accessing the got table in some situations.  This can happen
in crtstuff.c which runs constructors.  Do you have a testcase?

It might be a linker issue.  There are some subtle issues with calling
PIC code that's not in a shared library.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
