Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA02089
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Sep 1999 11:28:11 -0600
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <199909281728.KAA14093@chrome.rose.hp.com>
Subject: Re: [parisc-linux] Booting from tape 
To: grundler@cup.hp.com
Date: Tue, 28 Sep 1999 10:28:46 PDT
Cc: ulrich_strelow@yahoo.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199909281619.JAA05140@milano.cup.hp.com>; from "Grant Grundler" at Sep 28, 99 9:19 am
List-ID: <linux-parisc.vger.kernel.org>



| > Attempting to load IPL.
| > 
| > Failed I/O operation with scsi.0.0
| > ENTRY_IO status = -10
| > 
| > 00000000 00000000 00000000 00000000 00000000 00000000
| > 00000000 00000000
| > 00000000 00000000 00000000 00000000 00000000 00000000
| > 00000000 00000000
| > 00004F04 000000FF FF0009BF 00000000 800100DC 00000000
| > 0025F000 00000400
| > 98080000 00000000 00008C60 00000000 000000FF 00000000
| > 00000000 00000000
| 
| I believe this is a problem with either how the tape was created
| or talking to the tape drive. Does anyone know where to find what
| the -10 status means?
