Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout08.sul.t-online.com (mailout08.sul.t-online.com [194.25.134.20])
	by dsl2.external.hp.com (Postfix) with ESMTP id 343F6483F
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Jul 2002 04:07:40 -0600 (MDT)
Cc: parisc list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Date: Sun, 21 Jul 2002 11:42:33 +0200
From: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Message-ID: <3D3A8209.DCAC18F7@ruhr-west.de>
MIME-Version: 1.0
References: <3D383969.1657EF43@ruhr-west.de> <20020720152919.9D690483D@dsl2.external.hp.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Subject: [parisc-linux] Solved: C110, kernel Panics, still more tears ;-(
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
> > Hi Grant and all,
> >
> > still more tears. I compiled and replaced the kernel, using 2.4.18pa55.
> > I used the setting of ccio_mem_ratio=16, but still my kernel panics with
> > Kernel panic: ccio-dma.c ccio_alloc_range() I/O MMU is out of mapping
> > resources.
> > In interrupt handler - not syncing
> 
> Sorry - my bad - I think I have it backwards.
> Using a smaller value will result in more IOMMU resource.
> 
> > would there be more chance with the ccio_mem_ratio setting of 8?
> 
> Or 2 or 1 even.

I use a setting of 2 now and was able to ftp a good collection of
kernel.tar.gz files without crash. I hope this darn baby is *not*
playing tricks on me now, since I was once able to ftp a 200 MB file
without crash too. But all left to do is wait and watch and declare it
fixed for the time beeing.

> 
> > there a way to use more than one Kernel alternativly and select it at
> > boottime with palo? Is there an example palo.conf somewhere?
> 
> Yes. Interrupt the boot process before palo is loaded and then
> type "Y" to "Interact with IPL (Y/N/Q)?" question. You can then
> specify which vmlinux to boot.
> 
yep. I started to use "easy" names (as you suggested). I had to try
that, since my default kernel had the setting of 16 and crashes saving a
3MB kernel...

Thanks to all involved to solve this problem.


Juergen

-- 
===========================================     __   _
Juergen Braukmann juergen.braukmann@gmx.de| -o)/ /  (_)__  __ ____  __
Tel: 0201-743648  dk4jb@db0qs.#nrw.deu.eu | /\\ /__/ / _ \/ // /\ \/ /
===========================================_\_v __/_/_//_/\_,_/ /_/\_\
