Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 587624859
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Dec 2002 17:26:25 -0700 (MST)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5) with ESMTP id gBJ16slQ026975;
	Thu, 19 Dec 2002 01:06:54 GMT
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5/Submit) id gBJ16qZT026973;
	Thu, 19 Dec 2002 01:06:52 GMT
Subject: Re: [parisc-linux] still problems with PCI IDE controller
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Joerg Steindlberger <j@steindlberger.de>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <courier.3E00F419.0000601B@server01>
References: <200212160609.XAA18500@udlkern.fc.hp.com>
	<courier.3E00E3ED.000010DA@server01>
	<20021218212455.GG17944@dsl2.external.hp.com>
	<courier.3E00F419.0000601B@server01>
Content-Type: text/plain
Date: 19 Dec 2002 01:06:52 +0000
Message-Id: <1040260012.26882.4.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
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

On Wed, 2002-12-18 at 22:18, Joerg Steindlberger wrote:
> Okay. I now set hdparm -c 1 /dev/... and hdparm -d 1 /dev/... -- before 
> starting the softwareRAID. The RAID1 is syncing this moment with about 2 
> Mbyte/s. I think I'll stop it now and mount the shorter 80pin cable again and 
> play with some speed settings. My earlier problem with DMA was, that the 
> kernal crashed when setting the CONFIG_IDEDMA_AUTO=y.
> > Nope. IDE is EEEeevil ;^)
> Yes, I know. But what would You pay for two 80 GB disks?

To be fair PIO IDE is evil but UDMA is pretty nice. The big thing
lacking which is slowly coming is TCQ. Given TCQ and SATA hotswap (which
we dont handle at all yet) SCSI is I think rather doomed on the low end.

Alan
