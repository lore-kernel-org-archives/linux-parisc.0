Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA31982
	for <parisc-linux@puffin.external.hp.com>; Fri, 27 Oct 2000 15:43:49 -0600
Date: Fri, 27 Oct 2000 14:28:13 -0700
Message-Id: <200010272128.OAA03377@pizda.ninka.net>
From: "David S. Miller" <davem@redhat.com>
To: grundler@cup.hp.com
CC: parisc-linux@thepuffingroup.com
In-reply-to: <200010272037.NAA23925@milano.cup.hp.com> (message from Grant
	Grundler on Fri, 27 Oct 2000 13:37:34 -0700 (PDT))
Subject: Re: scatterlist (de-)construction
References: <200010272037.NAA23925@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Set ENABLE_CLUSTERING in the scsi driver or use a 4K block
size in your ext2 partitions.

Later,
David S. Miller
davem@redhat.com
