Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 288ED482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jul 2001 01:07:34 -0600 (MDT)
Received: from alcatel.at (atusel33.aut.alcatel.at [146.112.129.215])
	by  mail.alcatel.at (8.9.3/8.9.3/1.21 01/27/01 21:43:09) with ESMTP id JAA05331
	for <parisc-linux@lists.parisc-linux.org>; Thu, 5 Jul 2001 09:07:31 +0200 (MET DST)
Sender: christoph.plattner@alcatel.at
Message-ID: <3B441232.44A2B63B@alcatel.at>
Date: Thu, 05 Jul 2001 09:07:30 +0200
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problem in palinux-0.9.1 image with directory "debian" !!
List-ID: <linux-parisc.vger.kernel.org>

I have a problem with the iso image. I have loop back mounted
it on my linux box, and I wanted to tar (copy) it to a location
(NFSROOT) to try a media less installation via rboot/bootp.

But the copy was not possible, as the directory debian
contains recursively the contents of the whole CD !!

Is this correct !

With friendly regards
	Christoph P.


------------------------------------------------------------------
private:  christoph.plattner@gmx.at
company:  christoph.plattner@alcatel.at
