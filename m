Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 22252482A
	for <parisc-linux@parisc-linux.org>; Wed,  9 May 2001 14:19:18 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Andi <andi@fischlustig.de>
Subject: Re: [parisc-linux] framebuffer drivers, sound
Date: Wed, 9 May 2001 22:18:33 +0200
Cc: parisc-linux@parisc-linux.org
References: <3AF878EA.3F043FD7@fischlustig.de> <20010509004136.R4917@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20010509004136.R4917@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <20010509201918.22252482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I had hacked up a stifb driver for my 715/64 (Artist GFX card) a few weeks 
ago, which will give you at least correct colors. If you want to test it you 
may download the current (unfinished and ugly!) version from
ftp://people.redhat.com/hdeller/parisc_stifb ,
put both files in /drivers/video/sti and recompile.
This version is based on the XFree86-sources and doesn't fix the cat/dev/fb0 
problem yet.

Greetings,
Helge

On Wednesday 09 May 2001 01:41, Matthew Wilcox wrote:
> On Wed, May 09, 2001 at 12:53:31AM +0200, Andi wrote:
> > The stifb driver is working for me, but the colors are completely wrong
> > and the
> > system crashes if i try to cat /dev/fb0.
>
> Yup, the stifb is buggy.  Please, if you have time, it would be great
> if you could help clean it up and get it working.  sticon works rather
> better but it is still not great.  The STI docs are publically available
>
> >from the documentation page.
