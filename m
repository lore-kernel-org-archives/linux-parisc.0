Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id D812F4A19
	for <parisc-linux@parisc-linux.org>; Thu, 22 Mar 2001 02:56:15 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 4BC05B008; Thu, 22 Mar 2001 09:57:10 +0000 (GMT)
Date: Thu, 22 Mar 2001 09:57:10 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: Robert Liesenfeld <xunil96@yahoo.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Init not found on 735/125?
Message-ID: <20010322095710.C18942@linuxcare.com>
References: <20010322011955.17416.qmail@web5503.mail.yahoo.com> <20010322030651.33A5B38145@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010322030651.33A5B38145@carmen.fc.hp.com>; from taggart@carmen.fc.hp.com on Wed, Mar 21, 2001 at 08:06:51PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 21, 2001 at 08:06:51PM -0700, Matt Taggart wrote:
> 
> Robert Liesenfeld writes...
> 
> > I'm much closer to being able to install palinux on my 735/125...at the momen
> > t, the main problem
> > I'm having is this:
> [snip]
> 
> You could try using sash as init and see if you get further. I think this is 
> the same problem as Richard mentioned in,
> 
> http://lists.parisc-linux.org/pipermail/parisc-linux/2001-March/012025.html
> 
> It's solved by a new glibc that's 16 byte aligned. See the message I just sent 
> out about where to get the new glibc debs from.

No, different problem I think.  My system found init, but init then hung.
Robert is seeing:

> Kernel panic: No init found.  Try passing init= option to kernel.

Maybe his 735/125 is mounting the wrong dir, maybe his sbin/init doesn't
have execute access.  I'd check I could nfs mount that dir from some
other machine, and see sbin/init ok.  Using init=/bin/sash is a good
idea anyway, except I don't think sash is on the .iso, so you need
to build it or ask nicely ;)

Richard
