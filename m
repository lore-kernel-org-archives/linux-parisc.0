Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA05579
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Sep 1999 08:58:14 -0600
Message-ID: <19990929145815.16475.rocketmail@web505.yahoomail.com>
Date: Wed, 29 Sep 1999 07:58:15 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] Booting from tape 
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

thanks for all the tips. dd-ing with bs=2k made the
difference. The kernel now also boots from a SCSI DDS
tape drive (HP35480A). My first thought was to choose
the disk sector size 512 but this was wrong.

Ulrich

--- Grant Grundler <grundler@cup.hp.com> wrote:
> Ulrich Strelow wrote:
> > I know that this is extremely low priority but...
> > 
> > I have tried to boot the linux kernel from a SCSI
> DDS
> > tape (copied via dd if=Image of=/dev/rmt/0m
> bs=512).
> > The same kernel (cvs tree from today) boots
> > sucessfully via rbootd on my 715/33. Here is the
> > console log:
> ...
> > Select from menu: b p2
> > 
> > Trying scsi.0.0
> > Boot path initialized.
> > Attempting to load IPL.
> > 
> > Failed I/O operation with scsi.0.0
> > ENTRY_IO status = -10
> > 
> > 00000000 00000000 00000000 00000000 00000000
> 00000000
> > 00000000 00000000
> > 00000000 00000000 00000000 00000000 00000000
> 00000000
> > 00000000 00000000
> > 00004F04 000000FF FF0009BF 00000000 800100DC
> 00000000
> > 0025F000 00000400
> > 98080000 00000000 00008C60 00000000 000000FF
> 00000000
> > 00000000 00000000
> 
> I believe this is a problem with either how the tape
> was created
> or talking to the tape drive. Does anyone know where
> to find what
> the -10 status means?
> 
> Another difference when booting from tape (vs disk),
> is how the
> tape is "made". One *must* specify 2k block size. It
> doesn't matter
> for disk devices. Eg: 
> 
> 	dd if=Image of=/dev/rmt/0m bs=2k
> 
> I don't know if Image is intentionally padded to a
> 2k block size.
> One might check that too.
> 
> grant
> 
> 
> Grant Grundler
> Communications Infrastructure Computer Operations
> +1.408.447.7253
> 
>
---------------------------------------------------------------------------
> To unsubscribe: send e-mail to
> parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 

__________________________________________________
Do You Yahoo!?
Bid and sell for free at http://auctions.yahoo.com
