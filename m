Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dhcp23.swansea.linux.org.uk (pc1-cwma1-5-cust4.swan.cable.ntl.com [80.5.120.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98CC048D5
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Aug 2003 16:23:38 -0600 (MDT)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.9/8.12.9) with ESMTP id h7RMMura023653;
	Wed, 27 Aug 2003 23:22:57 +0100
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.9/8.12.9/Submit) id h7RMMsob023651;
	Wed, 27 Aug 2003 23:22:54 +0100
Subject: Re: [parisc-linux] C3000 and IDE DMA support
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: "M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030827214409.GE31311@dsl2.external.hp.com>
References: <Pine.LNX.4.44.0308271731570.14906-100000@sal.ucc.ie>
	 <1062019396.23493.8.camel@dhcp23.swansea.linux.org.uk>
	 <20030827214409.GE31311@dsl2.external.hp.com>
Content-Type: text/plain
Message-Id: <1062022973.23531.45.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 27 Aug 2003 23:22:54 +0100
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

On Mer, 2003-08-27 at 22:44, Grant Grundler wrote:
> c3000 uses sba_iommu.c and AFAIK all DMA goes through the IOMMU.
> Would surprise me if the DMA was bounced/copied.

Nod.. I'm trying to fathom the 3Mbyte/second behaviour while hdparm
claims DMA is on
