Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from freya.yggdrasil.com (h-64-105-35-8.SNVACAID.covad.net [64.105.35.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BC2F4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Dec 2002 14:56:36 -0700 (MST)
From: "Adam J. Richter" <adam@yggdrasil.com>
Date: Thu, 5 Dec 2002 13:53:28 -0800
Message-Id: <200212052153.NAA05169@adam.yggdrasil.com>
To: parisc-linux@lists.parisc-linux.org
Cc: James.Bottomley@steeleye.com
Subject: [parisc-linux] Question about parisc machines with little or no consistent memory
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

	I have a question about the parisc machines that have little
or not consistent memory available.  I'm interested in both the
parisc machines that Linux currently supports and those that it
has not been ported to.

	My question is: what kind of inconsistent memory do they have?
I am most interested in knowing if you can at least allocate memory
may be read cached but is write through.  If you can select
write-through and you write a 4-byte word aligned on a 4-byte
boundary, will you only write those four bytes without writing back
any potentially stale cached data?  How about if you write a char or a
short?  If these machines support memory that need read barriers but
does not have the hazard of potentially writing back incorrect cached
data, that may simplify adding support for these machines to more
drivers.

	I am asking because this is relevant to a discussion on lkml
about some changes that James Bottomley posted to generalize the
pci_xxx DMA mapping routines to generic devices.

Adam J. Richter     __     ______________   575 Oroville Road
adam@yggdrasil.com     \ /                  Milpitas, California 95035
+1 408 309-6081         | g g d r a s i l   United States of America
                         "Free Software For The Rest Of Us."
