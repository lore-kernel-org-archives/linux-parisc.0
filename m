Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA12125
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jul 1999 20:05:07 -0600
Sender: adevries@thepuffingroup.com
Message-ID: <378409D7.6EF60AD8@thepuffingroup.com>
Date: Wed, 07 Jul 1999 22:15:51 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] vmlinux in C360
References: <Pine.HPX.4.05.9907071255560.20278-100000@gamgee.ntc.nokia.com> <3783D440.A546BAAC@ruhr-uni-bochum.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Helge Deller wrote:
> 
> Hi !
> 
> Only a little idea, but you could try to set the Boot-Offset for the loaded
> Image in the
> arch/parisc/Makefile from 0x10000 to 0x12000 or higher....
> It could be, that we overwrite the PDC & IO-Structures from the BIOS...
> I think I read something about that in the other parisc-ports.....
> 

Is there any reason not to bump that up to 0x12000 ? 

- A

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
