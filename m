Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 949E6484E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 08:07:16 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] hppa64-linux-gcc not in gcc dpkg?
Message-ID: <1024495623.3d109007598b2@webmail.tiscalinet.be>
Date: Wed, 19 Jun 2002 16:07:03 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1024493288.3d1086e89dfd2@webmail.tiscalinet.be> <20020619143627.K9435@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020619143627.K9435@parcelfarce.linux.theplanet.co.uk>
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

Quoting Matthew Wilcox <willy@debian.org>:

> On Wed, Jun 19, 2002 at 03:28:08PM +0200, joel.soete@freebel.net wrote:
> > To verify my ioctl32 patch for 64bit kernel I am just trying to
> compile last cvs
> > kernel in 64bits on my b2000 (PA8600?). To do so, in make menu config,
> i choose
> > procesor type PA8x00, 64bits kernel && 32bits PDC (because b2000).
> 
> what makes you think that you should use 32-bit PDC on b2000?

May I am wrong (I thought that the PDC of the b2000 was not a 64bits one; I will
check )

> 
> > But when I launch make dep, it failled because it did not find
> hpp64-linux-gcc?
> > I search on http://www.debian.org/distrib/packages but no success?
> 
> get the packages from ftp://ftp.parisc-linux.org/unofficial-debs.

 
Many thanks for all,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
