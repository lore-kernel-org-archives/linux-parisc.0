Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA14547
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Dec 2000 13:30:35 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id A8141ED6
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Dec 2000 12:33:44 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id MAA23307
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Dec 2000 12:35:01 -0800 (PST)
Message-Id: <200012272035.MAA23307@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] dd and 2k transfers on A500 
In-reply-to: Your message of "Fri, 22 Dec 2000 17:10:05 PST."
             <200012230110.RAA20271@milano.cup.hp.com>
Date: Wed, 27 Dec 2000 12:35:00 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> I'm using local disks on the A500 to do the following:
> for i in 0 1 2 3 4 5 6 7 8 9; do dd if=/dev/sdd of=t$i \
> bs=2k count=1; od -A x -t xC t$i > x$i; done

Problem solved. Loosing page offset bits in the last "chunk"
of a scatter-gather list. We end up DMAing to the wrong part
of the page. Fix was tested on 32-bit/C3k and should work on
A500 as well now.

my apologies for the stupid mistake,
grant
