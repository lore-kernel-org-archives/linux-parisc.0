Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5AAA4851
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Jun 2001 15:07:48 -0600 (MDT)
Message-Id: <200106052059.OAA20922@puffin.external.hp.com>
To: djweis@sjdjweis.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] D310 boot messages 
In-Reply-To: Your message of "Tue, 05 Jun 2001 10:53:50 CDT."
             <Pine.LNX.4.21.0106051051070.22868-100000@oliver.internal.sjdjweis.com>
Date: Tue, 05 Jun 2001 14:59:42 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

djweis@sjdjweis.com wrote:
> 
> Can any of the HP people comment on where the second serial port on a D310
> lives?

	http://216.208.98.4/view.php3?type=machine&name=D310

Says one is on WAX and the other on LASI.
I can't say for sure which is first or second.
Based on console output, one should be able to determine
which is which by comparing the upper bits of the MMIO address
to the address of LASI and WAX.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
