Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 934FB482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jan 2002 10:58:43 -0700 (MST)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel6.hp.com (Postfix) with ESMTP id ECD71600770
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jan 2002 12:58:42 -0500 (EST)
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: phi 4369 <phi@hpfrcu81.france.hp.com>,
	parisc-linux@lists.parisc-linux.org, taggart@carmen.fc.hp.com
Subject: Re: [parisc-linux] rlogin --> Connection closed. 
In-Reply-To: Your message of "Wed, 16 Jan 2002 10:56:34 MST."
             <20020116175634.383D637D2B@carmen.fc.hp.com>
References: <1011117789.3c446eddddc77@webmail.tiscali.be> <20020115181518.F19567@parcelfarce.linux.theplanet.co.uk> <1011169636.3c453964624af@webmail.tiscali.be> <3C454208.C1F66E59@hpfrcu81.france.hp.com>  <20020116175634.383D637D2B@carmen.fc.hp.com> 
Date: Wed, 16 Jan 2002 10:58:42 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020116175842.B2E5B37D2B@carmen.fc.hp.com>
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

Matt Taggart writes...

> 
> phi 4369 writes...
> 
> > Hi All,
> > 
> > On my freshly installed 712 palinux when trying to rlogin into it I got thi
> s
> > 
> > iws1pb05:/home/phi> rlogin iws1pb02
> > Connection closed.
> > iws1pb05:/home/phi>
> > 
> > 
> > Indeed I did all I thought was enough to make it workable (install of the
> > rlogind, resolv.conf, nsswitch.conf, inetd.conf, .rhosts with rights ok,
> > etc...)
> 
> Do you have rsh-server installed as well?

Oh, you must if you're getting that login.

> Have you looked in /var/log/auth.log?

This still might be useful.

Not awake enough to be answering email,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
