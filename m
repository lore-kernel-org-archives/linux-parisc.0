Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA03034
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Sep 1999 16:26:14 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id PAA25391
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Sep 1999 15:28:23 -0700 (PDT)
Message-Id: <199909152226.PAA20425@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@suse.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/100 bootpd fails 
In-reply-to: Your message of "Wed, 15 Sep 1999 23:56:23 PDT."
             <19990915235623.D8112@suse.de>
Date: Wed, 15 Sep 1999 15:26:29 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:

> My guess is your bootpd / tftpd does not work properly.  Just as it might
> help, here is my configuration:

Yup - that was right.

I got a call from another parisc-linux "lurker" and the
configuration for HP-UX is

/etc/inetd.conf:
tftp        dgram  udp wait   root /usr/lbin/tftpd    tftpd \
                /linux/linux/arch/parisc/boot \
                /home/tftpd
bootps      dgram  udp wait   root /usr/lbin/bootpd   bootpd -d3

[ the -d3 could be omitted ]

and /etc/bootptab:
lego02b:\
        hn:\
        sm=255.255.248.0:\
        vm=rfc1048:\
        ht=ether:\
        ha=0800095F7A88:\
        ip=15.16.122.147
        bf=/linux/linux/arch/parisc/boot/Image

We didn't specify "gw=xxx" since my host and target are on
the same subnet. Hope this helps others as well...

thanks again philip,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
