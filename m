Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E9844834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jun 2003 14:34:47 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h5BKWXRQ003231;
	Wed, 11 Jun 2003 21:32:34 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h5BKWWka003229;
	Wed, 11 Jun 2003 21:32:32 +0100
Subject: Re: [parisc-linux] palo II
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Stian =?ISO-8859-1?Q?S=F8iland?= <stian@soiland.no>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030611203145.GB30555@itea.ntnu.no>
References: <3ED4C8B600004A2B@ocpmta1.freegates.net>
	 <20030611175110.GE28581@parcelfarce.linux.theplanet.co.uk>
	 <20030611203145.GB30555@itea.ntnu.no>
Content-Type: text/plain
Message-Id: <1055363548.2419.41.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 11 Jun 2003 21:32:32 +0100
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

> Joel gave a perfect example of when devfs would come of perfect use,
> variation of scsi devices fucks up "sdb", "sdc" and so on. 

Seperate the theory from the implementation. The implementation has real
problems. The theory has permission management problems

Dell have a nice little app that generates the right symlinks by device
all in user space
