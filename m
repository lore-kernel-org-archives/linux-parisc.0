Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B9B14829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Apr 2003 15:41:42 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 190qvK-00065N-1h; Wed, 02 Apr 2003 23:41:38 +0100
Date: Wed, 2 Apr 2003 23:41:38 +0100
From: Matthew Wilcox <willy@debian.org>
To: Ricardo Jose Guevara Ochoa <jguevara@unitec.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel 2.4.20 build error
Message-ID: <20030402224138.GU29376@parcelfarce.linux.theplanet.co.uk>
References: <26c4b36317a73ee1.17a73ee126c4b363@unitec.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <26c4b36317a73ee1.17a73ee126c4b363@unitec.edu>
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

On Wed, Apr 02, 2003 at 04:23:10PM -0600, Ricardo Jose Guevara Ochoa wrote:
> I downloaded the latest kernel for the parisc family, and when i tried 
> to compile and build the kernel it gave me an error in the make 
> vmlinux:
> ccio-dma.c: In function `ccio_probe':
> ccio-dma.c:1551: `ccio_proc_info' undeclared (first use in this 
> function)

turn on CONFIG_PROC_FS

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
