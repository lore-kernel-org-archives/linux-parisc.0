Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.unitec.edu (mail.unitec.edu [216.72.84.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9D17482B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Apr 2003 08:04:59 -0700 (MST)
From: "Ricardo Jose Guevara Ochoa" <jguevara@unitec.edu>
To: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <5849494679bc7010.79bc701058494946@unitec.edu>
Date: Thu, 03 Apr 2003 08:55:11 -0600
MIME-Version: 1.0
Subject: Re: [parisc-linux] Kernel 2.4.20 build error
Content-Type: text/plain; charset=us-ascii
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

> 
> turn on CONFIG_PROC_FS

Where do i turn it on? in a file /arch/parisc/defconfig it's already 
turn on.

thanks in advance,
Ricardo J Guevara

----- Original Message -----
From: Matthew Wilcox <willy@debian.org>
Date: Wednesday, April 2, 2003 4:41 pm
Subject: Re: [parisc-linux] Kernel 2.4.20 build error

> On Wed, Apr 02, 2003 at 04:23:10PM -0600, Ricardo Jose Guevara 
> Ochoa wrote:
> > I downloaded the latest kernel for the parisc family, and when i 
> tried 
> > to compile and build the kernel it gave me an error in the make 
> > vmlinux:
> > ccio-dma.c: In function `ccio_probe':
> > ccio-dma.c:1551: `ccio_proc_info' undeclared (first use in this 
> > function)
