Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA02752
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Jan 2001 15:14:13 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 11 Jan 2001 22:17:47 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id AFBABB005; Thu, 11 Jan 2001 22:09:17 +0000 (GMT)
Date: Thu, 11 Jan 2001 22:09:17 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Andries Brouwer <aeb@cwi.nl>
Cc: parisc-linux@thepuffingroup.com, util-linux@math.uio.no
Message-ID: <20010111220917.J18838@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Bug in more
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I have found a bug in 'more', util-linux-2.10r source.
At startup tailequ() is called to match the last component of argv[0]
against "page".  tailequ() is broken because it accesses one location
below the start of argv[0].  This causes a crash on parisc, where the
stack grows upwards and argv[0] is the first element on the stack.

Richard

--- util-linux-2.10r/text-utils/more.c-	Thu Jan 11 15:00:59 2001
+++ util-linux-2.10r/text-utils/more.c	Thu Jan 11 15:02:52 2001
@@ -815,8 +815,8 @@
 	register char *tail;
 
 	tail = path + strlen(path);
-	while (tail >= path)
-		if (*(--tail) == '/')
+	while (--tail >= path)
+		if (*tail == '/')
 			break;
 	++tail;
 	while (*tail++ == *string++)
