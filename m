Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4BC424845
	for <parisc-linux@lists.parisc-linux.org>; Mon, 29 Sep 2003 23:33:58 -0600 (MDT)
Received: from redsea.india.hp.com (redsea.india.hp.com [15.76.97.3])
	by atlrel7.hp.com (Postfix) with ESMTP id EF16C1C00093
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Sep 2003 01:33:54 -0400 (EDT)
Received: from india.hp.com (eb9856.india.hp.com [15.76.98.56])
	by redsea.india.hp.com (8.9.3 (PHNE_28810)/8.9.3 SMKit7.02) with ESMTP id LAA20300
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Sep 2003 11:12:49 +0530 (IST)
Message-ID: <3F7915A7.1F54379@india.hp.com>
Date: Tue, 30 Sep 2003 11:03:28 +0530
From: Naresh <knaresh@india.hp.com>
Reply-To: knaresh@india.hp.com
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] MAX_ADDRESS.
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

Hi,
This question is relevant to the 2.4 kernel. Is MAX_ADDRESS really the
highest virtual address mapped by the kernel? I can see this comment in
'paging_init()' in the section for DISCONTIGMEM. However,
pagetable_init() doesnt make a check before it calls 'map_pages( )' for
all the ranges of memory. So we may DISCONTIGMEM turned off but  it may
so happen that we have a 'pmem_ranges[]' entry that is greater than
MAX_ADDRESS which may find its way into the kernel page tables.
Regards,
Naresh.
