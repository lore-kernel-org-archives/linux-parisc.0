Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA17110
	for <parisc-linux@puffin.external.hp.com>; Tue, 22 Aug 2000 15:55:46 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 22 Aug 2000 21:55:38 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13RM0R-0000pA-00
	for <parisc-linux@thepuffingroup.com>; Tue, 22 Aug 2000 17:54:51 -0400
To: parisc-linux@thepuffingroup.com
References: <87zom5uhv3.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 22 Aug 2000 17:54:51 -0400
In-Reply-To: David Huggins-Daines's message of "22 Aug 2000 17:05:20 -0400"
Message-ID: <87vgwtufkk.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] GCC merge complete
List-ID: <linux-parisc.vger.kernel.org>

As the subject says.

You will probably need to add --disable-threads to your configure
command if you are building C++ support.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
