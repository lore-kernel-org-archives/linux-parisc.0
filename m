Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA02275
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 08:40:46 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 19 Dec 2000 15:43:44 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 19 Dec 2000 15:43:44 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A3F82E0.C0FB63D6@linuxcare.com>
Date: Tue, 19 Dec 2000 10:46:40 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SuckyIO support
References: <20001219094251.A17217@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> Wow, this is a really sucky chip :-)
> 
> OK, here's a first stab at some support for it.  Could someone with a
> B/C/J `thousand' class machine please give it a try, and let me see the
> relevant portions of their bootlog?

I've taken mkp's initial work on superio.c and added some stuff, but in
the end am confused by where we actually get the interrupt number from
the card.  There's no such register in function 1 (where the interrupts
ultimately end up) and both registers on function 0 and 2 return 0,
which I don't think is right.  I'd thought that PDC would have set this
up.  There's not much I can do at this point until we can have some of
Grant's attention.

In the meantime, I'll try booting with all of this on the C3k.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
