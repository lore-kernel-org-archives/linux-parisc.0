Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA11056
	for <parisc-linux@puffin.external.hp.com>; Thu, 15 Jun 2000 17:44:30 -0600
Received: from boca210a.boca.ssc.siemens.com (boca210a.boca.ssc.siemens.com [135.1.69.210])
	by brmx1.fl.icn.siemens.com (8.9.3/8.9.3) with ESMTP id TAA29382
	for <parisc-linux@thepuffingroup.com>; Thu, 15 Jun 2000 19:44:56 -0400 (EDT)
Message-ID: <2FF13E24F61AD41193130008C791A76031F104@boca215a.boca.ssc.siemens.com>
From: "D'Angelo, James" <James.D'Angelo@icn.siemens.com>
To: parisc-linux@thepuffingroup.com
Date: Thu, 15 Jun 2000 19:42:06 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Booting vmlinux.
List-ID: <linux-parisc.vger.kernel.org>

I've successfully done "make palo" and have followed the directions.  From a
712/80, I am doing a boot lan from the PDC.  My TFTP seems configured fine,
but the only thing I see in my syslog is:

Jun 15 19:28:49 boca08 bootpd[2595]: bootsize=2288612  hp->bootsize=2288612
Jun 15 19:29:15 boca08 tftpd[3765]: Transfer timed out

The 712/PDC just says: Selecting a system to boot.


Any ideas?

Jay D'Angelo
jdangelo@techie.com <mailto:jdangelo@techie.com> 
