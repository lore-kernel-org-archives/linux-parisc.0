Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD5C74894
	for <parisc-linux@parisc-linux.org>; Fri, 19 Sep 2003 09:32:27 -0600 (MDT)
Message-ID: <3F6B2199.8050402@tiscali.be>
Date: Fri, 19 Sep 2003 15:32:41 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] sched_clock implementation
References: <20030918203510.GD21596@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030918203510.GD21596@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Matthew Wilcox wrote:

>Anyone want to do better than the lame implementation?  ;-)
>
>----- Forwarded message from Andrew Morton <akpm@osdl.org> -----
>
>I'll be merging Ingo & Con's CPOU scheduler changes into Linus's tree soon.
>
>It does require that the architecture provides a new timing function:
>
>A lame implementation is:
>
>/*
> * Returns nanoseconds
> */
>  
>
Hi Willy,

(Certainly yet another stupid question but) to reach such accuracy we 
would need to have access to some 'time device' with an accuracy better 
then the nanosec (iirc 10^-9) (because it doesn't seems to me possible 
to get enough accuracy with cpu clock < 10^9 ie 1Ghz: the most case for 
parisc systems). Does it exist such device and where to start to read 
some doc?

Tanks,
    Joel

>unsigned long long sched_clock(void)
>{
>	return (unsigned long long)jiffies * (1000000000 / HZ);
>}
>
>But for best CPU scheduler results the architecture should try to return a
>higher-resolution number than this of course.
>
>sched_clock() has no absolute time requirements: it just has to return some
>number which goes up by 1,000,000,000 times per second.
>
>I already have implementations for x86, ppc, sparc64 and ia64.
>
>I have a completely stupid ppc64 implementation which is only accurate on
>1GHz CPUs.  Anton please note!
>
>As for the rest, it'll break the build, sorry.
>
>----- End forwarded message -----
>
>  
>
