Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09389482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jan 2002 10:56:36 -0700 (MST)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel6.hp.com (Postfix) with ESMTP id EF01A60033F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jan 2002 12:56:34 -0500 (EST)
To: phi 4369 <phi@hpfrcu81.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org, taggart@carmen.fc.hp.com
Subject: Re: [parisc-linux] rlogin --> Connection closed. 
In-Reply-To: Your message of "Wed, 16 Jan 2002 10:04:08 +0100."
             <3C454208.C1F66E59@hpfrcu81.france.hp.com>
References: <1011117789.3c446eddddc77@webmail.tiscali.be> <20020115181518.F19567@parcelfarce.linux.theplanet.co.uk> <1011169636.3c453964624af@webmail.tiscali.be>  <3C454208.C1F66E59@hpfrcu81.france.hp.com> 
Date: Wed, 16 Jan 2002 10:56:34 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020116175634.383D637D2B@carmen.fc.hp.com>
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

phi 4369 writes...

> Hi All,
> 
> On my freshly installed 712 palinux when trying to rlogin into it I got this
> 
> iws1pb05:/home/phi> rlogin iws1pb02
> Connection closed.
> iws1pb05:/home/phi>
> 
> 
> Indeed I did all I thought was enough to make it workable (install of the
> rlogind, resolv.conf, nsswitch.conf, inetd.conf, .rhosts with rights ok,
> etc...)

Do you have rsh-server installed as well? Have you looked in /var/log/auth.log?

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
