Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA09778
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Jan 2000 13:39:43 -0700
Message-Id: <200001042044.MAA16184@milano.cup.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: t.simonnet@esiee.fr (Thierry SIMONNET), parisc-linux@thepuffingroup.com,
        grundler@milano.cup.hp.com
Subject: Re: [parisc-linux] Trouble to generate vmlinux 
In-reply-to: Your message of "Tue, 04 Jan 0100 10:43:06 PST."
             <200001041543.KAA01712@hiauly1.hia.nrc.ca>
Date: Tue, 04 Jan 2000 12:44:22 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"John David Anglin" wrote:
> It looks as if you are trying to do a cross-compile which is not supported.
> Currently, you must build with gcc and HP's ld under hpux 10.20 (or possibly,
> 9.X).

The cross-compile works (or worked). That's my default setup.
I change linux/Makefile with:
	CROSS_COMPILE = parisc-linux-

o only gcc can be used to build kernels.
o "cc" is still needed to generate utilities which run under HP-UX
  (that's HOSTCC in the Makefiles)

"ld" is the exception still because of SOM support. 
But I don't think that's Thierry's problem since the linker
isn't complaining about the object file type...

Which makes me wonder: theirry, what *is* the object file type?
It has to be HP's SOM format. I think the recipe for building
tools includes the changes to do that.

grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253
