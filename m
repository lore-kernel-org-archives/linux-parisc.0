Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2B26482A
	for <parisc-linux@parisc-linux.org>; Sat, 30 Mar 2002 10:36:13 -0700 (MST)
Message-Id: <200203301736.g2UHaAic028252@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Fwd: Re: Any hppa gurus?
To: carlos@baldric.uwo.ca (Carlos O'Donell Jr.)
Date: Sat, 30 Mar 2002 12:36:09 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: will@misconception.org.uk, parisc-linux@parisc-linux.org,
	debian-hppa@debian.org
In-Reply-To: <20020330104724.A16468@systemhalted> from "Carlos O'Donell Jr." at Mar 30, 2002 10:47:24 am
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

> > 
> > So, are the first four floats/doubles in an arg list always passed in 
> > registers?

No.  Although it might seem that you could pass 4 floats and 4 ints, this
is not done.  The 32-bit linux ABI is exactly the same as the 32-bit hpux ABI
except that argument relocations aren't done.  There are situations (e.g.,
indirect calls) where an argument is passed in both general and floating
registers under hpux because the linker doesn't know how to relocate
the arguments for the call.  Thus, you can't use gr24 for an int argument
and fr5 for a different float argument.

This isn't going to change as changing the ABI would require recompilation
of everthing, as well as modifications to gcc, binutils, gdb and the
runtime documentation.  You can find the HP runtime documents here:
<http://h21007.www2.hp.com/dspp/tech/tech_TechTypeListingPage_IDX/1,1704,10403,00.html>.

> > 
> > How about func(int, float, int, double, int, float)?
> > 
> >
> 
> A float fits into a single fr register.
> A double fits into two fr registers (fr7 (uses fr6),fr5 (uses fr4)) 
> 
> 
> 	int    gr26 - fr7    ===
> 	===    gr25 - fr6    ===
> 	int    gr24 - fr5    float
> 	===    gr23 - fr4    ===

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
