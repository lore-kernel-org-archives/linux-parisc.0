Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8AD0482A
	for <parisc-linux@parisc-linux.org>; Tue,  2 Apr 2002 06:46:32 -0700 (MST)
Date: Tue, 2 Apr 2002 08:47:31 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org, will@misconception.org.uk
Subject: Re: [parisc-linux] Re: Fwd: Re: Any hppa gurus?
Message-ID: <20020402084731.C26273@systemhalted>
References: <20020330151130.B16616@systemhalted> <200203302132.g2ULWNcp028559@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200203302132.g2ULWNcp028559@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Sat, Mar 30, 2002 at 04:32:23PM -0500
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

> 
> I some situations, the callee needs to save the argument registers on
> the stack.  There are 4 words reserved for this.
> 

Okay. I'll see if I can find those in the documentation.

> > 	int	gr26	fr7	-----		===	float
> > 	int	gr25	fr6	float		===	-----
> > 	---	gr24	fr5	-----		---	-----
> > 	---	gr23	fr4	-----		---	-----
> 
> You've got the order of the float registers reversed.  They are allocated
> in order of increasing number starting with fr4.
> 

Ah! Excellent. After looking at some more assembly output and reading...
I should have realized that it was the other way around :) Thanks.

Now some of my register allocation guessing is coming out correct :}

Serves me right for using complex examples all the time.

c.
