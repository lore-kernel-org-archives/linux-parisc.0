Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id SAA31516
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 18:30:32 -0500
Received: from hpctl57.cup.hp.com (root@hpctl57.cup.hp.com [15.0.76.57])
	by atlrel1.hp.com (8.8.6 (PHNE_14041)/8.8.5tis) with ESMTP id SAA07993
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 18:30:10 -0500 (EST)
Received: from hpctl57 (krp@hpctl57.cup.hp.com [15.0.76.57]) by hpctl57.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id PAA16137 for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 15:30:16 -0800 (PST)
Sender: krp@cup.hp.com
Message-ID: <36FAC708.362B@cup.hp.com>
Date: Thu, 25 Mar 1999 15:30:16 -0800
From: Bob Pflederer <krp@cup.hp.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] syscall work
References: <199903252046.OAA08061@helgaaspc.rsn.hp.com> <36FAA595.DB56B012@netscape.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> OK, I'm convinced.  I've changed unistd.h to use 0xC0000404 (on the next
> page) for the syscall gateway, although we can easily change it back.

Isn't the next page at 0xc0001000?  Or does linux have some concept of
1k "pages" even though pages in the TLB are 4k?

-Bob
