Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56BB14877
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Jun 2003 02:03:16 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h5O81FRQ015432;
	Tue, 24 Jun 2003 09:01:16 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h5O81A5J015430;
	Tue, 24 Jun 2003 09:01:10 +0100
Subject: Re: [parisc-linux] Re: ATY RAGE XL progress or Dino gscpci bridge
	pb?[was: Re: HP C180 video card]
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030624034442.GA28169@dsl2.external.hp.com>
References: <03f301c3309e$f0c78740$d908f3d8@uvsolutions>
	 <20030613043356.GA7265@dsl2.external.hp.com> <3EEC9AC2.5070106@tiscali.be>
	 <20030615161948.GA12995@dsl2.external.hp.com> <3EF46AA9.7040703@tiscali.be>
	 <20030623050450.GA449@dsl2.external.hp.com>
	 <20030623111836.GA2620@parcelfarce.linux.theplanet.co.uk>
	 <20030624034442.GA28169@dsl2.external.hp.com>
Content-Type: text/plain
Message-Id: <1056441669.14612.2.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 24 Jun 2003 09:01:10 +0100
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

On Maw, 2003-06-24 at 04:44, Grant Grundler wrote:
> On Mon, Jun 23, 2003 at 12:18:36PM +0100, Matthew Wilcox wrote:
> > x86 typically doesn't need to call pci_enable_device, so people who've
> > never tried their driver on any other box may have missed it.
> 
> Happen to know if that is true for hotplug support?
> ie does x86 requires something like pci_enable_device() for hotplug to work?

Yes
