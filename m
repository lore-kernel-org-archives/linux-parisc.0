Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA10307
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 18:44:00 -0700
To: Kailashnath V Rampure <kailasr@webcash.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot command 
In-Reply-To: Message from Kailashnath V Rampure <kailasr@webcash.com>
   of "Thu, 02 Nov 2000 17:29:19 PST." <5.0.0.25.0.20001102172521.02ac5e40@mail.webcash.com>
References: <5.0.0.25.0.20001102172521.02ac5e40@mail.webcash.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 02 Nov 2000 18:47:33 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001103014733.4D08337C9F@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Kailashnath V Rampure writes...

> Hi,
> I have run the following command to initialize the sda harddisk. The sda3 
> is the linux native partion.
> Wen I say boot on the HP server  it is trying to boot from /stand/vmunix 
> instead of vmlinux can any one help me about the command.

This means that you are somehow still booting an HP-UX lifimage. Did you 
follow the directions on,

http://www.thepuffingroup.com/parisc/install.html

including the partitioning stuff? Maybe you're still booting off another disk, 
are you sure you're booting from the linux disk?

HTH,

-- 
Matt Taggart
taggart@fc.hp.com
