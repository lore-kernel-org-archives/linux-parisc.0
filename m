Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.unitec.edu (mail.unitec.edu [216.72.84.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE2434829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Apr 2003 15:32:59 -0700 (MST)
Received: from unitec.edu ([127.0.0.1]) by mail.unitec.edu
          (Netscape Messaging Server 4.15) with ESMTP id HCQM6M00.HNM for
          <parisc-linux@lists.parisc-linux.org>; Wed, 2 Apr 2003 16:23:10 -0600
From: "Ricardo Jose Guevara Ochoa" <jguevara@unitec.edu>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <26c4b36317a73ee1.17a73ee126c4b363@unitec.edu>
Date: Wed, 02 Apr 2003 16:23:10 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Kernel 2.4.20 build error
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

I downloaded the latest kernel for the parisc family, and when i tried 
to compile and build the kernel it gave me an error in the make 
vmlinux:
ccio-dma.c: In function `ccio_probe':
ccio-dma.c:1551: `ccio_proc_info' undeclared (first use in this 
function)
ccio-dma.c:1551: (Each undeclared identifier is reported only once
ccio-dma.c:1551: for each function it appears in.)
ccio-dma.c:1553: `ccio_resource_map' undeclared (first use in this 
function)
make[1]: *** [ccio-dma.o] Error 1
make[1]: Leaving directory 
`/home/rguevara/source/linux/arch/parisc/kernel'
make: *** [_dir_arch/parisc/kernel] Error 2

I'm tried to compile in a HP 9000 D-Class D270 running Debian 3.0r1 
with linux version 2.4.17-32 and gccv 3.0.4
any suggestions.
Ricardo J Guevara
 
