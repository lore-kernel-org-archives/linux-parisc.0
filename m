Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id C2066482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 09:14:16 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>,
	<parisc-linux@lists.parisc-linux.org>, <herbr@magma.ca>
Subject: Re: [parisc-linux] (no) HPMC on C200 and FX4 question
Date: Thu, 15 Nov 2001 17:13:24 +0100
References: <sbf3efb0.007@ms-zrt1>
In-Reply-To: <sbf3efb0.007@ms-zrt1>
MIME-Version: 1.0
Message-Id: <20011115161416.C2066482C@dsl2.external.hp.com>
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

On Thursday 15 November 2001 16:33, Jurriaan Kalkman wrote:
> >By the way does anyone know why an FX4 would not be set up. The message is:
> >
> >Trying PCI STI ROM at f1e00000, PCI hpa at f6000000
> >I'm not trying to set up the PCI graphic card now... It would freeze your
> >machine
> >Unable to handle STI device 'PCI device 103c:1008 (Hewlett-Packard
> > Company)'
>
> I get that message too; and I also wonder what it means exactly.

It means that it doesn't try to start the sticon/stifb driver for your card.
Change the "#if 1" to "#if 0" in drivers/video/sti/sticore.c, line 926, recompile
and boot again - then please let me know if it crashes for you or not.
I once inserted that check because the sticon/stifb driver crashes with the 
A4977A Visualize EG PCI card in my c3000. If it works for you we could try
to find a better solution.

Greetimgs,
Helge
