Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id A56BD484A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Sep 2001 12:42:10 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Bieri Stefan <Stefan.Bieri@garaventa.com>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] HP-Hil Keyboard
Date: Fri, 14 Sep 2001 20:41:42 +0200
References: <AB7A68BE49F8D411B5D4001083FD53042EEF6F@EXCHANGE>
In-Reply-To: <AB7A68BE49F8D411B5D4001083FD53042EEF6F@EXCHANGE>
MIME-Version: 1.0
Message-Id: <20010914184210.A56BD484A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Stefan,

This is a known problem, into which nobody has looked yet.
Maybe you want to investigate yourself and report us the bug ?
I assume it's a bug somewhere in the X keyboard tables...

Furthermore the current X fbdev-driver has a bug with the color-table
(palette) which aren't solved yet either :-(

Helge

On Friday 14 September 2001 10:22, Bieri Stefan wrote:
> Hi,
>
> I have installed the parisc-linux with X-Window System. The Problem I have,
> I've got a hp hil keyboard, that don't function without problems. I have a
> german layout. the problem I have, the "i" and the "o" keys do not
> function.
>
> Can you help me ?
>
> Best regards,
> Bieri Stefan
> GARAVENTA AG
>
> > Mit freundlichen Grüssen
> > GARAVENTA AG
> > Stefan Bieri
> >
> > Telefon:	+41 41 859 11 11
> > Telefon (direkt):	+41 41 859 11 61
> > Fax:		+41 41 859 11 00
> > Email:		stefan.bieri@garaventa.com
> >
> > Besuchen Sie uns doch auf dem Internet unter:
> > http://www.garaventa.com
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
