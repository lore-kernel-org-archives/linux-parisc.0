Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id EAA35482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Jul 2001 23:46:00 -0600 (MDT)
Message-Id: <200107110545.XAA31374@puffin.external.hp.com>
To: Charles Boone <ccboone@yahoo.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Problem installing .9 iso image on C240 
In-Reply-To: Message from Charles Boone <ccboone@yahoo.com>
   of "Tue, 10 Jul 2001 07:23:53 PDT." <20010710142353.5757.qmail@web11207.mail.yahoo.com>
Date: Tue, 10 Jul 2001 23:45:15 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Charles Boone wrote:
...
> I do have one question, why
> would it not try to install the 64bit version? I was
> pretty sure that a C240 is a 64bit system.

PDC on the C240 (and similar C-models of that generation) only
support PDC calls in "narrow" (ie 32-bit) mode. Sounds like the decision
to install 32 vs 64-bit depends on the PDC capabilities bit.
Can anyone offhand confirm/deny?

BTW, though the C240 has a PA2.0 CPU (ergo 64-bit capable), I'm not sure
rbrad has been able to resolve all the issues when trying to run 64-bit
kernels on his C200. He did resolve many of them - including support
for 32-bit PDC calls from 64-bit kernels.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
