Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1500F4840
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 Oct 2003 11:24:20 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali)
	id 1A7eWQ-0008ET-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 09 Oct 2003 19:24:18 +0200
Date: Thu, 9 Oct 2003 19:24:16 +0200
Message-ID: <3F5CC41F000105EE@ocpmta3.freegates.net>
In-Reply-To: <20031009140021.9199A4941DC@palinux.hppa>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 willy
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Matthew,

Sorry but it doesn't help yet to boot the b2k model (always same symptom)
Or do i lost something and should I have to wait for a 32bits_defconfig?

Thanks in advance for additional advise,
Joel

>-- Original Message --
>To: parisc-linux-cvs@lists.parisc-linux.org
>Reply-To: parisc-linux@lists.parisc-linux.org
>From: willy@parisc-linux.org (Matthew Wilcox)
>Date: Thu,  9 Oct 2003 08:00:21 -0600 (MDT)
>Subject: [parisc-linux-cvs] linux-2.6 willy
>
>
>CVSROOT:	/var/cvs
Module name:	linux-2.6
Changes by:	willy	03/10/09 08:00:21

Modified files:
	drivers/serial : 8250.c 8250_gsc.c 

Log message:
Register the serial console from the GSC driver, not just from SuckyIO.
Add a guard to prevent reg
>stering the serial console twice.

_______________________________________________
parisc-linux-cvs mailing list
parisc-linux-cvs@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux-cvs



-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
