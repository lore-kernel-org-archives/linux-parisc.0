Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout07.sul.t-online.com (mailout07.sul.t-online.com [194.25.134.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id AB04D4838
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Jul 2002 10:07:38 -0600 (MDT)
Cc: parisc list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Date: Thu, 18 Jul 2002 17:19:10 +0200
From: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Message-ID: <3D36DC6E.9E29A95F@ruhr-west.de>
MIME-Version: 1.0
References: <3D35925D.71683E92@ruhr-west.de> <20020717181459.CCD8E48CF@dsl2.external.hp.com>
Subject: Re: [parisc-linux] Kernel panic, ccio-dma.c, C110
To: Grant Grundler <grundler@dsl2.external.hp.com>
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

Grant Grundler schrieb:
> 
> Juergen Braukmann wrote:
> > Kernel panic: ccio-dma.c ccio_alloc_range() I/O MMU is out of mapping
> > resources.
> 
> Sorry Joel, this has nothing to do with SCSI termination.
> 
> Juergen,
> In arch/parisc/kernel/ccio-dma.c, change ccio_mem_ratio from 4 to 8 or 16.
> For more explanation, search for "Determine IOVA Space size" in ccio-dma.c.
> 
Hi All,

when I read this first I thought "easy" (having in mind cat-ting "4"
somewhere into some file in the proc tree), but this is a kernel change
and recompile. I do not have the sorces on the machine and do not realy
know how to crosscompile on my i686 box. Trying to ftp the kernel source
over will panic the kernel.
I looked into the kernel Makefile, but am not sure what changes to do
there. Is there some info on that? (I'll look up the website for
x-compilation). All this seems to be over my intelectual limits. ;-(
Is there a chance to change that default value in the precompiled
kernels??

Juergen

-- 
===========================================     __   _
Juergen Braukmann juergen.braukmann@gmx.de| -o)/ /  (_)__  __ ____  __
Tel: 0201-743648  dk4jb@db0qs.#nrw.deu.eu | /\\ /__/ / _ \/ // /\ \/ /
===========================================_\_v __/_/_//_/\_,_/ /_/\_\
