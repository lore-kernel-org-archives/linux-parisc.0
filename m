Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: jsoe0708@tiscali.be
Cc: "Ryan Bradetich" <rbradetich@uswest.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: FW: RE: [parisc-linux] 2.4.20-rc1-pa7 boot problem on b180 
In-Reply-To: Message from jsoe0708@tiscali.be
   of "Thu, 28 Nov 2002 17:27:17 +0100." <3DB577610000573D@ocpmta8.be.tiscali.com>
References: <3DB577610000573D@ocpmta8.be.tiscali.com> 
Date: Mon, 02 Dec 2002 21:09:42 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021203040942.4180F482E@dsl2.external.hp.com>
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

jsoe0708@tiscali.be wrote:
> >the less by curiosity I apply the Ryan patch: <http://lists.parisc-linux=
> .org/pipermail/parisc-linux/2002-November/018414.html>
> >and it also solved the problem of the b180 boot??

yes - thanks for finding this!

arch/parisc/kernel/pci-dma.c has the same bug as what ccio driver
has/had regarding scatter/gather lists (pci_map_sg() interfaces).
Replace all references to "sg->address" with "sg_virt_addr(sg)".
Can you send me a patch off list for that?

If not, I'll probably do it since I'd like to get my B180 working on 2.4.20.
It will just take longer.

> Don't know if could help but I also notice the following difference at
> boot time:
> 
> With highmem_io=3D1 on a b2000
...
> with highmem_io=3D0 on a b180
...

It's hard to compare different SCSI implementations.
IIRC, B2000 uses 53c875 and B180 uses LASI for SE narrow SCSI.
Check to see which driver claims the respective SCSI controllers.

grant
