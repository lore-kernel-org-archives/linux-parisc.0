Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91B104829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 10:54:34 -0600 (MDT)
Subject: Re: [parisc-linux] Harmony on 710 working?
From: Ryan Bradetich <rbradetich@uswest.net>
To: christian@familieschmitt.de
Cc: Helge Deller <helge.deller@sap.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D6E258B.6010600@gmx.de>
References: <3D6CDF5A.5090205@gmx.de>
	<200208281906.14844.helge.deller@sap.com>  <3D6E258B.6010600@gmx.de>
Content-Type: text/plain
Date: 29 Aug 2002 10:54:31 -0600
Message-Id: <1030640071.22367.392.camel@beavis>
Mime-Version: 1.0
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

I have a theory on this .... but will probably be dis-reguarded by
someone more knowledgable :)

I will try to explain what I believe the problem is, and provid a
quick hack/work around for you to get it working.


First can you tell me if CONFIG_IOMMU_CCIO is defined in your
kernel as this will affect my answer.

My suspicion is that it is not defined, thus my answer makes
this assumption.


Problem:
	The CONFIG_IOMMU_CCIO is not defined in your kernel,
	so the ccio_get_fake() is defined to be NULL in
	include/asm-parisc/pci.h.  This usually works fine
	if the drivers are compiled into the kernel ... but
	you are loading this as a module....  My suspicion is
	that the harmony module is trying to find the 
	ccio_get_fake() entry point and your kernel does not
	export that function. (CONFIG_IOMMU_CCIO is not 
	defined).

	What confuses my about this problem is why ccio_get_fake()
	is not defined to NULL by include/asm-parisc/pci.h.  Is
	there a mis-match between your kernel and module CONFIG_*
	options?


Solution:
	Since the 710 does not have ccio, the cico_get_fake() 
	is not needed. The ccio_get_fake() only needed for ccio
	machines on busses below the ccio that are not PCI (ie,
	PIC, GSC).  So for you temp hack, just assign
	harmony.fake_pci_dev to NULL.  Once we have a better
	picture of what is happening, we will insert a better
	fix if appropriate :)

Thanks,

- Ryan

	
On Thu, 2002-08-29 at 07:45, Christian Schmitt wrote:
> Helge Deller wrote:
> > On Wednesday 28 August 2002 16:34, Christian Schmitt wrote:
> > 
> >>I recently downloaded and compiled the latest pa-kernel. I also included
> >>harmony sound support and now I would like to know if and how I can access
> >>the sound device. Serching on the web was no success.
> > 
> > 
> > insmod harmony
> > aumix
> > mpg123 <your-favorite-mp3-file>
> > 
> 
> I recompiled the kernel with harmony as a module. I get unresolved symbols when 
> loading the harmony driver:
> 
> ccio_get_fake
> 
> Any suggestions?
> 
> Chris
> 
> 
> -- 
> Linux - Cause life is too short for reboots
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
