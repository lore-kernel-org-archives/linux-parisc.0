Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77B58482A
	for <parisc-linux@parisc-linux.org>; Tue, 29 May 2001 14:13:47 -0600 (MDT)
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] List of packages for hppa ISO release 
In-Reply-To: Message from Grant Grundler <grundler@puffin.external.hp.com>
   of "Sat, 26 May 2001 10:45:55 MDT." <200105261645.KAA19506@puffin.external.hp.com>
References: <200105261645.KAA19506@puffin.external.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 29 May 2001 14:16:28 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010529201628.279E037CFD@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler writes...

> Matt Taggart wrote:
> > http://puffin.external.hp.com/~taggart/selections.20010525
> > There are still a few missing dependencies but those should be taken care o
> > in the next few days. If you have additions/deletions to the list please se
> > them to me.
> 
> o ditch ipchains and add iptables instead.

Good idea but netbase depends on ipchains. I'll add iptables.

> o add cvs

We decided that cvs's debconf questions would be confusing to someone who 
didn't intend to setup a cvs repository right away. Not adding it, people can 
just get it from the archive.

> o add an irc client? (tirc? tinyirc? ircii?)

Good idea. Which one?

> o any memory or selftest tools we can include?
>   (even untested - I'm looking at x86 package that has mem/cpu test)

Good idea, but all the memory testers I've seen have been x86 specific. If 
people have specific ones they know will work for hppa then let me know.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
