Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA11503
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Jun 2000 01:08:11 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 1 Jun 2000 07:08:34 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA28821;
	Thu, 1 Jun 2000 17:08:29 +1000
Date: Thu, 1 Jun 2000 17:08:29 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: parisc-linux@thepuffingroup.com
cc: Paul Bame <bame@endor.fc.hp.com>
Subject: [parisc-linux] Binutils update
Message-ID: <Pine.LNX.4.21.0006011600290.30171-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I've just checked in the following:

Rewrite much of the stub handling code (still using r8)
Fix expression parsing for `!' line separator. 
Fix sizing of branches & other miscellaneous small fixes. 

Feedback appreciated.
Paul, did you get tar to run?

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
