Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A935482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Apr 2001 05:54:12 -0600 (MDT)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id VAA28982;
	Sat, 7 Apr 2001 21:54:00 +1000
Date: Sat, 7 Apr 2001 21:54:00 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Rod Smart <snaketails@optushome.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Palo question.
In-Reply-To: <3ACEFDCD.A3F62CAA@optushome.com.au>
Message-ID: <Pine.LNX.4.21.0104072146370.8692-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 7 Apr 2001, Rod Smart wrote:

>     Where can I get a copy from, the link I received from the guys in
> France was for the Debian archive.
> 
>     Is there a version just in a tarball as I don't have Debian on my
> own x86 system

debian packages are really neat in that all you need is `ar'

"ar xv <package>"

will get you a couple of tar.gz files, and it's fairly easy from there.

Alan
