Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E3700482C
	for <parisc-linux@parisc-linux.org>; Tue, 13 Nov 2001 13:36:52 -0700 (MST)
Message-Id: <200111132032.NAA01102@puffin.external.hp.com>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] to swap or not to swap 
In-Reply-To: Message from Randolph Chung <randolph@tausq.org>
   of "Tue, 13 Nov 2001 11:42:48 PST." <20011113114247.G3053@tausq.org>
Date: Tue, 13 Nov 2001 13:32:08 -0700
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

Randolph Chung wrote:
> Grant also seems to be of the opinion that cpu data needs to be swapped
> before written to PCI devices... so does that mean that if i wrote
> something like:
> 
> writew(cpu_to_le16(foo), addr)
> 
> then on things like parisc it gets swapped once, and on things like
> sparc it gets swapped twice?

maybe that's a bug in how sparc code works?

For parisc, the above is correct for (nearly) all PCI devices.
(I hedge since odd PCI devices might want cpu_to_be16() instead).

And don't forget that control data read by the PCI device via DMA
has to be "endian corrected" too.

PA HW implements what I've heard called "address invariance".
IIRC, m700-10 (r4000 mips, Olivetti) does the same thing.
I think Dino Documentation calls this "byte is byte".
Ie byte stream offsets are the same regardless of how they
are address by either DMA or PIO from either CPU or PCI device.

The result is multi-byte data (ie short/int) has to be swapped
when read/written by the PArisc CPU and the addresses don't change.

HTH,
grant
