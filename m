Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: christian@familieschmitt.de, Helge Deller <helge.deller@sap.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Harmony on 710 working? 
In-Reply-To: Message from Ryan Bradetich <rbradetich@uswest.net>
   of "29 Aug 2002 10:54:31 MDT." <1030640071.22367.392.camel@beavis>
References: <3D6CDF5A.5090205@gmx.de> <200208281906.14844.helge.deller@sap.com> <3D6E258B.6010600@gmx.de>  <1030640071.22367.392.camel@beavis> 
Date: Thu, 29 Aug 2002 11:05:49 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020829170549.C08EB4829@dsl2.external.hp.com>
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

Ryan Bradetich wrote:
> 	What confuses my about this problem is why ccio_get_fake()
> 	is not defined to NULL by include/asm-parisc/pci.h.  Is
> 	there a mis-match between your kernel and module CONFIG_*
> 	options?

I think this is right. I overlooked that pci.h was getting
included...even though we should move pci_dma* to a different
file like I suggested.

grant
