Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA27164
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Oct 2000 12:37:19 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id DF33B5C5
	for <parisc-linux@thepuffingroup.com>; Tue,  3 Oct 2000 11:38:14 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id LAA21139
	for <parisc-linux@thepuffingroup.com>; Tue, 3 Oct 2000 11:42:23 -0700 (PDT)
Message-Id: <200010031842.LAA21139@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: PA-RISC linux cd 
In-reply-to: Your message of "Tue, 03 Oct 2000 08:59:49 PDT."
             <E13gTaF-00046K-00@noam.fc.hp.com>
Date: Tue, 03 Oct 2000 11:42:22 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> 
> Matthew - I can never remember which 715's are supported so I'm passing
> your note to the mailing list.
> 
> Matthew Halliday <matthewh@fesa.co.uk> wrote:
> = I've aquired a 715/33 - minus monitor or keyboard (but I do have a
> = mouse!) - do you know if there anywhere I can get details of these
> = machines or a keyboard and monitor?  I do have an A1097C 19" monitor
> = minus a cable - will that do?

I think the 1097 is a SOG monitor - should work.
You do need a keyboard to use it though.

>  We use a lot of HP kit here, but the HP
> = website doesn't seen to have anything on these machines.  I understand I
> = can get onto them with a serial cable - how do I set that up?

Connect a NULL modem from Serial port 1 to a terminal or linux box and
set it up for 9600N8. *NOT* connecting a keyboard defaults the console
to the serial port.

You should be able to find more help with 715/33 machines by scrounging
through the parisc-linux mail archives.

hope this helps,
grant

> = I'm
> = pretty sure it works ok (I found it in a rubbish skip!) cos when I start
> = it up I get no error beeps, and it all sounds normal.  Sorry to ramble
> = on - if you can't help then that's ok.
> 
> 	-P
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
