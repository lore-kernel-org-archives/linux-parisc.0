Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E778482A
	for <parisc-linux@parisc-linux.org>; Sun,  3 Jun 2001 13:08:35 -0600 (MDT)
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m156dEH-001VltC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@parisc-linux.org>; Sun, 3 Jun 2001 13:08:01 -0600 (MDT)
Message-Id: <m156dEH-001VltC@bame.riverrock.org>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: diab <diab@diab.rulez.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] wierd shell behaviour 
In-reply-to: Your message of "Sun, 03 Jun 2001 20:52:32 +0200."
             <Pine.LNX.4.21.0106032046490.13376-100000@droid3.webreklam.hu>
Date: Sun, 03 Jun 2001 13:08:01 -0600
Sender: bame@riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

> 
> I got the latest 0.9 cd image installed and apt-get upgrade'd everything
> 
> I was trying to compile BitchX, configure runs ok and on make it
> stops:
> 
> # make
> cd source \
>   &&  'local_dir=/root' 'INSTALL_IRC=/usr/local/bin/BitchX' [...]
> 'SHLIB_SUFFIX=.so' all
> /bin/sh: local_dir=/root: No such file or directory

Looks like something is missing after the && -- like 'make'?  Check
your x86 box I guess.

This may be unrelated, but many packages have an older version of
config.guess/config.sub which does not understand parisc.
