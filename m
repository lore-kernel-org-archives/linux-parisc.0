Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id F3830482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 13:51:05 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	norbert.naether@leica-microsystems.com
Subject: Re: [parisc-linux] HPA4552A, stifb
Date: Thu, 11 Oct 2001 21:50:08 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <OF4ACC8BA3.E1FA8942-ONC1256AE2.0037A5B7@leica.co.uk> <20011011212803.A1661@solo.franken.de>
In-Reply-To: <20011011212803.A1661@solo.franken.de>
MIME-Version: 1.0
Message-Id: <20011011195105.F3830482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Thursday 11 October 2001 21:28, Thomas Bogendoerfer wrote:
> Is there a reason for the #if 1 /* FIXME: */ in sticore.c ? Which machines
> will lockup, if PCI graphics boards are enabled ?

Last time I tested it HPMC'ed my c3000 with a VISUALIZE_EG PCI card.

Helge
