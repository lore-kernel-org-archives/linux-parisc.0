Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 147CA482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Apr 2001 16:12:17 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id AAC1EB007; Thu, 12 Apr 2001 23:12:57 +0100 (BST)
Date: Thu, 12 Apr 2001 23:12:57 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: buffalo bill <buffalo@uranus.solar-system.the7lg.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 710 SCSI & LAN problems
Message-ID: <20010412231257.D11226@linuxcare.com>
References: <01041223044200.22122@venus.solar-system.the7lg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01041223044200.22122@venus.solar-system.the7lg.de>; from buffalo@uranus.solar-system.the7lg.de on Thu, Apr 12, 2001 at 11:04:42PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Apr 12, 2001 at 11:04:42PM +0200, buffalo bill wrote:
> Hi !
> I've tried to get my 710 running with parisc linux.
> I know there are problems with SCSI and LAN, so tried to find out.
> The drivers both fail to call "pci_alloc_consistent()" and use memory from
> __get_free_pages() instead. 
> 
> Could it be that the problem is related to this ?

No, that is expected behaviour on older systems with non-consistent
memory.  The problem appears to be with interrupt routing from the
scsi and lan chips to the cpu, and we don't have the documentation to
resolve that at the moment.

Richard
