Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA30300
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Mar 2000 11:00:45 -0700
Date: Thu, 2 Mar 2000 10:01:38 -0700 (MST)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <200003021701.KAA19276@fast.cs.utah.edu>
To: andrew@neep.com.au, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Value of an old K-class server?
List-ID: <linux-parisc.vger.kernel.org>

> Date: Thu, 2 Mar 2000 21:02:12 +0800
> From: Andrew Shugg <andrew@neep.com.au>
> To: parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] Value of an old K-class server?
> 
> Okay.  =)  Is it clear at this point what is definitely going to be supported
> (even if it doesn't work now), and what will _never_ be supported?  (ie,
> basically, what has 1.0 and what has 1.1?)
> 

Your 715 and 735 should be fairly easy to support, even if they aren't one
of the current active development platforms.  They are 1.1 machines with
fairly "stock" off-the-shelf IO components very similar or identical to
some of the machines that are being worked on.

The "hard" machines will be 1.0 based machines (due to lack of architectural
features such as shadow registers and block TLBs that are probably assumed to
exist by the Linux code) and those with the different IO architectures
(CIO and NIO-based).  Note that the latter can be 1.1 (or 2.0?) based
machines, so you cannot just say that 1.1 machines will work.

Note that I speak not as an active developer of Linux, but as someone who
worked on Mach/BSD on these machines.  So believe the Puffin people more
than me!  They have a lot more resources available then we did, so things
might not be as hard for them.
