Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A9BC8482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 09:39:16 -0700 (MST)
Message-Id: <200111121634.JAA24960@puffin.external.hp.com>
To: raffo@neuronet.pitt.edu
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Current kernel from CVS does not build. 
In-Reply-To: Message from Rafael Herrera <vze26vn8@verizon.net>
   of "Sun, 11 Nov 2001 20:40:44 EST." <3BEF289C.1020205@verizon.net>
Date: Mon, 12 Nov 2001 09:34:58 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Rafael Herrera wrote:
> I tried to update the sources with the latest CVS version, but the 
> compilation failed. The file */arch/parisc/kernel/pdc_cons.c and 
> */kernel/printk.c have a conflict. The variable log_size used in 
> pdc_cons.c is not defined in printk.c. The kernel does not build.

The merge to 2.4.14 isn't finished yet.
Despite working around the log_size issue, it still doesn't boot.

Watch the parisc-linux-cvs mailing list for progress on this.
We'll probably post an "It works" msg here too.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
