Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B270482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Dec 2002 10:40:45 -0700 (MST)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5) with ESMTP id gBGIKFlQ014584;
	Mon, 16 Dec 2002 18:20:16 GMT
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5/Submit) id gBGIKEwX014582;
	Mon, 16 Dec 2002 18:20:14 GMT
Subject: Re: [parisc-linux] Re: YA pb with PCI IDE (my merge 2.4.21-pre1)
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Matthew Wilcox <willy@debian.org>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021216172906.B9994@parcelfarce.linux.theplanet.co.uk>
References: <3DED9BF500001EC5@ocpmta8.freegates.net>
	<1040061866.13786.74.camel@irongate.swansea.linux.org.uk>
	<20021216172906.B9994@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 16 Dec 2002 18:20:13 +0000
Message-Id: <1040062813.13837.79.camel@irongate.swansea.linux.org.uk>
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

On Mon, 2002-12-16 at 17:29, Matthew Wilcox wrote:
> You mean the "IDE but no disks" patch:
> http://www.uwsg.iu.edu/hypermail/linux/kernel/0212.2/0105.html ?
> If so, that might be relevant, but have davem's concerns about this IDE
> code being broken on big-endian machines been addressed?

Platform dependant.

The pre1 code fails if:
	You use the mmio ops not the pio ops on a big endian box (except PPC)
	Your pci_resource_foo() returns a value with the top 32bit used

Both of those are fixed in Marcelo's tree, although platforms may need
to define some functions. Dave has the updated code running on sparc64
