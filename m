Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 423AB4831
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Apr 2003 19:49:47 -0600 (MDT)
Message-Id: <200304200149.h3K1njWm004550@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] floating point calling convention on pa
To: randolph@tausq.org
Date: Sat, 19 Apr 2003 21:49:45 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030420011256.GC25257@tausq.org> from "Randolph Chung" at Apr 19, 2003 06:12:56 pm
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

> Hi all,
> 
> I'm trying to understand the FP argument passing convention on 32-bit
> palinux... I don't think I have it quite right. Can anyone comment on
> the following?
> 
> 1) float-type arguments
>    float add(float a, float b, float c, float d)
>         a -> fr4L
>         b -> fr5L
>         c -> fr6L
>         d -> fr7L
>         retval = fr4L
> 
>    If >4 arguments, the rest are passed on the stack
>    starting at sp-52 in the caller's frame

Yes.

> 2) double-type arguments
>    double add(double a, double b, double c, double d)
>         a -> fr5
>         b -> fr7
>         c -> sp-56 in caller frame
>         d -> sp-64 in caller frame
>         retval = fr4
> 
>    Is it correct that the high-order 32-bit of fr5 is in fr5L
>    and the lower bits in fr5R?

Yes.  Big endian.

> 3) What happens when you have a mix argument function? e.g.
>    double foo(int a, float b, double c)
> 
>         a -> r26
>         b -> fr5L
>         c -> fr7
>         retval = fr4

Yes.

>    I don't quite understand the logic here :) What happens when
>    there are more and they need to go on the stack? What's the 
>    arrangement?

They go on the stack.  On the 32-bit port, stack arguments grow
downward.  The slots are word size.  Doubles are aligned to a
double word boundary.  For the first four slots, arguments go
in registers.  However, there are backup slots reserved on the
stack that the callee can use if it wants.

When there is a prototype for the argument and it is to be placed
in one of the first four slots, it will be passed according to its
type.  If there is no prototype, we put in both registers.

> I've looked through the SOM 32-bit runtime but (at least to me)
> it doesn't talk about this very clearly. I've been experimenting with
> gcc -S but I'd rather get a definitive answer :)

Should work.  Look at function_arg in pa.c.  Under hpux, there are
some small differences as the linker does argument relocation.

> Also, for passing structures by value to functions, is this correct?
> a) if sizeof(struct) <= 4, pass in register
> b) if sizeof(struct) <= 8), pass in even-numbered register pairs 
> c) if sizeof(struct) > 8, pass a pointer and callee will copy the
>    structure?

Yes.  Don't ask about the padding.  The data is right justified.
That's done with magic.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
