Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 5B02C4A19
	for <parisc-linux@parisc-linux.org>; Fri,  9 Feb 2001 04:04:59 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] problems compiling STI support
Date: Fri, 9 Feb 2001 12:07:17 +0100
References: <Pine.LNX.4.21.0102090236360.25675-100000@sgate.charlysworld.de>
In-Reply-To: <Pine.LNX.4.21.0102090236360.25675-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Message-Id: <01020909132400.30834@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

On Friday 09 February 2001 02:39, M. Grabert wrote:
> If I enable STI console support and/of STI fbcon support,
> I got the following error:
>
> error: can't find sti.h
> well, I don't have any sti.h in the kernel source (current CVS).

Hi Max,

I fixed that 20 minutes before you wrote this mail.
But please don't try to compile STI framebuffer - it won't work yet.

Greetings,

	Helge.
