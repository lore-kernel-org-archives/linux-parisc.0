Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA03185
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Sep 1999 15:00:34 -0600
Sender: frowand@cup.hp.com
Message-ID: <37F1271B.52A2@cup.hp.com>
Date: Tue, 28 Sep 1999 13:37:47 -0700
From: Frank Rowand <frowand@cup.hp.com>
MIME-Version: 1.0
To: Kirk Bresniker <kirkb@chrome.rose.hp.com>
CC: grundler@cup.hp.com, ulrich_strelow@yahoo.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting from tape
References: <199909281728.KAA14093@chrome.rose.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Kirk Bresniker wrote:
> 
> | > Attempting to load IPL.
> | >
> | > Failed I/O operation with scsi.0.0
> | > ENTRY_IO status = -10
> | >
> | > 00000000 00000000 00000000 00000000 00000000 00000000
> | > 00000000 00000000
> | > 00000000 00000000 00000000 00000000 00000000 00000000
> | > 00000000 00000000
> | > 00004F04 000000FF FF0009BF 00000000 800100DC 00000000
> | > 0025F000 00000400
> | > 98080000 00000000 00008C60 00000000 000000FF 00000000
> | > 00000000 00000000
> |
> | I believe this is a problem with either how the tape was created
> | or talking to the tape drive. Does anyone know where to find what
> | the -10 status means?
> 
> >From the firmware comments:
> 
> /* RETURNS:
> /*
> /*   3   :  EOF Encountered ( Sequential Device only)
> /*   2   :  Recoverable error
> /*   1   : Inexact I/O Transfer
> /*   0   : OK
> /*   -2  : Non Existant Option.
> /*   -3  : Cannot complete call without error
> /*   -4  : Unrecoverable Hardware Error
> /*   -6  : Illegal Device Address
> /*   -7  : Non Existant Device
> /*   -8  : Module/Device not ready
> /*   -10 : Invalid Argument ( Invalid SCSI ID or LUN )
> /*   -12 : Unsupported Record Size
> /*   -14 : Illegal Device block Size
> 
> KMB

And for future reference to save Kirk from having to look at his
source code...

The IO ACD is at

  http://dtf.external.hp.com/dtf/swdev/pdf/iodc.pdf

The Entry_IO errors are on page 42 of the PDC (document p. 3-40).

-Frank Rowand
