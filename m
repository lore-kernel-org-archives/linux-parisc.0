Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0CC0048E1
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 11:44:12 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Subject: Re: gcc-3.2 Ok gcc-3.1.1 Ko (was Re: [parisc-linux] gcc-3.2 bootstrap?)
Message-ID: <1026927844.3d35ace43b220@webmail.tiscalinet.be>
Date: Wed, 17 Jul 2002 19:44:04 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Joel Soete <joel.soete@freebel.net>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
References: <200207161812.g6GICDIp023677@hiauly1.hia.nrc.ca> <1026925794.3d35a4e296ccf@webmail.tiscalinet.be> <20020717183200.G13352@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020717183200.G13352@parcelfarce.linux.theplanet.co.uk>
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

> On Wed, Jul 17, 2002 at 07:09:54PM +0200, Joel Soete wrote:
> > To summarise:
> > This clean should be applied without problem (test with gcc-3.2 and
> gcc-3.0.4)
> > 
> > This allow me to produce an operational kernel with gcc-3.2 (bootstrap
> an x);
> > telnet, ftp and ssh connection OK
> 
> but did you test modules?
> 
They were all together build with 'make oldconfig' after a distclean, so yes
with modules support. A monolithic test should be interesting? (I already do
this test for gcc-3.1 not 3.1.1 it does not bring success)

Joel



-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
