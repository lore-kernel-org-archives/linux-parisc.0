Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: christian@familieschmitt.de
Cc: Helge Deller <helge.deller@sap.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Harmony on 710 working? 
In-Reply-To: Message from Christian Schmitt <chris.81@gmx.de>
   of "Thu, 29 Aug 2002 15:45:47 +0200." <3D6E258B.6010600@gmx.de>
References: <3D6CDF5A.5090205@gmx.de> <200208281906.14844.helge.deller@sap.com>  <3D6E258B.6010600@gmx.de> 
Date: Thu, 29 Aug 2002 10:55:27 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020829165527.DC3044829@dsl2.external.hp.com>
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

Christian Schmitt wrote:
> ccio_get_fake
> 
> Any suggestions?

harmony.c needs to include pci.h :^(

./include/asm-parisc/pci.h:#define ccio_get_fake(dev) NULL

that's where the pci_dma_xxx interface definitions live.
Or those definitions need to move to a seperate file that
harmony.c and pci.h can include. Maybe create a pci-dma.h?

helge, rbrad, willy?

grant
