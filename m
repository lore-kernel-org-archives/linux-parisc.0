Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 0BD3D4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Oct 2002 13:58:02 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Thibaut VARENE <varenet@esiee.fr>,
	Tilo Riemer <t.riemer@visoel.de>
Subject: Re: [parisc-linux] ksoftirqd eats 100% cpu :-(
Date: Mon, 7 Oct 2002 21:52:04 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <3DA1A6F3.8030707@visoel.de> <3DA1A641.1090306@esiee.fr>
In-Reply-To: <3DA1A641.1090306@esiee.fr>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200210072152.04775.deller@gmx.de>
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

On Monday 07 October 2002 17:20, Thibaut VARENE wrote:
> Tilo Riemer wrote:
> > Hello list,
> >
> > I use Debian 3.0 on an HP9000/710. Almost all works fine, but the
> > ksoftirqd eats all cpu time. I read that it's a bug in the kernel. Is
> > there a patch for fixing this problem?
>
> It's a well known bug. on 7x0 and 7x5 boxes.

It's a bug/feature related to the HIL drivers. 
Since we have to poll the HIL ports the whole time
the bunch of running timers increase the ksoftirqd load a lot.

> Maybe we should add a faq entry ?

This would be great.

Helge
