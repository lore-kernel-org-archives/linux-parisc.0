Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA23865
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Jul 2000 10:28:45 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 13 Jul 2000 16:30:17 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13Clqy-0004IK-00
	for <parisc-linux@thepuffingroup.com>; Thu, 13 Jul 2000 12:28:48 -0400
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Problem with malloc(3)/sbrk(2)/brk(2)/something
References: <8766qb86nw.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 13 Jul 2000 12:28:48 -0400
In-Reply-To: David Huggins-Daines's message of "12 Jul 2000 15:55:47 -0400"
Message-ID: <877laq2dvj.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> userland.  Basically I've found a minimal testcase for the problem,
> which is that it's not possible to malloc() across a page boundary.

Oops, sorry, this did not seem to be the actual problem.  It seems
that I may have been running a kernel that was not %r8-clean, or
something similar, because recompiling malloc.c with -ffixed-r8 made
these test cases work :(

However config.guess still doesn't work :( Once I get a working kernel
again I suppose I'll look at that.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
