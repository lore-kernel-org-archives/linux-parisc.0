Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id AC71D4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 12:21:57 -0600 (MDT)
Message-ID: <3D6E665F.1030000@gmx.de>
Date: Thu, 29 Aug 2002 20:22:23 +0200
From: Christian Schmitt <chris.81@gmx.de>
Reply-To: christian@familieschmitt.de
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Harmony on 710 working?
References: <3D6CDF5A.5090205@gmx.de>	<200208281906.14844.helge.deller@sap.com>  <3D6E258B.6010600@gmx.de> <1030640071.22367.392.camel@beavis>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
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
> I have a theory on this .... but will probably be dis-reguarded by
> someone more knowledgable :)
> 
> I will try to explain what I believe the problem is, and provid a
> quick hack/work around for you to get it working.
> 
> 
> First can you tell me if CONFIG_IOMMU_CCIO is defined in your
> kernel as this will affect my answer.
> 


Hello,

CONFIG_IOMMU_CCIO is set to "y" in the kernel config. I set it to "n", 
recompiled the modules and "modprobe harmony" works.
However, aumix doesn't find a mixer device. Is there any way to find out where 
the problem is?



-- 
Linux - Cause life is too short for reboots
