Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44FB7485A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Oct 2001 06:37:43 -0600 (MDT)
Date: Tue, 2 Oct 2001 14:37:02 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] woody install on 720/50
In-Reply-To: <20011001175425.A31305@dogbert.localdomain>
Message-ID: <Pine.NEB.4.33.0110021434430.24166-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Albert,

> Next I tried a network install using my i386 box (with co-ax network
> card to connect to the 720) as a web server. According to the
> access.log, the drivers.tgz and rescue.bin very retrieved without
> problems. When it tried to extract the rescue.bin, it croaked with a
> message saying "Bad address." When I tried to retrieve the images a
> second time, the installer croaked.

I don't know about this installer problem as i did the install manually
before. After applying the patch, the programs ls, tar, etc started
working OK and i just successfully performed the apt-get update/upgrade
:-)

Cheers,
Jochen
