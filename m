Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6B9D482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 May 2002 06:48:32 -0600 (MDT)
To: Robert Stanford <rob@rotapile.com>
Subject: Re: [parisc-linux] Debian install on K580
Message-ID: <1022244488.3cee368861d59@webmail.tiscalinet.be>
Date: Fri, 24 May 2002 14:48:08 +0200 (CEST)
From: joel.soete@freebel.net
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
References: <1022228733.12724.15.camel@rotapile>
In-Reply-To: <1022228733.12724.15.camel@rotapile>
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

Hi Robert,

Quoting Robert Stanford <rob@rotapile.com>:

> I ran it again and got this error
> 
> Testing apt sources ...
> Err http://security.debian.org stable/updates/main Packages
>   404 Not Found

This message seems to me normal, AFAIK security only concern stable release
which is steel 'POTATO' (no implementation for hppa)

> Ign http://security.debian.org stable/updates/main Release
> apt-get(337): unaligned access to 0x403d7008 at ip=0x4009d16f
> Not-handled unaligned insn 0x0e801210
> Unaligned handler failed, ret = -1
> 

This is a message from kernel saying that process namely apt-get with pid=337
made an unaligned memory access.
I frequentely encounter this message (evms tools, jfs tools) which seems to be
harmless and so make think to a kernel bug.

> 
> 
> Forgot to mention, that im running ext3, is this an error related to
> the
> filesystem ?

Last week I just install a b2000 with also ext3 fs type and just make apt-get
dist-upgrade. All works fine without any error message.

Can you retry after having remove or comment out the line related to
'security.debian.org'?

Good luck,
    Joel



-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
