Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 654DF4A18
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 15:21:20 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA11289
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Feb 2001 15:17:09 -0700
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Matthew Wilcox <matthew@wil.cx>,
	Ryan Bradetich <rbradetich@uswest.net>
Subject: Re: [parisc-linux] System bus walk patch
Date: Fri, 2 Feb 2001 23:22:16 +0100
Cc: parisc-linux@thepuffingroup.com
References: <3A7B1313.C6B5AFFE@uswest.net> <20010202202918.A26452@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20010202202918.A26452@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <01020223221603.05589@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

> > +#ifdef __LP64__
> > +#define FPA 0xFFFFFFFFFFF80000 /* Fixed Physical Address - Location of
> > the Central Bus */ +#else /* !__LP64__ */
> > +#define FPA 0xFFF80000         /* Fixed Physical Address - Location of
> > the Central Bus */ +#endif /* __LP64__ */
>
> I'm sure there's a way to do this without #ifdef's... something like
>
> #define FPA (unsigned long)-80000
>
> but perhaps that feels obfuscated -- after all we're after an address here.
>
> #define FPA ((unsigned long)(signed int)0xfff80000)

or just as I did it in led.c
#define KITTYHAWK_LCD_CMD  (0xfffffffff0190000UL) /* 64bit-ready */ 
which is automatically casted by the compiler ?

Helge
