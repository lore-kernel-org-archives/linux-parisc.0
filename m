Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4BCF482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Jan 2002 10:31:12 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] DSL on a 715/80 with rp-pppoe
References: <20020101233834.GA2872@sleepie.demon.co.uk>
	<Pine.LNX.4.43.0201021748410.2611-100000@szr.petescaff.com>
From: Bdale Garbee <bdale@gag.com>
Date: 02 Jan 2002 10:29:08 -0700
In-Reply-To: <Pine.LNX.4.43.0201021748410.2611-100000@szr.petescaff.com>
Message-ID: <878zbg64rf.fsf@rover.gag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

peter@petescaff.com (Peter Mottram) writes:

> The 2.4.9 Debian kernal package had hotplug disabled but the 2.4.16
> package has it enabled. After a quick apt-get install of hotplug I have a
> happy system again. I have filed a bug report to Debian on the kernel
> package requesting a dependency on hotplug. This is obviously not the real
> fix that is needed, but it would at least prevent this kind of problem for
> anyone else.

Nah, that's the wrong answer.  The kernel shouldn't crater if hotplug isn't
present.

Slapping another dependency on the kernel image packages would mask the 
problem instead of fixing it, so I'm uninclined to implement this request.
Better someone track down and fix what's actually blowing up in the kernel,
I think.

Bdale
