Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23A11482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 May 2001 13:05:11 -0600 (MDT)
Message-Id: <200105161857.MAA10761@puffin.external.hp.com>
To: joel@digitalparadise.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Help with bootable CD 
In-Reply-To: Your message of "Wed, 16 May 2001 13:13:03 CDT."
             <GAENJIFENGKGOINJAONFOEOBCAAA.joel@digitalparadise.net>
Date: Wed, 16 May 2001 12:57:26 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Joel Lansden" wrote:
> I have an H50 with 256Mb Memory, 4 C2490A 2gb hard drives, and a regular HP
> SCSI CD-ROM.
> Does this help at all?

A bit. HP hasn't done any testing on Nova class boxes.

Some folks are running parisc-linux on E55 (iirc) using NFS root.
FWIW, they are only capable of 32-bit kernels. Forget
trying to install the CD on local disk since we have no drivers
for the HP-PB SCSI interfaces. At www.parisc-linux.org , read the
FAQ answer to "is my HW supported".

Please submit a bug to either kernel or palo project which includes
*all* serial console output. See http://bugs.parisc-linux.org/
for info on how to submit bugs.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
