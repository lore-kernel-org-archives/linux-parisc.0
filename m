Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2FF994829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 12:38:40 -0600 (MDT)
Subject: Re: [parisc-linux] Harmony on 710 working?
From: Ryan Bradetich <rbradetich@uswest.net>
To: christian@familieschmitt.de
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D6E665F.1030000@gmx.de>
References: 
	<3D6CDF5A.5090205@gmx.de>	<200208281906.14844.helge.deller@sap.com>
	<3D6E258B.6010600@gmx.de> <1030640071.22367.392.camel@beavis>
	<3D6E665F.1030000@gmx.de>
Content-Type: text/plain
Date: 29 Aug 2002 12:38:38 -0600
Message-Id: <1030646318.19450.398.camel@beavis>
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

You should not have to compile the modules differently then from the
kernel.  What happens when you compile both the kernel and modules
with CONFIG_IOMMU_CCIO=y?

[Note: The ccio_get_fake will return the appropriate NULL if your
system does not have any ccio devices.]

Sorry, I don't know anything about aumix.   Do you have a /dev/mixer?
sane permissions? etc?

Thanks,

- Ryan


On Thu, 2002-08-29 at 12:22, Christian Schmitt wrote:
> Ryan Bradetich wrote:
> > I have a theory on this .... but will probably be dis-reguarded by
> > someone more knowledgable :)
> > 
> > I will try to explain what I believe the problem is, and provid a
> > quick hack/work around for you to get it working.
> > 
> > 
> > First can you tell me if CONFIG_IOMMU_CCIO is defined in your
> > kernel as this will affect my answer.
> > 
> 
> 
> Hello,
> 
> CONFIG_IOMMU_CCIO is set to "y" in the kernel config. I set it to "n", 
> recompiled the modules and "modprobe harmony" works.
> However, aumix doesn't find a mixer device. Is there any way to find out where 
> the problem is?
> 
> 
> 
> -- 
> Linux - Cause life is too short for reboots
> 
> 
