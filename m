Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D54C482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 May 2002 09:03:18 -0600 (MDT)
To: joel.soete@freebel.net
Subject: Re: [parisc-linux] Try to boot b2000 failled?
Message-ID: <1021388566.3ce12716b627a@webmail.tiscalinet.be>
Date: Tue, 14 May 2002 17:02:46 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
References: <1021381629.3ce10bfd90522@webmail.tiscalinet.be>
In-Reply-To: <1021381629.3ce10bfd90522@webmail.tiscalinet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Oops... I find back a kernel pa12 and this boot better until it panics because of:
...
root fs not found
...

So I suspect a mistake in the bootp-tftp config.
In fact I would like to mount my palinux-0.9-3 cd on b180:/cdrom and use it as
root fs to install the b2000.
Unfortunately i do not find any example to do this. Is somebody can share its
experience.

Thanks in advance for additionale help,
    Joel

Quoting joel.soete@freebel.net:

> Hi all,
> 
> To split my gcc-3.2 and gcc-3.1 env on two different server (need disk
> space
> also), I would like to install a free b2000 workstation.
> 
> To do this i choose lan install (no possibilty for external scsi-cdrom
> and no
> more place to rebuild a new cdimage with recent kernel); I configure my
> palinux
> b180 as bootp-tftp server and configure in accordance with
> http://pateam.esiee.fr/parisc-linux-boot/parisc-linux-boot/preparation.html.
> 
> In b2000 BOOT_ADMIN> boot lan, the lifimage (build with cvs palo &
> kernel
> 2.4.18-24 which boot well on my b180) is well found and launched but
> hang just
> after "Searching for devices..." and the green light on the ide cd-rom
> driver
> stay lighted?
> 
> Thanks in advance for help,
>     Joel
> 
> 
> -------------------------------------------------
> This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
