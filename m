Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA09486
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 10:35:29 -0700
Message-Id: <200011281737.MAA24142@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Include trouble
To: alan@linuxcare.com.au (Alan Modra)
Date: Tue, 28 Nov 2000 12:37:28 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: marteaut@esiee.fr, parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0011282016040.18407-100000@front.linuxcare.com.au> from "Alan Modra" at Nov 28, 2000 08:19:20 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Tue, 28 Nov 2000, Alan Modra wrote:
> 
> > As far as I understand, gcc's cpp has a built-in definition of size_t,
> > __SIZE_TYPE__, and it ultimately gets it's idea of the definition from the
> > kernel includes on the machine where gcc was compiled.  ie. recompile gcc
> > with the new kernel headers installed, and the problem should go away.
> 
> No, that's wrong.  __SIZE_TYPE__ comes from `#define SIZE_TYPE' in
> gcc/config/pa/pa-linux{,64}.h  I'll check in a patch to gcc in a few
> moments.

Hmm.  Most 32 bit systems use "unsigned int" rather than "unsigned long".
Using "unsigned long" might cause problems with packages like libio.
I know there is a problem if off_t is not the same as size_t.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
