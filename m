Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A03E4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Mar 2001 08:20:17 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA08547
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Mar 2001 08:15:24 -0700
Date: Thu, 1 Mar 2001 09:17:53 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Chris Moore <cmoore@cancun.rose.hp.com>,
	parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Another 735 hums to life
In-Reply-To: <20010301095435.G2686@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0103010907390.7180-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Chris, et al.,

On Thu, 1 Mar 2001, Richard Hirst wrote:

> On Wed, Feb 28, 2001 at 02:34:59PM -0800, Chris Moore wrote:
> > After a lot of struggling I finally got my 735/99 up and running.
> > After even more struggling I got it to boot standalone off its
> > own internal SCSI disk and make it all the way to runlevel 2.
> > 
> > I am still having a few problems though.  I tried using dpkg
> > to install something and the process just seemed to hang.  I
> > saw the same thing when trying to compile something - don't
> > remember what.
> 
> Does tar hang also?  If so it's probably the pthreads problem
> that is affecting older machines (my 715/75, for example).  In
> theory a new glibc should fix this, but when I tried things seemed
> to get even worse - wouldn't even boot any more.  Havn't tried
> for a couple of weeks though.

I'm currently running the bins posted by our French amis and tar works.  
The more program still has the goofy stack (argv[-1]?) bomb and ncsd still
doesn't work.  I'm not familiar with nscd but it prevents me from using
adduser so I had to do all that the _real_ old fashioned way.  I used the
55 meg root filesystem and it had a root password set.  I had to boot the
old NFS-root fs so I could edit /etc/passwd on the new fs.  On the whole
it's a big improvement.  I can use the compiler now.  Next I'm going to
see if the C100 can compile its own kernel.

The ESIEE download site is:

	http://mkhppa1.esiee.fr/en/download.html

Regards,

- Greg
