Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA20687
	for <parisc-linux@puffin.external.hp.com>; Tue, 27 Jul 1999 09:12:10 -0600
Date: Tue, 27 Jul 1999 11:14:50 -0400 (EDT)
From: "mgalgoci@redhat.com" <mgalgoci@redhat.com>
To: valery brasseur <vbrasseur@atos-group.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] howto boot test kernel
In-Reply-To: <379DA5BF.1B620A9E@atos-group.com>
Message-ID: <Pine.LNX.4.10.9907271109070.6864-100000@skuzzlebutt.support.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>



Here is how I did it:

	1) Uncomment tftp in /etc/inetd.conf

	2) Grab the kernel image and put it in /tftpboot

	3) Set up a bootp server that also specifes the name of the 
	kernel image to boot. To do this, I used dhcpd and used the
	dynamic-bootp modifier in the config file.

I also had to re-build dhcpd. It would not work on my system running the 
2.3.10 kernel.

But it worked ;)

--Matt

On Tue, 27 Jul 1999, valery brasseur wrote:

> I have on old 712, I would like to make a try to linux kernel.
> What did I need and how to setup things for booting the kernel, and
> maybe giving some help on developpment.( I have other stations/server
> under HPUX 10.20 where I can put a developement env?)
> 
> Thanks in advance.
> 
> -- 
> Valery BRASSEUR                | Phone # +33 320 60 7982 
> Atos Branche Multimedia        | Fax   # +33 320 60 7649
> 
> Hi! I'm a .signature virus! Copy me into your ~/.signature to help me
> spread!
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
