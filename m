Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7BB71484B
	for <parisc-linux@parisc-linux.org>; Sun,  2 Feb 2003 15:02:20 -0700 (MST)
Message-Id: <200302022202.h12M2InV026338@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Compiler switches
To: willy@debian.org (Matthew Wilcox)
Date: Sun, 2 Feb 2003 17:02:18 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
In-Reply-To: <20030202210334.H21040@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Feb 2, 2003 09:03:34 pm
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

> I think they definitely should be implied by configuring for hppa-linux.
> I don't see any enthusiasm for allowing use of additional space registers
> for special purposes.

Ok, I will do some testing with fast indirect and no space registers.

> hmm.. part of the problem is the ld -r steps.  The current 2.5 build
> process does things like:

ld -r is generally bad news on the PA.  The compiler selects call
types based on the distance from the call to the beginning of the
current translation unit, or function if -ffunction-sections is being
used.  Relinking without using -ffunction-sections will change the
distance to the beginning of the code section for all calls.  That's
where the linker will insert a long call stub if necessary.  If linking
with ld -r creates an object with a text section larger than 240k, then
there are likely to be calls which can't reach a long branch stub for
calls external to the object.

I guess if the linker could create stubs when doing ld -r then this
problem could be avoided.  However, I think stubs are created only
when doing a final link.

Using -ffunction-sections may have some drawbacks.  Normally, related
functions are placed in the same object.  The linker does some grouping
of sections but I doubt it is optimal.  So, you might end up needing
stubs in some cases where you would want a simple {bl|b,l}.  You wouldn't
want this to happen when you have a tightly coupled pair of sibling
calls.

> Now, which .text is limited to 240k?  loop.o, drivers/block/built-in.o,
> drivers/built-in.o or vmlinux?

My understanding is that it's the size of any text sections involved
in a final link.  The linker intersperses stub groups between the text
sections that are used in any final link.  Thus, the final text section
for vmlinux can be much larger than 240k and stubs will be provided
for any branches exceeding 240k.  Thus, you shouldn't need -ffunction-sections
when compiling objects that will be prelinked using ld -r if the resultant
size of the text sections after prelinking is smaller than 240k.

> > When the total code bytes exceeds the above limit (PA 1.X), gcc switches
> > to long indirect calls.  These are horribly inefficient.
> 
> Horribly inefficient in terms of being prefetchable?

No, in terms of the number of instructions involved.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
