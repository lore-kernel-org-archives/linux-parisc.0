Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-1.cisco.com (sj-msg-core-1.cisco.com [171.71.163.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB888484F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Dec 2001 22:25:28 -0700 (MST)
Date: Wed, 26 Dec 2001 21:25:25 -0800
From: Christian Suder <csuder@cisco.com>
To: "Helge Deller" <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [Q] on EISA support
Message-Id: <20011226212525.0d086b16.csuder@cisco.com>
In-Reply-To: <20011226223124.68FBB4848@dsl2.external.hp.com>
References: <4.3.2.7.2.20011226135241.027fc090@mira-sjc5-9.cisco.com>
	<20011226223124.68FBB4848@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 26 Dec 2001 23:30:16 +0100
"Helge Deller" <deller@gmx.de> wrote:

> On Wednesday 26 December 2001 23:13, Christian Suder wrote:
> > Tried a NE2000 clone too, which was detected but with the wrong interrupt.
> > That might be because it's a "hard" configured plug&pray card. PCs have no
> > problems detecting the settings correctly, though.
> 
> Hi Christian,
> 
> Did you tried the "eisa_irq_edge=3,4,5,7,9,10,11,14,15" palo parameter ?
> In case your NE2000 card is an ISA card you need to set the EISA irq's to
> edge mode which is done with the above command.
> Maybe we should think about adding a /proc-interface here ?
> 

Thanks Helge,

that "basically" fixed it, i could use the card with 2.4.16-pa23. However as X has problems with this kernel (X server starts but graphics are garbled). I compiled 2.4.16-pa25, and this is what I get: 

Dec 26 20:45:04 c110-linux kernel: Wax EISA Adapter found at 0xfc000000
Dec 26 20:45:04 c110-linux kernel: Warning : device (11, 0x1e, 0x0, 0x90) NOT cl
aimed by EISA Bus Adapter

and then : 
Dec 26 20:45:04 c110-linux kernel: PCI or EISA Host Bus Adapter 0 not registered
. in8(0x300) returning -1
Dec 26 20:45:04 c110-linux kernel: 
Dec 26 20:45:04 c110-linux kernel: PCI or EISA Host Bus Adapter 0 not registered
. in8(0x280) returning -1
Dec 26 20:45:04 c110-linux kernel:
Dec 26 20:45:04 c110-linux kernel: PCI or EISA Host Bus Adapter 0 not registered
. in8(0x320) returning -1

The EISA support should be compiled in, at least I selected it. X is still garbled so no improvement in that area. 

BTW is there a compilation of all the "secret" boot parameters ? It's the second time now that it fixes a problem for me....


Danke nochmal,

	Christian 
