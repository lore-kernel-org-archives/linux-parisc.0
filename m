Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout07.sul.t-online.com (mailout07.sul.t-online.com [194.25.134.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id C03174852
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Jul 2002 17:07:38 -0600 (MDT)
Cc: parisc list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=iso-8859-15
Date: Sun, 21 Jul 2002 00:57:57 +0200
From: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Message-ID: <3D39EAF5.A8932E1F@ruhr-west.de>
MIME-Version: 1.0
References: <3D383969.1657EF43@ruhr-west.de> <20020720152919.9D690483D@dsl2.external.hp.com>
Subject: Re: [parisc-linux] C110, kernel Panics, still more tears ;-(
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
> 
OK, kernel baking time again. ;-)

> > there a way to use more than one Kernel alternativly and select it at
> > boottime with palo? Is there an example palo.conf somewhere?
> 
> Yes. Interrupt the boot process before palo is loaded and then
> type "Y" to "Interact with IPL (Y/N/Q)?" question. You can then
> specify which vmlinux to boot.

Tried that, but didn't see a reasonable list. I could alter some things
(inluding kernel) but I would have needed to know the name to type in. I
will try to use easy names and numbering for testing.

Thank's a lot

Juergen
> 
> grant

-- 
===========================================     __   _
Juergen Braukmann juergen.braukmann@gmx.de| -o)/ /  (_)__  __ ____  __
Tel: 0201-743648  dk4jb@db0qs.#nrw.deu.eu | /\\ /__/ / _ \/ // /\ \/ /
===========================================_\_v __/_/_//_/\_,_/ /_/\_\
