Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD905461C.dip.t-dialin.net [217.5.70.28])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A9FD4839
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Dec 2001 05:47:28 -0700 (MST)
Date: Wed, 26 Dec 2001 13:45:05 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.16-pa24 crashes on c3k
Message-ID: <20011226134505.A5568@solo.franken.de>
References: <Pine.LNX.4.33.0112250945530.486-100000@goliath.alaskatech.org> <20011226050128.821554833@dsl2.external.hp.com> <grundler@dsl2.external.hp.com> <20011226060247.3C5054836@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011226060247.3C5054836@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Tue, Dec 25, 2001 at 11:02:47PM -0700
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

On Tue, Dec 25, 2001 at 11:02:47PM -0700, Grant Grundler wrote:
> Grant Grundler wrote:
> > Must be something related to suckyio since I'm not using any graphics
> > console and that's about when console switches over.
> 
> Good guess. Just committed 2.4.16-pa25 which fixes.
> suckyio requires the first PCI HBA be numbered 0 (and not 1).

Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)

PCI or EISA Host Bus Adapter 3 not registered. in32(0x30030) returning -1
WARNING! Stack pointer and cr30 do not correspond!

Dumping Stack from 10858000 to 108587c0:

that's -pa25 on my B132.

> Was broken by -pa24 commit.

I had the problem as above, when playing with willy's dino patch (hand applied,
so I missed a chunk). I tried to understand the pci resource assigning code
and failed so far. If my headache settles down, I'm might look into that 
again today.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
