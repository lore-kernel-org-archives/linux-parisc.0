Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95041482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Dec 2002 10:24:55 -0700 (MST)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5) with ESMTP id gBGI4RlQ014528;
	Mon, 16 Dec 2002 18:04:28 GMT
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5/Submit) id gBGI4QpW014526;
	Mon, 16 Dec 2002 18:04:26 GMT
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3DED9BF500001EC5@ocpmta8.freegates.net>
References: <3DED9BF500001EC5@ocpmta8.freegates.net>
Content-Type: text/plain
Date: 16 Dec 2002 18:04:26 +0000
Message-Id: <1040061866.13786.74.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
Subject: [parisc-linux] Re: YA pb with PCI IDE (my merge 2.4.21-pre1)
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

On Mon, 2002-12-16 at 17:06, jsoe0708@tiscali.be wrote:
> Hi Alan,
> 
> Worried about ext3 pb, I try to merge parisc kernel 2.4.20-pa14 with 2.4.21-pre1.
> This merge seems to works fine on a b180l+ (without pci devices).
> But still boot twice (??) and crash on a b2k with an ide cdrom.

I've sent the PCI fixup patch to linux-kernel. Depending upon how the
PA-RISC system interfaces to the IDE controller you may also need
platform specific fixups or to drop the chip into Native mode.

Someone at HP can probably answer that bit
