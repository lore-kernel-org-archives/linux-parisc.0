Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50F6B482C
	for <parisc-linux@parisc-linux.org>; Tue, 13 Nov 2001 15:44:56 -0700 (MST)
Subject: Re: [parisc-linux] to swap or not to swap
To: randolph@tausq.org
Date: Tue, 13 Nov 2001 22:51:54 +0000 (GMT)
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20011113114247.G3053@tausq.org> from "Randolph Chung" at Nov 13, 2001 11:42:48 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E163mPK-0002an-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> Grant also seems to be of the opinion that cpu data needs to be swapped
> before written to PCI devices... so does that mean that if i wrote
> something like:
> 
> writew(cpu_to_le16(foo), addr)
> 
> then on things like parisc it gets swapped once, and on things like
> sparc it gets swapped twice?

Constant swaps get optimised out by the compiler in theory though.
