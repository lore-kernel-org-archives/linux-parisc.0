Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.oplnk.net (unknown [216.90.3.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D392482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Apr 2001 15:29:17 -0600 (MDT)
Received: from deskbean (216-90-3-162.dsl.oplnk.net [216.90.3.162])
	by mail.oplnk.net (Postfix) with SMTP id 5155F4E00C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Apr 2001 16:50:11 -0500 (CDT)
Message-ID: <000501c0ce97$cd18ec00$a2035ad8@3beans.com>
Reply-To: "Peter Weatherall" <peter.weatherall@3beans.com>
From: "Peter Weatherall" <peter.weatherall@3beans.com>
To: <parisc-linux@lists.parisc-linux.org>
References: <Pine.LNX.4.21.0104261258350.11174-100000@pilchuck.reedmedia.net> <OE25oryKFRJrzdDW6lC000046f5@hotmail.com> <003401c0ce96$88726af0$a2035ad8@3beans.com>
Date: Thu, 26 Apr 2001 16:28:13 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Dino
List-ID: <linux-parisc.vger.kernel.org>

(I'm reposting this with the correct subject) -


I have a C160. When I boot it , I see the following message -


> start snip >>>>
Dino version 2.1 (bridge mode) found at 0xf1600000


The GSCtoPCI (Dino hrev 1) bus converter found may exhibit
data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.
Systems shipped after Aug 20, 1997 will not exhibit this problem.
Models affected: C180, C160, C160L, B160L, and B132L workstations.
 
dino_bridge_init: IO_ADDR_EN hasn't been configured.
kernel BUG at dino.c:795!
> end snip >>>>>
 
How can I determine if my c160 is affected ? what's this kernel bug at
dino.c all about and is there some Dino documentation available ?
 
Thanks
Peter
