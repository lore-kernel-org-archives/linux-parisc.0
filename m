Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4D0D486C
	for <parisc-linux@parisc-linux.org>; Tue, 26 Feb 2002 18:05:37 -0700 (MST)
To: Tilo Jandt <tilo@jandt-online.net>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Sound 
In-Reply-To: Message from Tilo Jandt <tilo@jandt-online.net>
   of "Wed, 27 Feb 2002 01:55:56 +0100." <E16fsNw-0005tU-00@mrvdom00.kundenserver.de>
References: <E16fsNw-0005tU-00@mrvdom00.kundenserver.de> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 26 Feb 2002 18:05:34 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020227010534.26B3337CF5@carmen.fc.hp.com>
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

Tilo Jandt writes...

> Yes I use this Kernel.

Good.

> > I've used xmms and mpg321 and they work great.
> But if I start XMMS and wanna play an MP3 I get an Error Message:
> Please check that:
> 1. You have the correct output plugin selected (use eSoundOutput Plugin or OS
> S Driver both don't work)
> 2. No other programs is blocking the soundcard ( I don't know if others use t
> he soundcard but I don't know)
> 3. Your soundcard is configured properly (I don't know can I get Information 
> whether the soundcard is configured right or not?)

This is more of a general audio question at this point. You might want to test 
that the card is working by cat'ing a .au file to /dev/audio. Also, try the 
oss and esound plugins.

Good luck,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
