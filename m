Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA00828
	for <parisc-linux@puffin.external.hp.com>; Fri, 27 Oct 2000 16:00:19 -0600
Message-Id: <5.0.0.25.0.20001027145806.037c89e0@mail.webcash.com>
Date: Fri, 27 Oct 2000 14:58:25 -0700
To: Matt Taggart <taggart@carmen.fc.hp.com>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] glibc problem 
Cc: deller@gmx.de, parisc-linux@thepuffingroup.com
In-Reply-To: <20001027214152.F259D38137@carmen.fc.hp.com>
References: <Message from Kailashnath V Rampure <kailasr@webcash.com>
 <5.0.0.25.0.20001027131913.00a57090@mail.webcash.com>
 <Your message of "Thu, 26 Oct 2000 14:37:20 PDT."  <5.0.0.25.0.20001026142948.00a3deb0@mail.webcash.com>
 <Message from  Kailashnath V Rampure <kailasr@webcash.com>
 <5.0.0.25.0.20001026125217.00a43eb0@mail.webcash.com>
 <5.0.0.25.0.20001025173830.00a64a30@mail.webcash.com>
 <5.0.0.25.0.20001026125217.00a43eb0@mail.webcash.com>
 <5.0.0.25.0.20001026142948.00a3deb0@mail.webcash.com>
 <5.0.0.25.0.20001027131913.00a57090@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

The inetd.conf is as follows

tftp    dgram   udp     wait    root    /usr/sbin/tcpd  in.tftpd /tftpboot
bootps  dgram   udp     wait    root    /usr/sbin/tcpd  bootpd


At 03:41 PM 10/27/00 -0600, Matt Taggart wrote:

>Kailashnath V Rampure writes...
>
> > But when I type bo lan at HP server Iget the following error
>
>Do you have tftp installed and working? It usually runs via inetd. Here's 
>what
>I have in /etc/inetd.conf on my Debian box,
>
>tftp  dgram  udp  wait  nobody  /usr/sbin/tcpd  /usr/sbin/in.tftpd /boot
>/tftpboot
>
>--
>Matt Taggart
>taggart@fc.hp.com
