Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 960284829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 06:04:10 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h3GB64RN029654;
	Wed, 16 Apr 2003 12:06:05 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h3GB63Vn029652;
	Wed, 16 Apr 2003 12:06:03 +0100
Subject: Re: [parisc-linux] parisc-linux.org kernel
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E9BA3A600000AF6@ocpmta2.freegates.net>
References: <3E9BA3A600000AF6@ocpmta2.freegates.net>
Content-Type: text/plain
Message-Id: <1050491162.28727.24.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 16 Apr 2003 12:06:03 +0100
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

On Mer, 2003-04-16 at 11:13, Joel Soete wrote:
> If I well understand the question: nothing because superio_get_ide_irq()
> is defined in arch/parisc/kernel/superio.c as:
> >Should be we be asking ide_get_legacy(struct pci_device *pdev) ?
> 
> IMHO it would be difficult this way; what do you thing?

Ok so some people need to know the device, some the legacy (0/1) and
some nothing at all. I guess I pass both 8)
