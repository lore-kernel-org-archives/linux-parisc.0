Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF0F0482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  2 Feb 2002 20:32:04 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
Date: Sat, 02 Feb 2002 20:32:04 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020203033204.AF0F0482A@dsl2.external.hp.com>
Subject: [parisc-linux] hppa_dma_ops patch
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

Hi all,
I've prepared code for hppa_dma_ops/CONFIG_PA11 and placed it on
	ftp://ftp.parisc-linux.org/patches/hppa_dma_ops.patch

I've built PA20 and PA11 kernels.  But not tested either.
My A500 is currently in use and I need someone else to try
with CONFIG_PA11 enabled. I'm sure I'll get to test on the A500
(CONFIG_PA20) by tomorrow and can then commit the code.

thanks,
grant
