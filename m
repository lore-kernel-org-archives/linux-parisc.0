Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta04ps.bigpond.com (mta04ps.bigpond.com [144.135.25.136])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F22E482A
	for <parisc-linux@parisc-linux.org>; Wed, 27 Mar 2002 23:11:26 -0700 (MST)
Date: Thu, 28 Mar 2002 17:10:56 +1100
From: Peter Lavender <plaven@bigpond.net.au>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	Peter Lavender <plaven@bigpond.net.au>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] performance?
Message-ID: <20020328171056.H28130@piglet>
Reply-To: plaven@bigpond.net.au
References: <20020326224358.B28171@piglet> <20020326154444.D26865@parcelfarce.linux.theplanet.co.uk> <20020327180626.C28130@piglet> <20020328000640.B12094@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020328000640.B12094@systemhalted>; from carlos@baldric.uwo.ca on Thu, Mar 28, 2002 at 12:06:40AM -0500
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

* Carlos O'Donell Jr. (carlos@baldric.uwo.ca) wrote:


> > The p90 system is an old stock install of redhat 6.0 with very little
> > done to the kernel.. it was recompiled with certain drivers built into
> > the kernel but that's about it.
> > 
> > [pete@piglet brad]$ g++ --version
> > egcs-2.91.66
> > 
> > The program is fairly simple in what it does.  
> >
> 
> This is the crux of the problem. IA32 glibc and kernel are sprinkled
> with copious amounts of hand tuned and optimized assembly. We are
> nowhere near that level yet :)
 
I thought that the i386 may hvae some performance tweaks in it, since
this is by far the most used platform for development.


> What is it that your program does?

Nothing special, it's just an exercise in programming.  It searches
for perfect numbers and then prints out the prime number in the list
of factors.

It's not very big, so if you want to take a look, I'll email it to
you..  :)


Regards,

Pete.

-- 
				Due to a lack of imagination, 
				this signature will remain 
				under construction indefinately.
