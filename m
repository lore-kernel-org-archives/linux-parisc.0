Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A9964829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Apr 2003 10:52:44 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h3FFsZRN028370;
	Tue, 15 Apr 2003 16:54:36 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h3FFsXRj028368;
	Tue, 15 Apr 2003 16:54:33 +0100
Subject: Re: [parisc-linux] parisc-linux.org kernel
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E9BA3670000071C@ocpmta1.freegates.net>
References: <3E9BA3670000071C@ocpmta1.freegates.net>
Content-Type: text/plain
Message-Id: <1050422072.27744.67.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 15 Apr 2003 16:54:32 +0100
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

On Maw, 2003-04-15 at 17:32, Joel Soete wrote:

> >ide_get_legacy(int n) [n=0/1] for interfaces.
> 
> And so I still have to add 
> #if defined(CONFIG_SUPERIO)
> #    define ide_get_legacy(x) superio_get_ide_irq()
> #else
> #    define ide_get_legacy(x) ... (still have to find what)
> #endif

What do you need to know if the legacy irq is to come from superio.
Should be we be asking ide_get_legacy(struct pci_device *pdev) ?

I just want to understand this so I (or you) do it right
