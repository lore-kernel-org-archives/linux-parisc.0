Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA02346
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Sep 1999 12:14:22 -0600
Date: Tue, 28 Sep 1999 21:07:54 +0300 (EEST)
From: Tom Javen <tomja@InnoTrac.fi>
To: Grant Grundler <grundler@cup.hp.com>
cc: Ulrich Strelow <ulrich_strelow@yahoo.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting from tape 
In-Reply-To: <199909281619.JAA05140@milano.cup.hp.com>
Message-ID: <Pine.LNX.3.96.990928210234.23552A-100000@data.innotrac.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 28 Sep 1999, Grant Grundler wrote:

> Ulrich Strelow wrote:
> > I know that this is extremely low priority but...
> > 
> > I have tried to boot the linux kernel from a SCSI DDS
> > tape (copied via dd if=Image of=/dev/rmt/0m bs=512).
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
> > 00000000 00000000 00000000 00000000 00000000 00000000
> > 00000000 00000000
> > 00000000 00000000 00000000 00000000 00000000 00000000
> > 00000000 00000000
> > 00004F04 000000FF FF0009BF 00000000 800100DC 00000000
> > 0025F000 00000400
> > 98080000 00000000 00008C60 00000000 000000FF 00000000
> > 00000000 00000000
> 
> I believe this is a problem with either how the tape was created
> or talking to the tape drive. Does anyone know where to find what
> the -10 status means?
> 
> Another difference when booting from tape (vs disk), is how the
> tape is "made". One *must* specify 2k block size. It doesn't matter
> for disk devices. Eg: 
> 
> 	dd if=Image of=/dev/rmt/0m bs=2k
If I remember correctly the utah sources mkboot program has a comment that
says the file should be an odd number of 1k blocks. It has a -t option for
making tape files. 


Tom
-- 
=============================+===========================
Tom Javen                    |   Innotrac Diagnostics Oy
email tom.javen@innotrac.fi  |   Finland
gsm   +358-40-5860532        |   phone +358-2-2410025
                             |   fax   +358-2-2410024
=============================+===========================
     
