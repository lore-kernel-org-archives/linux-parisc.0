Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA28894
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Jun 1999 08:47:21 -0600
Date: Thu, 10 Jun 1999 16:48:01 +0200 (CEST)
From: Fredrik Soderblom <frso@hp.se>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
cc: Tor Arntsen <tor@spacetec.no>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trying to get HP-UX working
In-Reply-To: <E10rq7u-0000km-00@the-village.bc.nu>
Message-ID: <Pine.LNX.4.10.9906101645360.2117-100000@rasande>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 9 Jun 1999, Alan Cox wrote:

> I can't however get HP/UX to set up an interface 
> 
> 	194.168.151.23 netmask 255.255.255.224

You'll need to tell it to allow for subnet zero (RFC1878)

on pre 11.x:

# nettune -s ip_check_subnet_addr 0

on 11.x:

# ndd -set /dev/ip ip_check_subnet_addr 0

--
Fredrik Soderblom, Sr Technical Consultant
Phone: (int) +46-8-4442140, Fax: (int) +46-8-4442447
Internet: fredrik.soderblom@hp.se, URL: http://people.hp.se/frso
Hewlett-Packard Sverige AB, Box 19, S-164 93 Kista, Sweden
PGPprint: AE 74 BF 05 24 C3 18 99  33 9D A6 18 96 03 8A 29
