Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA03311
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Sep 1999 16:52:25 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id SAA25536
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Sep 1999 18:53:57 -0400 (EDT)
Message-Id: <199909152252.PAA20482@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@suse.de>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/100 bootpd fails 
In-reply-to: Your message of "Wed, 15 Sep 1999 15:26:29 PDT."
             <199909152226.PAA20425@milano.cup.hp.com>
Date: Wed, 15 Sep 1999 15:52:43 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Sorry....typo was mine.

Grant Grundler wrote:
...
> and /etc/bootptab:
> lego02b:\
>         hn:\
>         sm=255.255.248.0:\
>         vm=rfc1048:\
>         ht=ether:\
>         ha=0800095F7A88:\
>         ip=15.16.122.147

wants ":\" appended or bootpd won't pick up the next line.

>         bf=/linux/linux/arch/parisc/boot/Image
> 
> We didn't specify "gw=xxx" since my host and target are on
> the same subnet. Hope this helps others as well...

grant
