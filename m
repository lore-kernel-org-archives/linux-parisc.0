Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id BAAEF484A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Dec 2001 00:53:41 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Christian Suder <csuder@cisco.com>
Subject: Re: [parisc-linux] [Q] on EISA support
Date: Thu, 27 Dec 2001 08:51:44 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <4.3.2.7.2.20011226135241.027fc090@mira-sjc5-9.cisco.com> <20011226223124.68FBB4848@dsl2.external.hp.com> <20011226212525.0d086b16.csuder@cisco.com>
In-Reply-To: <20011226212525.0d086b16.csuder@cisco.com>
MIME-Version: 1.0
Message-Id: <200112270851.44909.deller@gmx.de>
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

On Thursday 27 December 2001 06:25, Christian Suder wrote:
> On Wed, 26 Dec 2001 23:30:16 +0100
>
> "Helge Deller" <deller@gmx.de> wrote:
> > On Wednesday 26 December 2001 23:13, Christian Suder wrote:
> > > Tried a NE2000 clone too, which was detected but with the wrong
> > > interrupt. That might be because it's a "hard" configured plug&pray
> > > card. PCs have no problems detecting the settings correctly, though.
> >
> > Hi Christian,
> >
> > Did you tried the "eisa_irq_edge=3,4,5,7,9,10,11,14,15" palo parameter ?
> > In case your NE2000 card is an ISA card you need to set the EISA irq's to
> > edge mode which is done with the above command.
> > Maybe we should think about adding a /proc-interface here ?
>
> Thanks Helge,
>
> that "basically" fixed it, i could use the card with 2.4.16-pa23. However
> as X has problems with this kernel (X server starts but graphics are
> garbled). I compiled 2.4.16-pa25, and this is what I get:
>
> Dec 26 20:45:04 c110-linux kernel: Wax EISA Adapter found at 0xfc000000
> Dec 26 20:45:04 c110-linux kernel: Warning : device (11, 0x1e, 0x0, 0x90)
> NOT cl aimed by EISA Bus Adapter
>
> and then :
> Dec 26 20:45:04 c110-linux kernel: PCI or EISA Host Bus Adapter 0 not
> registered . in8(0x300) returning -1
> Dec 26 20:45:04 c110-linux kernel:
> Dec 26 20:45:04 c110-linux kernel: PCI or EISA Host Bus Adapter 0 not
> registered . in8(0x280) returning -1
> Dec 26 20:45:04 c110-linux kernel:
> Dec 26 20:45:04 c110-linux kernel: PCI or EISA Host Bus Adapter 0 not
> registered . in8(0x320) returning -1
>
> The EISA support should be compiled in, at least I selected it. X is still
> garbled so no improvement in that area.
>
> BTW is there a compilation of all the "secret" boot parameters ? It's the
> second time now that it fixes a problem for me....

Hi Christian,

try the default config (remove your .config file and then run "make oldconfig").
It just booted here for me with -pa27, so I assume you may have forgotten the
CONFIG_GSC_WAX=y configuration entry. 
Regarding the "secret" boot parameters I think the eisa_irq_edge and some
SCSI variants are the only one we have. I will add them later today to the FAQ.

Greetings,
Helge
