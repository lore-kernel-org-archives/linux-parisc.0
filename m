Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA01990
	for <parisc-linux@puffin.external.hp.com>; Sat, 11 Nov 2000 17:02:41 -0700
Date: Sat, 11 Nov 2000 17:04:29 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001111170429.A29140@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] glibc question
List-ID: <linux-parisc.vger.kernel.org>

I'm working with bdale and taggart to try to get the Debian glibc
package to compile under hppa. One of the things I saw today while
playing with this is that the build dies because it tries to link in
bsd-setjmp.c and bsd-_setjmp.c, which both define setjmp. Can someone
enlighten me about why this may be happening?

This is built from the glibc-2.2 sources, which I understand has
all/most of the changes in pehc cvs.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
