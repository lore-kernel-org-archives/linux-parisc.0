Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82851482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 May 2001 10:19:02 -0600 (MDT)
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m154mCS-001VltC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 May 2001 10:18:28 -0600 (MDT)
Message-Id: <m154mCS-001VltC@bame.riverrock.org>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Palo: how-to reinstall 
In-reply-to: Your message of "Tue, 29 May 2001 11:27:36 +0200."
             <A4A5E4C468B5D11190220001FA6835DD04DD8943@EPIXCH003>
Date: Tue, 29 May 2001 10:18:28 -0600
Sender: bame@riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

There are a couple of possible problems.

If your disk is bigger than 2Gb you will need at least palo-0.89 to
initialize it on a 32-bit box.  palo-0.90 is currently in the debian
archive and is a good choice.

The palo -U (or --update-partitioned) is not well tested and may not work
at all.

The best way to use and re-install palo is to put the right commands
in /etc/palo.conf (be sure to read how to do this properly).  Then you
can simply re-run 'palo' at any time safely.  You can also re-run
the command you used to install palo the first time.

> That is why at the beginning the only solution I found was to reformat the
> disk (fdisk) and reinstall from scratch.
> And I forgot that I have to report this problem and just keep in mind
> (abusively) that to reinstall command line (or other parameter) I have to
> reformat all my disk.

I hope you'll have better luck with palo-0.90!
