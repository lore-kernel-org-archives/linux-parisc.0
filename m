Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 6F9A44846
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Jul 2002 13:43:13 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: DJ Tha Muggs <djmuggs@primare.xs4all.nl>
Subject: Re: [parisc-linux] Systems Console hangs!
Date: Sun, 21 Jul 2002 21:40:49 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <20020721183508.C16644@primare.xs4all.nl> <20020721183637.5E5DB484B@dsl2.external.hp.com> <20020721205454.D16644@primare.xs4all.nl>
In-Reply-To: <20020721205454.D16644@primare.xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200207212140.49577.deller@gmx.de>
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

On Sunday 21 July 2002 20:54, DJ Tha Muggs wrote:
> On Sun, Jul 21, 2002 at 12:36:37PM -0600, Grant Grundler wrote:
> > DJ Tha Muggs wrote:
> > > So it looks like the system boots fine, but i can't use it with a
> > > monitor con nected :(
> >
> > Which graphics card is installed?
> > FWIW, only PCI Vis-EG gfx card is supported to date.
> > I thought the FAQ and "Supported HW" web pages covered this.
>
> I see the message for the faq in my screen and after a few seconds the
> machine contineus to boot in a higher resolution, so it seems my graphics
> works fine.
>
> Here are some details i got from dmesg:
> STI GSC/PCI graphics driver version 0.9
> STI PCI graphic ROM found at f7000000 (2048 kB), fb at fa000000 (32 MB)
> STI word mode ROM at f7000044, hpa at fa000000
> STI id 2fc1066b-9a02587, conforms to spec rev. 8.09
> STI device: HPA4553A
> stifb: Unsupported gfx card id 0x2fc1066b
>
> stifb: Unsupported gfx card id 0x2fc1066b
> sticonsole_init: searching for STI ROMs
> Console: switching to colour STI console 160x64

This is a Summit FX2, FX4 or FX6 gfx card.
As the messages above say you won't be able to use this card
as framebuffer device and thus it's not usable for X11 yet.
But at least Textmode (sticon) support should work.

Greetings,
Helge
