Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA11514
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Mar 2000 12:43:42 -0700
Sender: "Matthew Earley" <mearley@nortelnetworks.com>
Message-ID: <38C007C1.5E179C4B@americasm01.nt.com>
Date: Fri, 03 Mar 2000 13:43:13 -0500
From: "Matthew Earley" <mearley@nortelnetworks.com>
MIME-Version: 1.0
To: "Rajiv Dighe" <rdighe@nortelnetworks.com>
CC: parisc-linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Trouble booting 712/80
References: <00e601bf8531$3d7f7c40$4c50fb8d@corpnorth.baynetworks.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"Dighe, Rajiv (R.) [EXCHANGE:CANOI:IO47]" wrote:

>     HP newbie here. I just acquired a 712/80 with 96mb ram & 1gb hdd. I am
> looking forward to helping with linux port effort as soon as I can get HP/UX
> 10.20 installed on this darn machine. so far it refuses t o boot from
> cd-rom. cd-rom is seen as a result of search command issued at boot-admin
> prompt but 'boot scsi.5' just returns me back to boot_admin promt after
> about 5 seconds. boot rom version is 1.6. All I know is that this machine
> was set for netbooting. any ideas?

Is the CD-ROM drive external?  If so, try connecting another device
between the CD-ROM and the scsi port.  I remember something squirelly
about the 712 and the external scsi.

Matt
