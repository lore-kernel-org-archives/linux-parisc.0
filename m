Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id B347E4A1D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 14:29:02 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id E002B1274
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 16:29:01 -0500 (EST)
Received: from eeyore.fc.hp.com (eeyore.fc.hp.com [15.1.54.199])
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) with SMTP id OAA09094
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 14:29:01 -0700 (MST)
From: Bjorn Helgaas <bjorn_helgaas@hp.com>
To: parisc-linux@lists.parisc-linux.org
Date: Fri, 16 Mar 2001 14:28:51 -0700
Content-Type: text/plain;
  charset="iso-8859-1"
MIME-Version: 1.0
Message-Id: <0103161428510J.15483@eeyore.fc.hp.com>
Subject: [parisc-linux] physical address width
List-ID: <linux-parisc.vger.kernel.org>

If/when superdome is configured to be NUMA (i.e., have some memory that is 
not interleaved across all cells), the non-interleaved memory will show up 
in the physical address space above 512Gb.  This is a problem for HP-UX, 
because there are a couple places where physical addresses are stored in 
bitfields too small to contain these addresses.

Does 64-bit parisc-linux have any similar issues?  What is the supported 
physical address size?  I don't know how far above 512Gb memory can go; 
it's sparse, so it could be quite a ways.  I know superdome supports up to 
44-bit addressing, so I guess that's probably the worst case right now.

Bjorn
