Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED378482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Nov 2001 11:47:51 -0700 (MST)
Message-Id: <200111071843.LAA16301@puffin.external.hp.com>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] evms_vgscan crash hppa kernel 
In-Reply-To: Message from joel.soete@freebel.net
   of "Wed, 07 Nov 2001 15:56:16 +0100." <1005144976.3be94b9093186@webmail.tiscalinet.be>
Date: Wed, 07 Nov 2001 11:43:10 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

joel.soete@freebel.net wrote:
> I would like to debug this by obtaining a core dump of the kernel after the 
> reboot but I do not know how? (I did not find back the mail explaining how
> to do it in detail)

Linux (from Linus' tree) does not support core dumps.
I'm only aware of coredump support patch from SGI.

The folks that manage HPUX core dump tools expresed interest
in porting the same tools to parisc-linux...assuming
we would dump core in the same format.

If a spec published for that, would anyone commit to implementing it?

FWIW, I think much of the work is portable to ia64-linux in case
that would help justify an HP project to pick up/fund this work.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
