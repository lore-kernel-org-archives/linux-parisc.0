Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA30850
	for <parisc-linux@puffin.external.hp.com>; Fri, 27 Oct 2000 15:38:42 -0600
To: Kailashnath V Rampure <kailasr@webcash.com>
Cc: deller@gmx.de, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] glibc problem 
In-Reply-To: Message from Kailashnath V Rampure <kailasr@webcash.com>
   of "Fri, 27 Oct 2000 13:37:49 PDT." <5.0.0.25.0.20001027131913.00a57090@mail.webcash.com>
References: <Your message of "Thu, 26 Oct 2000 14:37:20 PDT."
 <5.0.0.25.0.20001026142948.00a3deb0@mail.webcash.com> <Message from
 Kailashnath V Rampure <kailasr@webcash.com> <5.0.0.25.0.20001026125217.00a43eb0@mail.webcash.com> <5.0.0.25.0.20001025173830.00a64a30@mail.webcash.com> <5.0.0.25.0.20001026125217.00a43eb0@mail.webcash.com> <5.0.0.25.0.20001026142948.00a3deb0@mail.webcash.com>  <5.0.0.25.0.20001027131913.00a57090@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 27 Oct 2000 15:41:52 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001027214152.F259D38137@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Kailashnath V Rampure writes...

> But when I type bo lan at HP server Iget the following error

Do you have tftp installed and working? It usually runs via inetd. Here's what 
I have in /etc/inetd.conf on my Debian box,

tftp  dgram  udp  wait  nobody  /usr/sbin/tcpd  /usr/sbin/in.tftpd /boot 
/tftpboot

-- 
Matt Taggart
taggart@fc.hp.com
