Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA01825
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Sep 1999 10:20:42 -0600
Message-Id: <199909281619.JAA05140@milano.cup.hp.com>
To: Ulrich Strelow <ulrich_strelow@yahoo.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting from tape 
In-reply-to: Your message of "Tue, 28 Sep 1999 07:48:46 PDT."
             <19990928144846.10298.rocketmail@send205.yahoomail.com>
Date: Tue, 28 Sep 1999 09:19:28 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ulrich Strelow wrote:
> I know that this is extremely low priority but...
> 
> I have tried to boot the linux kernel from a SCSI DDS
> tape (copied via dd if=Image of=/dev/rmt/0m bs=512).
> The same kernel (cvs tree from today) boots
> sucessfully via rbootd on my 715/33. Here is the
> console log:
...
> Select from menu: b p2
> 
> Trying scsi.0.0
> Boot path initialized.
> Attempting to load IPL.
> 
> Failed I/O operation with scsi.0.0
> ENTRY_IO status = -10
> 
> 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000
> 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000
> 00004F04 000000FF FF0009BF 00000000 800100DC 00000000
> 0025F000 00000400
> 98080000 00000000 00008C60 00000000 000000FF 00000000
> 00000000 00000000

I believe this is a problem with either how the tape was created
or talking to the tape drive. Does anyone know where to find what
the -10 status means?

Another difference when booting from tape (vs disk), is how the
tape is "made". One *must* specify 2k block size. It doesn't matter
for disk devices. Eg: 

	dd if=Image of=/dev/rmt/0m bs=2k

I don't know if Image is intentionally padded to a 2k block size.
One might check that too.

grant


Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
