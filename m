Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id A5D39482A
	for <parisc-linux@parisc-linux.org>; Wed,  9 May 2001 16:08:14 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Andi <andi@fischlustig.de>
Subject: Re: [parisc-linux] framebuffer drivers, sound
Date: Thu, 10 May 2001 00:07:36 +0200
Cc: parisc-linux@parisc-linux.org
References: <3AF878EA.3F043FD7@fischlustig.de> <20010509201918.22252482A@dsl2.external.hp.com> <3AF9B9F5.AC56BF11@fischlustig.de>
In-Reply-To: <3AF9B9F5.AC56BF11@fischlustig.de>
MIME-Version: 1.0
Message-Id: <20010509220814.A5D39482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Wednesday 09 May 2001 23:43, Andi wrote:
> Helge Deller wrote:
> > Hi,
> >
> > I had hacked up a stifb driver for my 715/64 (Artist GFX card) a few
> > weeks ago, which will give you at least correct colors. If you want to
> > test it you may download the current (unfinished and ugly!) version from
> > ftp://people.redhat.com/hdeller/parisc_stifb ,
>
> it works for me. colors are nice again. Why isnt your patch merged in?
>
> I added
> disp->scrollmode = SCROLL_YREDRAW;
> at the end of sti_set_disp() in stifb.c
>
> this makes scrolling A LOT faster.
>
> Andreas

Hi Andreas,

the reasons why I haven't checked it in yet are:
1. currently it's an ugly hack,
2. it's still a hack,
3. it only supports artist gfx's (some 712/xxx and 715/xxx machines) atm,
4. I would like to test it more and clean up the sources before I commit it.

Thanks for the SCROLL_YREDRAW patch. I will upload the updated version to the 
above ftp-site as soon as I have tested it.

Greetings,
Helge
