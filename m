Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA05329
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Mar 2000 00:35:59 -0700
Received: from bimbo.hungary.hp.com (bimbo.hungary.hp.com [15.188.73.101])
	by atlrel2.hp.com (Postfix) with ESMTP id 207C58CE
	for <parisc-linux@thepuffingroup.com>; Mon, 27 Mar 2000 02:35:53 -0500 (EST)
Received: from pcmatics ([15.127.193.61] (may be forged)) by bimbo.hungary.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.1) id JAA09812 for <parisc-linux@thepuffingroup.com>; Mon, 27 Mar 2000 09:35:49 +0200 (METDST)
Message-ID: <023601bf97bf$1a0276a0$a94abc0f@hungary.hp.com>
From: "Gyula Matics" <gyula_matics@hp.com>
To: <parisc-linux@thepuffingroup.com>
References: <20000322215749.C10226@thepuffingroup.com>
Subject: Re: [parisc-linux] Any docs on the 715?
Date: Mon, 27 Mar 2000 09:29:26 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> the 715/old scsi chip is an ncr53c700.  everyone is too scared of it
> right now.  the 715/new scsi chip is an ncr53c710 and Gyula Matics
> committed code that should have that working.

I'm back and i'll be hammering on the 710 driver till it starts
really working. The next targets are the c700 and the c720. probably
starting with the c700 as i now have a 715/50 at home.

Gyula
