Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA24832
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 15:14:12 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 15 Jan 2001 22:17:53 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14IHwj-0007Z0-00; Mon, 15 Jan 2001 22:17:49 +0000
Date: Mon, 15 Jan 2001 22:17:49 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Aleksandr Konstantinov <sanjak@tipas.lt>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100
Message-ID: <20010115221749.A28689@parcelfarce.linux.theplanet.co.uk>
References: <3A636BE1.EE2DBF87@tipas.lt>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A636BE1.EE2DBF87@tipas.lt>; from sanjak@tipas.lt on Mon, Jan 15, 2001 at 10:30:09PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 15, 2001 at 10:30:09PM +0100, Aleksandr Konstantinov wrote:
> Can anybody explain me how to get console NOT on serial link ?

activate CONFIG_STI and use `console=tty0' instead of `console=ttyS0'.
this should be done for you automatically by palo when you set CONFIG_STI.

-- 
Revolutions do not require corporate support.
