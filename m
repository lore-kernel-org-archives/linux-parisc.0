Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77D194848
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 05:46:55 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19nGZB-0000PC-Ci; Thu, 14 Aug 2003 12:46:53 +0100
Date: Thu, 14 Aug 2003 12:46:53 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] itlb miss handler optimizations!
Message-ID: <20030814114653.GJ10015@parcelfarce.linux.theplanet.co.uk>
References: <20030813160532.GG17512@systemhalted> <3F2A5B0400002E28@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F2A5B0400002E28@ocpmta1.freegates.net>
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

On Thu, Aug 14, 2003 at 08:02:04AM +0200, Joel Soete wrote:
> btw is it for that reason (interlock) that in your patch we can read:
> [...]
>         cmpb,=        %r0,t0,itlb_miss_...
>         nop
> [...]
> I am alway asking why the 'nop'.

To fill the delayed branch slot (a silly idea, but ...)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
