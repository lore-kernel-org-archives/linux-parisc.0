Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tentakel.fischlustig.de (pD900140D.dip.t-dialin.net [217.0.20.13])
	by dsl2.external.hp.com (Postfix) with SMTP id E2D95482A
	for <parisc-linux@parisc-linux.org>; Tue,  8 May 2001 16:53:42 -0600 (MDT)
Sender: andi@dsl2.external.hp.com
Message-ID: <3AF878EA.3F043FD7@fischlustig.de>
Date: Wed, 09 May 2001 00:53:31 +0200
From: Andi <andi@fischlustig.de>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] framebuffer drivers, sound
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I tried out the latest kernel and debian packages on my 712/60, and its
running
now for three days without crash, you really made amazing progress
the last few month!

The stifb driver is working for me, but the colors are completely wrong
and the
system crashes if i try to cat /dev/fb0.

I wonder if HP will release specs, we could write framebuffer drivers
that talk
directly to the gfx card, allow mode switching and (is it possible?) set
a linear
mode instead of a planed mode.

The harmony driver does not work for me, if I try to play sound, I get
silence
and then after a few seconds a stange noise, then silence, then strange
noise
and so on.

anyway, keep up the good work!


Andreas
