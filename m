Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA16465
	for <parisc-linux@puffin.external.hp.com>; Fri, 4 Jun 1999 09:59:28 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.13.185.124])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id LAA01174
	for <parisc-linux@thepuffingroup.com>; Fri, 4 Jun 1999 11:58:54 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id IAA15155 for <parisc-linux@thepuffingroup.com>; Fri, 4 Jun 1999 08:54:42 -0700 (PDT)
Message-Id: <199906041554.IAA15155@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Lasi and Dino documentation! 
In-reply-to: Your message of "Fri, 04 Jun 1999 00:15:40 PDT."
             <Pine.LNX.3.96.990604000644.16726A-100000@devserv.devel.redhat.com>
Date: Fri, 04 Jun 1999 08:54:37 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> I'm very happy to announce HP's release of the two pricipal device
> controller chips inside the A180C, Dino and Lasi. 

Alright! (now I can talk about them!)

> Dino is the GSC to PCI bridge found on the A180C,

Also found on B, C, and J-class machines.
Newer B/C  (eg C200+) class have built-in PCI LAN/SCSI below GSCtoPCI.
So support is required to boot from built-in devices.

Also found on several networking HSC cards. Aka "Card-mode Dino".
Can be found in D, K and T-class. (eg. Dual Port HSC 100BT)

I'm very familiar with how this chip works and will try
to answer questions in my spare time.

grant

>Lasi is the
> SCSI/Lan/Parallel/Serial/RTC/PS2/floppy controller that's also found in
> the 712.
> You can find links for them on our documentation page,
>
> http://www.thepuffingroup.com/parisc/documentation.html.
> 
> I've only scanned the docs, but they look quite complete at this point.
> 
> A big fat thanks is owed to John Sontag and all the others from HP who
> worked to get this documentation released. Releasing documentation that
> until now has been privately held is more proof that HP is committed to
> helping us with this port.
> 
> - alex
> 
> -- 
> Alex deVries <puffin@redhat.com>     
> Red Hat Contrib Net maintainer          
> Ottawa, Canada  
> PA RISC Linux Porting Team
> 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
