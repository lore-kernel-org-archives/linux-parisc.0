Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA03871
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Aug 2000 04:28:34 -0600
Received: from unknown (HELO rhirst.linuxcare.com) (158.43.17.94)
  by mailserv2.iuinc.com with SMTP; 29 Aug 2000 10:28:36 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 73694B005; Tue, 29 Aug 2000 11:28:51 +0100 (BST)
Date: Tue, 29 Aug 2000 11:28:51 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Craig Miller <craig.miller@bigfoot.com>
Cc: PARISC-L <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] HP 735/125 hangs w/latest kernel
Message-ID: <20000829112851.A1105@linuxcare.com>
References: <000e01c010bf$e6166840$8391a140@spatialminds.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000e01c010bf$e6166840$8391a140@spatialminds.com>; from craig.miller@bigfoot.com on Mon, Aug 28, 2000 at 12:16:34AM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Aug 28, 2000 at 12:16:34AM -0700, Craig Miller wrote:
> In the interest of providing useful feedback:
> 
> My HP 735/125 box hangs when booting the demo CD.  It gets to
> 
> ...
> ASP version 20 at oxf08000000 found.
> request_irq(250, c01ec76c, 0x0, asp, c4ff5080) 

My 715/75 hangs there if CONFIG_PARPORT_GSC is enabled.  Don't know if that
was turned on on the CD kernel, but it probably was (defaults to on).

Richard
