Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA13291
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Jan 2001 03:41:47 -0700
Message-ID: <A4A5E4C468B5D11190220001FA6835DD04DD87A8@EPIXCH003>
From: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
To: "'Karsten Merker'" <karsten@excalibur.cologne.de>
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: RE: C110 - palinux-0.5.iso boot but...
Date: Wed, 10 Jan 2001 11:43:23 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hello Karsten,

Best wishes for new millennium.

> > Regarding the problems with the console code, please also 
> > read the mail I
> > have sent to the PA-RISC mailing list this evening, 
> > eventually this will
> > help you.
> 
> I will have to test but it would be for the new millennium.
> 

Well no more success, I try again with several cvs release (last was dated
20010105) but still display some info on PDC console until "Switching from
PDC console" then if I reconnect a console to the serial port I can login
(same behavior for any model I can test C110, 712 or B180).

What I do find strange anyway: if I try CTRL+ALT+DEL on the keyboard
connected to mother board (i.e. PDC keyboard?) the awaiting reboot is well
launch (except if I apply the patch
http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/12-Dec/0254.ht
ml which also display more on the PDC console but "warning can not initial
console" and go back to serial port console?)

Thanks anyway for information,
	Joel


**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
