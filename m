Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA19489
	for <parisc-linux@puffin.external.hp.com>; Fri, 16 Jul 1999 09:09:12 -0600
Received: from postal.sr.hp.com (root@postal.sr.hp.com [15.4.46.173])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id LAA26095
	for <parisc-linux@thepuffingroup.com>; Fri, 16 Jul 1999 11:09:29 -0400 (EDT)
Received: from meow.sr.hp.com (billk@meow.sr.hp.com [15.8.162.83]) by postal.sr.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0) id IAA24247 for <parisc-linux@thepuffingroup.com>; Fri, 16 Jul 1999 08:08:44 -0700 (PDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id IAA21510 for parisc-linux@thepuffingroup.com; Fri, 16 Jul 1999 08:09:45 -0700 (PDT)
Message-Id: <199907161509.IAA21510@meow.sr.hp.com>
Subject: Re: [parisc-linux] 715/33 experience and one question (fwd)
To: parisc-linux@thepuffingroup.com
Date: Fri, 16 Jul 1999 08:09:44 -0700 (PDT)
From: Bill Katz <billk@sr.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

|> And then my question:
|> I think the 715/33 does  not  have a Dino or a Lasi chip (am I right?), but
|>  does it have a gecko (and what is this?)?
|
|I think it has a lasi-chip...
|I don't know until now what gecko is.... (isn't it the same as lasi??).
|

The 715/33 does NOT have either LASI or DINO.  It uses an older 
I/O chip known as ASP.  ASP connects the processor bus to several 
external chips, including the NCR 53c710, Intel LAN and WD 16C552 (?
I'm doing this from memory) 2-serial/parallel chip.  It uses the PA7100
CPU which does not have GSC.

"Gecko" is the codename for the 712. The 715/33 has nothing to do
with Gecko.  Later 715s (/64, /80, and /100) ARE very similar to 
Gecko, and use the PA7100LC/LASI chipset (but not DINO).


	-Bill
