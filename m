Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA08123
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Dec 2000 00:42:37 -0700
To: jcarlson@macalester.edu
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linux on HP 
In-Reply-To: Message from jcarlson@macalester.edu
   of "Mon, 11 Dec 2000 15:45:47 CDT." <Pine.PMDF.3.96.1001211153646.22674A-100000@macalester.edu>
References: <Pine.PMDF.3.96.1001211153646.22674A-100000@macalester.edu> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Dec 2000 00:47:02 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001212074702.A5CC637CA1@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


jcarlson@macalester.edu writes...

> Recently I've been assigned the task of setting up a few old HP machines
> for paralell processing tasks.  In doing so, I have come upon your project
> in porting linux to HP machines.
> I was curious as to the status of a few of the projects

We're making good progress but the port is still in an alpha stage. 
Performance is pretty poor but improving. Depending on what your "parallel 
processing tasks" are you may want to wait to start playing. If you have some 
time and don't mind hacking (it's fun!) then you might consider giving it a 
try.

> as well as the
> availability of possible binary distributions.

Both Debian and RedHat are working on unofficial/experimental distributions. 
Both have hundreds of packages built for hppa.

> I'm curious about the status of Merlin 160, Raven 120 T' and Gecko.

Most of the core developers have both a B160/B180/A180 and some sort of 712 so 
they mostly work. I don't know the current status of the C110 but I think it 
works. You might consider looking at and adding your machines to the Hardware 
Database at,

http://parisc-linux.org/hw.html

-- 
Matt Taggart
taggart@fc.hp.com
