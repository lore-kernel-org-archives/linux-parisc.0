Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA324482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Oct 2001 10:25:39 -0600 (MDT)
To: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] Xfree86 failled with -pa57
Message-ID: <1003163134.3bcb0dfe152c5@webmail.tiscalinet.be>
Date: Mon, 15 Oct 2001 18:25:34 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1003154375.3bcaebc713db3@webmail.tiscalinet.be> <20011015164903.X11105@linuxcare.com>
In-Reply-To: <20011015164903.X11105@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hi Richard,

Quoting Richard Hirst <rhirst@linuxcare.com>:

> > (EE) No OS PCI support available
> 
> Do you have PCI support enabled in your kernel?
> 
> Richard
> 
> 
> 
Yes:
CONFIG_PCI=yes
CONFIG_PCI_LBA=yes
CONFIG_PCI_NAMES=yes

As 'make oldconfig' done (answer no yo EISA support: not need; yes for LASI 
53C700 support)

Joel

-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
