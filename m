Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA04269
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Feb 2000 09:43:33 -0700
Received: from linuxcare.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id KAA04291;
	Tue, 29 Feb 2000 10:53:06 -0500
Sender: adevries@thepuffingroup.com
Message-ID: <38BBEB61.772FBF6D@linuxcare.com>
Date: Tue, 29 Feb 2000 10:53:05 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: mike_clapper@hp.com
CC: gyula_matics@hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] zalon
References: <H00007e30ee94932@MHS>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

mike_clapper@hp.com wrote:
> 
> I believe Zalon is the chip that drives the f/w scsi on the core io card
> in K series and possible others.

Zalon is really just some glue so you can interface some PC-like
controller chips with GSC.  I think it handles interrupts in a parisc
fashion.

We have no docs, and the only reason I know this is that a little birdy
told me.

- Alex


-- 
Alex deVries, Director of Professional Services, The Puffins at
Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
