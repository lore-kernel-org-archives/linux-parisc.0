Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA22658
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Sep 2000 05:46:52 -0600
Received: from club-internet.fr (nas8-129.vlt.club-internet.fr [194.158.111.129])
	by front1.grolier.fr (8.9.3/No_Relay+No_Spam_MGC990224) with ESMTP id NAA01748
	for <parisc-linux@thepuffingroup.com>; Sun, 17 Sep 2000 13:47:20 +0200 (MET DST)
Sender: romain@front1.grolier.fr
Message-ID: <39C4BE54.834952DB@club-internet.fr>
Date: Sun, 17 Sep 2000 13:51:32 +0100
From: Romain Dolbeau <dolbeaur@club-internet.fr>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Netbooting a 710 : IPX ?
References: <39C37F48.E9481800@club-internet.fr> <20000917033416.A16536@neep.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Andrew Shugg wrote:

> I think you will need 'rbootd' running to answer the initial request,
> which then hands over to bootpd.
[snip]
> There is a build on ftp://puffin.external.hp.com/pub/parisc/binaries/tgz/
> but I don't know for which architecture and OS.  =)  You shouldn't have
> any trouble finding a package or the source to build for your platform.


5116@telia.com wrote:

> The 710 and other early HP9000s dont use bootp, but rboot. There is a
> rboot server on puffin.external.hp.com pub/parisc/binaries/tgz/rbootd-2.0-2.tar.gz


Thanks to the both of you, rbootd was indeed the answer. No IPX
anywhere to be seen, I should spend more time trying to understand
tcpdump :-/

There's a (very old but working after minor patching) sun-rbootd 
package on the web, that works fine on Solaris 7, if anyone is
interested.

I have now two HP ready to run, one 710 (64 MB Ram, dual 420 MB disks)
and one 715 (56 MB Ram, 2 GB disk). If there's any need to test
stuff on these platforms, feel free to ask (but it's unlikely
I'll find much free time except maybe on Saturday/Sunday).

thanks for the help,

-- 
DOLBEAU Romain
ENS Cachan / Ker Lann
Thesard IRISA / CAPS
dolbeaur@club-internet.fr
