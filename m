Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4F9D4843
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 10:20:52 -0700 (MST)
Date: Tue, 27 Jan 2004 10:20:51 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Naresh Kumar <knaresh@india.hp.com>
Subject: Re: [parisc-linux] Using PAT_IO calls for PCI config space reads and
	writes.
Message-ID: <20040127172051.GA28476@colo.lackof.org>
References: <401623CA.59AE3CCD@india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <401623CA.59AE3CCD@india.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Jan 27, 2004 at 02:09:38PM +0530, Naresh Kumar wrote:
> When I was trying to bring up PA-Linux-2.4 on some of the newer boxes, I
> discovered that reads/writes from the PCI config space were failing (

Naresh,
Awesome!
Thanks for pulling this together and sending it out.

...
> have been made to three files:
> 
> 1. arch/parisc/kernel/firmware.c - Rev 1.47
> 2. arch/parisc/kernel/lba_pci.c - Rev 1.54
> 3. include/asm-parisc/pdc.h - Rev 1.48
> 
> Kindly let me know your comments:
> 
> --------------------START------------------------------------------------------------------------------
> 
> --- lba_pci.c.1.54       Fri Jan 23 15:47:41 2004
> +++ lba_pci.c.modified   Fri Jan 23 15:53:15 2004

The diff should apply with:
	cd /usr/src/linux-2.4; patch -p1 < ~/diff-2.4-PAT_CFG

This patch doesn't do that or even come close.
Can you send a new patch generated with:
	cd /usr/src/linux-2.4 ; cvs diff -uNp  > ~/diff-2.4-PAT_CFG

thanks,
grant
