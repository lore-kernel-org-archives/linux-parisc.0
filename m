Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from leo.uni-sw.gwdg.de (leo.uni-sw.gwdg.de [134.76.205.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8D7F5482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Jun 2001 13:44:20 -0600 (MDT)
Date: Tue, 12 Jun 2001 21:44:11 +0200 (CEST)
From: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Kernel faults on boot
In-Reply-To: <20010611131636.H16532@linuxcare.com>
Message-ID: <Pine.LNX.4.33.0106122140380.9668-100000@leo.uni-sw.gwdg.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 11 Jun 2001, Richard Hirst wrote:

> > In the meantime I noticed that about every 6th time it boots up
> > without crashing, but the keyboard setting from the installation
> > (German) was obviously not saved.
>
> Correct, keyboard config is broken in the release sti image.  If you
> manage to boot you could try
>
> mv /bin/loadkeys /bin/loadkeys.old
> mv /bin/dumpkeys /bin/dumpkeys.old
> mv /etc/console-tools /etc/console-tools.old
> apt-get install console-data console-common console-tools console-tools-libs
>
>
> If that works, let me know and I'll add it to the errata.

Not really. It asked me if I wanted to select the keyboard-map from
a list, which was never displayed. It also complained that a package
'kdb' was missing, and I could not find it on the CD, before the
machine was crashing again. For the moment I give up, as I do not
have much time. But if you need specific tests, I would be happy to
assist...

Greetings,
	Peter.
