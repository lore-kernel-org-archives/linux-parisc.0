Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2E4F482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jan 2002 09:17:15 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16RFDx-0000po-00; Thu, 17 Jan 2002 16:17:09 +0000
Date: Thu, 17 Jan 2002 16:17:09 +0000
From: Matthew Wilcox <willy@debian.org>
To: Alexandre April <aapril@galeasec.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] irq vs smp
Message-ID: <20020117161709.B30060@parcelfarce.linux.theplanet.co.uk>
References: <LLENLJGPDFAGGGBLOAHKCEBLCFAA.aapril@galeasec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <LLENLJGPDFAGGGBLOAHKCEBLCFAA.aapril@galeasec.com>; from aapril@galeasec.com on Thu, Jan 17, 2002 at 11:02:31AM -0500
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

On Thu, Jan 17, 2002 at 11:02:31AM -0500, Alexandre April wrote:
> 
> 	I'm developping a char driver for one of our PCI card in linux kernel
> 2.4.2-2smp (Multi-processor). And the IRQ that I read from my pci config
> space is 0x7 but the one that the kernel sees when I do "lspci -v" is 0x27.
> Is there a way the pass from 0x7 to 0x27 using some kernel macro's.

you shouldn't read the irq directly from config space.  this is all done
for you by the pci support code.  use the ->irq member of struct pci_dev
instead.

-- 
Revolutions do not require corporate support.
