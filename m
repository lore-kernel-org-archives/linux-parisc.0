Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 5C30B482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 Aug 2001 16:56:28 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Chuck Slivkoff <charles_slivkoff@hp.com>
Subject: Re: [parisc-linux] XFree86 - white pixel is blue
Date: Sun, 26 Aug 2001 00:56:04 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <200108210625.AAA20810@puffin.external.hp.com>
In-Reply-To: <200108210625.AAA20810@puffin.external.hp.com>
MIME-Version: 1.0
Message-Id: <20010825225628.5C30B482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Tuesday 21 August 2001 08:25, Grant Grundler wrote:
> Chuck Slivkoff wrote:
> > I just loaded the ISO on a 712/60 and setup XFree86 to use the fbdev
> > driver. It seems to be OK, with the exception that "white" is "blue".
>
> This sounds like a a bug.
> The ESIEE guys will be around tomorrow and I can ask them about it.

Hi,

I can confirm this behaviour now on my 715/64 too.

The only thing I recently changed on this machines was an upgrade to 
XFree 4.1.0-2 and nothing else. Furthermore, since this happens both
with an old kernel (2.4.0-32) and the recent kernel (2.4.9-pa5) I'm
assuming that it looks like a bug in the XFree86-fbdev driver.

Maybe someone on this list knows more, else I'll take a closer look at 
it tomorrow,

Helge
