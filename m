Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tentakel.fischlustig.de (pD900114C.dip.t-dialin.net [217.0.17.76])
	by dsl2.external.hp.com (Postfix) with SMTP id 45908482A
	for <parisc-linux@parisc-linux.org>; Wed,  9 May 2001 15:43:35 -0600 (MDT)
Sender: andi@dsl2.external.hp.com
Message-ID: <3AF9B9F5.AC56BF11@fischlustig.de>
Date: Wed, 09 May 2001 23:43:17 +0200
From: Andi <andi@fischlustig.de>
MIME-Version: 1.0
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] framebuffer drivers, sound
References: <3AF878EA.3F043FD7@fischlustig.de> <20010509004136.R4917@parcelfarce.linux.theplanet.co.uk> <20010509201918.22252482A@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Helge Deller wrote:

> Hi,
>
> I had hacked up a stifb driver for my 715/64 (Artist GFX card) a few weeks
> ago, which will give you at least correct colors. If you want to test it you
> may download the current (unfinished and ugly!) version from
> ftp://people.redhat.com/hdeller/parisc_stifb ,

it works for me. colors are nice again. Why isnt your patch merged in?

I added
disp->scrollmode = SCROLL_YREDRAW;
at the end of sti_set_disp() in stifb.c

this makes scrolling A LOT faster.


Andreas
