Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA29681
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Nov 2000 13:26:22 -0700
Received: from esiee.fr (pc5158a.esiee.fr [147.215.50.165])
	by mail.esiee.fr (Postfix) with ESMTP id 28F77D15A4
	for <parisc-linux@thepuffingroup.com>; Mon, 27 Nov 2000 21:28:38 +0100 (CET)
Sender: marteaut@esiee.fr
Message-ID: <3A22C48D.F5F85405@esiee.fr>
Date: Mon, 27 Nov 2000 21:31:09 +0100
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Puffin Group <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Include trouble
List-ID: <linux-parisc.vger.kernel.org>

Hi folks,

	Just to know if it is a local problem. We have this warning when we
cross compile the kernel:

/linux/cvs/linux/include/linux/string.h:61: warning: conflicting types
for built-in function `memset'
/linux/cvs/linux/include/linux/string.h:64: warning: conflicting types
for built-in function `memcpy'
/linux/cvs/linux/include/linux/string.h:73: warning: conflicting types
for built-in function `memcmp'

Can we have your point of view?

Bye, ESIEE Team
