Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1559482A
	for <parisc-linux@parisc-linux.org>; Sat, 30 Mar 2002 14:32:29 -0700 (MST)
Message-Id: <200203302132.g2ULWNcp028559@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Fwd: Re: Any hppa gurus?
To: carlos@baldric.uwo.ca (Carlos O'Donell Jr.)
Date: Sat, 30 Mar 2002 16:32:23 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org, will@misconception.org.uk
In-Reply-To: <20020330151130.B16616@systemhalted> from "Carlos O'Donell Jr." at Mar 30, 2002 03:11:30 pm
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

> It's clear that you can't pass 8 words, since the 32-Bit ABI says that
> only the first 4 words are passed in registers as parameters for a function (2-26).
> 
> I'm not sure what's implied by the need for 4 words of "spill over" in the stack

I some situations, the callee needs to save the argument registers on
the stack.  There are 4 words reserved for this.

> for the first 4 arguments to the function call.
> 
> int,int,float produces:
> 
> 	Produced	Produced		Expected
> 
> 	int	gr26	fr7	-----		===	float
> 	int	gr25	fr6	float		===	-----
> 	---	gr24	fr5	-----		---	-----
> 	---	gr23	fr4	-----		---	-----

You've got the order of the float registers reversed.  They are allocated
in order of increasing number starting with fr4.

> Lately I was thrown by the call to printf (vararg):
> 
> char*,int,double,int,float,int,float:
> 
> 	Produced		Produced	
> 
>         char		gr26	fr7	doubleH
>         int		gr25	fr6	doubleL
>         doubleH		gr24	fr5	-----
>         doubleL		gr23	fr4	-----
> 
> Which really leaves me scratching my head, since gr24 and gr23
> shouldn't be used for relocation in this case? I guess varargs
> are another cute case :}

Again, reverse the order of the float regs and it makes more sense.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
