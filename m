Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta05ps.bigpond.com (mta05ps.bigpond.com [144.135.25.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC99B482C
	for <parisc-linux@parisc-linux.org>; Wed, 27 Mar 2002 00:06:35 -0700 (MST)
Date: Wed, 27 Mar 2002 18:06:26 +1100
From: Peter Lavender <plaven@bigpond.net.au>
To: Matthew Wilcox <willy@debian.org>
Cc: Peter Lavender <plaven@bigpond.net.au>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] performance?
Message-ID: <20020327180626.C28130@piglet>
Reply-To: plaven@bigpond.net.au
References: <20020326224358.B28171@piglet> <20020326154444.D26865@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020326154444.D26865@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Tue, Mar 26, 2002 at 03:44:44PM +0000
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

* Matthew Wilcox (willy@debian.org) wrote:


> > It wasn't until I compiled it on my p90 with 48 meg ram running a a
> > zillion services and daemons that I noticed just how slow the 715 is.
> > Running the program proved this even further.
> 
> Would you mind posting some numbers?
> 
> Also, let's try to figure out what other variables are a factor.  Can you
> compare gcc-3.0 on your x86 to the current compiler?

The p90 system is an old stock install of redhat 6.0 with very little
done to the kernel.. it was recompiled with certain drivers built into
the kernel but that's about it.

[pete@piglet brad]$ g++ --version
egcs-2.91.66

The program is fairly simple in what it does.  

I really don't want to install gcc-3.0 on this system as it really is
a stable workhorse and I'd rather not break.

But even running time is somewhat of a difference... lets see:

This is a very simple shell script that outputs date at start and
finish of the program running.. I'm no guru really.. :)

Run on HPPA 715/64

Wed Mar 27 18:02:20 EST 2002
Wed Mar 27 18:02:50 EST 2002

Run on P90

Wed Mar 27 18:00:32 EST 2002
Wed Mar 27 18:00:39 EST 2002


Just quickly you can see that it took 7 secs to do the same thing on
the p90 and 30 seconds on the hppa box.

The p90 runs alot of daemons, substantially more than the hppa box..
but this is a surprise.. I have some thoughts about the compiling, but
none what so ever about the general difference between the arches... 

I just thought it was of interest as I thought the hppa box was of
similar processing capability to the p90.


Regards,

Pete.

-- 
				Due to a lack of imagination, 
				this signature will remain 
				under construction indefinately.
