Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA24559
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 May 2000 07:54:58 -0600
Received: from [129.250.38.63] (helo=dfw-mmp3.email.verio.net)
	by dfw-smtpout3.email.verio.net with esmtp (Exim 3.12 #7)
	id 12uy6S-0001we-00
	for parisc-linux@thepuffingroup.com; Thu, 25 May 2000 13:55:12 +0000
Received: from users.qual.net ([209.57.253.2])
	by dfw-mmp3.email.verio.net with esmtp (Exim 3.12 #7)
	id 12uy6N-0007Or-00
	for parisc-linux@thepuffingroup.com; Thu, 25 May 2000 13:55:07 +0000
Received: from localhost (sammy@localhost)
	by users.qual.net (8.9.3/8.9.3) with SMTP id JAA24135
	for <parisc-linux@thepuffingroup.com>; Thu, 25 May 2000 09:55:01 -0400 (EDT)
Date: Thu, 25 May 2000 09:55:01 -0400 (EDT)
From: Sam Creasey <sammy@oh.verio.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.GSO.3.96.1000525095354.23825D-100000@users.qual.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Ethernet driver issues....
List-ID: <linux-parisc.vger.kernel.org>


This message appeared on the m68k list today, I've had some of these
issues with the lasi ethernet driver on my 712....  any change with a
newer driver as listed below?


"UN-altered REPRODUCTION and DISSEMINATION of this IMPORTANT
Information is ENCOURAGED, ESPECIALLY to COMPUTER BULLETIN BOARDS."
	-- Robert E. McElwaine



---------- Forwarded message ----------
Date: Thu, 25 May 2000 14:26:45 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: reinhard arlt <reinhard.arlt@t-online.de>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: linux-2.3.99-pre2 on mvme177 (fwd)
Resent-Date: Thu, 25 May 2000 15:28:25 +0200 (MET DST)
Resent-From: linux-m68k@phil.uni-sb.de

> 3. The ethernet driver complains about returning buffers on hard irq
> level. Is this because of the  higher warning level in the driver ?
**> 4. There is a general problem with the ethernet driver, as it starts
**> slowly, with tx timeouts etc.

Pick up 82596.c from an official 2.3.99-pre6 or later; that should
work fine.
