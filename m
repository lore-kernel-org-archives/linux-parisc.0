Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 60C4B482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Jan 2002 03:08:27 -0700 (MST)
Date: Fri, 25 Jan 2002 09:57:55 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Vlad Markov <markov@monmouth.com>, debian-hppa@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20020125095755.GH32617@sleepie.demon.co.uk>
References: <200201240200.VAA00858@monmouth.com> <20020125065501.A6537482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020125065501.A6537482A@dsl2.external.hp.com>
Subject: [parisc-linux] Re: tag starvation
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

On Thu, Jan 24, 2002 at 11:55:01PM -0700, Grant Grundler wrote:
> 
> Follow up to parisc-linux@lists.parisc-linux.org only please.
> (ie this isn't a debian linux issue)
> 
> Vlad Markov wrote:
> > I get the following message when I boot up on a 735/99:
> > Jan 22 19:12:41 grumpy kernel: scsi0 (1:0) Target is suffering from tag
> >	starvation.
> 
> Seems only 53c700.c prints this msg. Is this the right driver?

Should be; 735 has unsupported 53c720 FWD, and 53c700 or 710 driven by
53c700.c.  I assume Vlad has external narrow SE disks attached.

> Normally you shouldn't see this *if* the device supports tagged commands.

I used to get this a lot, until James changed the driver to only report
the first occurance of it.  Don't remember the exact details, but iirc
it is for info only, and non-fatal.  From the code it looks like it
means some cmnd has been sitting in the drive unprocessed for too long,
and the code rejects new cmds until those older ones have been processed
or timed out.

> I can never remember the SCSI driver options (the parisc-linux FAQ has 
> the URL to them) but one of them will either disable or limit 
> "queue depth" for Queue Tags and that should take care of it.

Hmm, I thought that would be a feature of a specific driver, not the
upper layers.  53c700.c doesn't (yet) have any boot options to disable
tags.

Richard
