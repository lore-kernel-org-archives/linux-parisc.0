Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90942482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Jan 2003 15:58:12 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id OAA13348
	for <parisc-linux@lists.parisc-linux.org>; Wed, 1 Jan 2003 14:57:57 -0800
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id h01Mvpq03439;
	Wed, 1 Jan 2003 16:57:52 -0600
Message-Id: <200301012257.h01Mvpq03439@localhost.localdomain>
To: rmk@arm.linux.org.uk
Cc: parisc-linux@lists.parisc-linux.org, linux-kernel@vger.kernel.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 01 Jan 2003 16:57:51 -0600
From: James Bottomley <James.Bottomley@steeleye.com>
Subject: [parisc-linux] Re: "vmalloc", friends and GFP flags
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

> I've just been looking over the state of the ARM {dma,pci}_alloc_consis
> tent wrt interrupts etc in 2.5.53, and decided to have a look around
> this area for other users.  I stumbled across the following unsafe
> areas.

> a) parisc.  Looking at pa11_dma_alloc_consistent:

I agree with the flow analysis.  However, there is a condition attached to 
getting from pte_alloc_kernel to pte_alloc_one_kernel which makes the 
GFP_KERNEL allocation.  That condition looks to be that the pmd is not 
present.  I don't believe that's possible for an area of memory we just got 
from __get_free_pages (otherwise the kernel could fault when accessing that 
region which isn't allowed).

If the above analysis is correct (which I'll defer to better opinion) then we 
can in practice never get down the problem path, and dma_ allocation from 
interrupt is safe on parisc.

James
