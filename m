Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from primare.xs4all.nl (primare.xs4all.nl [213.84.188.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id CDB5F4859
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Jul 2002 12:54:05 -0600 (MDT)
Date: Sun, 21 Jul 2002 20:54:54 +0200
From: DJ Tha Muggs <djmuggs@primare.xs4all.nl>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Systems Console hangs!
Message-ID: <20020721205454.D16644@primare.xs4all.nl>
References: <20020721183508.C16644@primare.xs4all.nl> <djmuggs@primare.xs4all.nl> <20020721183637.5E5DB484B@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020721183637.5E5DB484B@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Sun, Jul 21, 2002 at 12:36:37PM -0600
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

On Sun, Jul 21, 2002 at 12:36:37PM -0600, Grant Grundler wrote:
> DJ Tha Muggs wrote:
> > So it looks like the system boots fine, but i can't use it with a monitor con
> >   nected :(
> 
> Which graphics card is installed?
> FWIW, only PCI Vis-EG gfx card is supported to date.
> I thought the FAQ and "Supported HW" web pages covered this.
> 
I see the message for the faq in my screen and after a few seconds the machine contineus to boot in a higher resolution, so it seems my graphics works fine.

Here are some details i got from dmesg:
STI GSC/PCI graphics driver version 0.9
STI PCI graphic ROM found at f7000000 (2048 kB), fb at fa000000 (32 MB)
STI word mode ROM at f7000044, hpa at fa000000
STI id 2fc1066b-9a02587, conforms to spec rev. 8.09
STI device: HPA4553A
stifb: Unsupported gfx card id 0x2fc1066b

stifb: Unsupported gfx card id 0x2fc1066b
sticonsole_init: searching for STI ROMs
Console: switching to colour STI console 160x64

I hope this helps out?

Thx in advance,

Cristian.
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
