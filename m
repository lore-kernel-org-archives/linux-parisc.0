Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 03121482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Jul 2003 07:21:48 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19XL4s-0000IC-UO; Tue, 01 Jul 2003 14:21:46 +0100
Date: Tue, 1 Jul 2003 14:21:46 +0100
From: Matthew Wilcox <willy@debian.org>
To: Mark Mestdagh <Mark.Mestdagh@Icon-Europe.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel compilation for J5600
Message-ID: <20030701132146.GD23597@parcelfarce.linux.theplanet.co.uk>
References: <20030630165053.GF14971@dsl2.external.hp.com> <HOEDKHACIIOGKPMMFMCGKEKDCOAA.Mark.Mestdagh@Icon-Europe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <HOEDKHACIIOGKPMMFMCGKEKDCOAA.Mark.Mestdagh@Icon-Europe.com>
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

On Tue, Jul 01, 2003 at 10:10:24AM +0200, Mark Mestdagh wrote:
> Grant & others
> 
> thanks already for the support. One little problem though is setting up the
> CDROM. I followed the settings like the c3000 kernel but still I get a
> problem while compiling:
> 
> drivers/ide/idedriver.o(.text.probe_hwif+0xfc): undefined reference to
> `local_irq_set'

This is 2.4.21-pa1?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
