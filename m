Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id D08064876
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 11:09:59 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: gcc-3.2 Ok gcc-3.1.1 Ko (was Re: [parisc-linux] gcc-3.2 bootstrap?)
Message-ID: <1026925794.3d35a4e296ccf@webmail.tiscalinet.be>
Date: Wed, 17 Jul 2002 19:09:54 +0200 (CEST)
From: Joel Soete <joel.soete@freebel.net>
Cc: parisc-linux@parisc-linux.org
References: <200207161812.g6GICDIp023677@hiauly1.hia.nrc.ca>
In-Reply-To: <200207161812.g6GICDIp023677@hiauly1.hia.nrc.ca>
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

Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:

> > > Your problem appears to be with arch/parisc/kernel/parisc_ksyms.c.
> > > It imports the symbol.
> > > 
> > 
> > Simply comment it out will broken to compile with gcc-3.0.x, I
> suppose?
> 
> I suspect that you can just delete
> 
>   extern void $$mulU(void);
> 
> and
> 
>   #ifndef __LP64__
>   EXPORT_SYMBOL_NOVERS($$mulU);
>   #endif
> 
> I didn't see any assembly usage of this function in linux and I don't
> believe gcc uses it (even 3.0.x), so probably the lines can just be
> deleted.
> 

To summarise:
This clean should be applied without problem (test with gcc-3.2 and gcc-3.0.4)

This allow me to produce an operational kernel with gcc-3.2 (bootstrap an x);
telnet, ftp and ssh connection OK

But with gcc-3.1.1 still crashing at the first remote connection?

I will try a more recent CVS update.

Joel




-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
