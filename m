Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E24F2482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Jun 2001 15:22:45 -0600 (MDT)
Message-Id: <200106132122.PAA01189@puffin.external.hp.com>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PALO/kernel-build change proposal 
In-Reply-To: Your message of "Wed, 13 Jun 2001 11:31:38 MDT."
             <E15AEUU-0004qi-00@noam.fc.hp.com>
Date: Wed, 13 Jun 2001 15:22:10 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
...
> When self hosted, there's usually no need to run palo after every
> kernel build since palo boots out of the file system by file name.
> So I propose that the common self-hosted use model be to use simple 'make'
> in the kernel tree [and make modules or whatever].  The resulting 'vmlinux'
> file can then be copied to the desired location.


On x86, "make install" will do all the right things to install the
freshly built kernel but doesn't do a damn thing for kernel modules.
Need to run "make modules" and "make modules_install" to really make
sure eveything is in sync.


> I propose that 'make palo' be changed to simply run 'palo -f ./palo.conf'
> after vmlinux is built.  This means palo would have to be in the $PATH
> and that the top-level linux source directory would contain a
> suitable palo.conf file.  I've been using this model for cross-compiling
> for several months and like it.  I would document how xc-ers can best
> compile and "install" palo as well as supply a palo.conf file with
> our typical configurations.
> 
> What is 'make palo' today would be changed to 'make buildrunpalo'.  The
> longer name is more truthful and less convenient on purpose.


How about "make lifimage"?
That's the only reason I run "make palo" in the XC environment.
Having a XC-palo in the environment is no problem.
In the XC env, I don't expect "make install" to do the right thing (tm).

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
