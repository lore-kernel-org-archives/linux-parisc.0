Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B658482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 May 2001 13:08:22 -0600 (MDT)
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m154oqW-001VltC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 May 2001 13:08:00 -0600 (MDT)
Message-Id: <m154oqW-001VltC@bame.riverrock.org>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Palo: how-to reinstall 
In-reply-to: Your message of "Tue, 29 May 2001 11:27:36 +0200."
             <A4A5E4C468B5D11190220001FA6835DD04DD8943@EPIXCH003>
Date: Tue, 29 May 2001 13:08:00 -0600
Sender: bame@riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

Even with the bad palo you can boot.

Ask your boot rom to boot interactively.  On recent boxes it's
something like this:
	boot
	y

On 712:
	boot pri ipl

Once palo is interactive, edit #0 to be:

	0/vmlinux

this boots from the recovery kernel stored in the F0 partition.

	-P
