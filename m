Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id D513A4843
	for <parisc-linux@parisc-linux.org>; Sun, 14 Jul 2002 17:38:25 -0600 (MDT)
To: eddantes@wanadoo.fr
Cc: Frank Alden Smith <falden@comcast.net>,
	parisc-linux@parisc-linux.org, taggart@carmen.fc.hp.com
Subject: Re: [parisc-linux] locales held back 
In-Reply-To: Your message of "Sun, 14 Jul 2002 00:26:46 +0200."
             <3D30A926.8020509@wanadoo.fr>
References: <NGBBJKHCMLEJELIEEHNOCEDPCAAA.falden@comcast.net>  <3D30A926.8020509@wanadoo.fr> 
Date: Sun, 14 Jul 2002 17:38:21 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020714233821.9FBE037E97@carmen.fc.hp.com>
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

eddantes@wanadoo.fr writes...

> Frank Alden Smith wrote:

> > Sorry, but the following packages have unmet dependencies:
> >   locales: Depends: glibc-2.2.5-8 but it is not installable
> > E: Sorry, broken packages
> > 
> > Any, idea how I can resolve the problem, or must I just be patient until
> > the broken glibc-2.2.5-8 is fixed?
> > 
> > Take care,
> > frank
> 
> 
> That's a pretty common situation in Debian Sid (unstable), especially 
> between locales and glibc. I've seen it happen qui a lot of times, but 
> it's just harmless.

BTW- IIRC this is due the the fact that libc6 and locales have lock-step
dependencies. So when a new glibc package comes out the binary-all
locales package is immediatatly available for all architectures but the
arch-specific packages like libc aren't until they've been built for
each architecture. So as eddantes pointed out, just wait a few days and
they'll be sync'd back up.

Or you could run testing which doesn't have this problem(by definition).

-- 
Matt Taggart
taggart@fc.hp.com
