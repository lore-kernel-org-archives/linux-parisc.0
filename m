Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA20661
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Oct 2000 12:10:10 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 24 Oct 2000 18:11:36 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 24 Oct 2000 18:11:36 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <39F5D25F.DC7CA3DD@linuxcare.com>
Date: Tue, 24 Oct 2000 14:18:07 -0400
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: Sandy Harris <sandy@storm.ca>
CC: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Support for(E)ISA ?
References: <39F5B4E6.E85B9357@deathsdoor.com> <39F5B666.EDC5581F@storm.ca>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Sandy Harris wrote:
> "M. Grabert" wrote:
> > hello there,
> > i wonder if there is support for the (E)ISA bus or if it is planned (for
> > the near future/at all).
> Good question. I'd like to use a 3Com 3c579 ethernet card in my 715.

For EISA to work, Linux needs WAX support, and I don't think there is
any yet because of a lack of documentation.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
