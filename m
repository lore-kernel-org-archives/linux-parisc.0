Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cuprel1.hp.com (cuprel1.hp.com [156.153.254.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C697482F
	for <parisc-linux@parisc-linux.org>; Thu, 18 Jul 2002 09:43:35 -0600 (MDT)
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by cuprel1.hp.com (Postfix) with ESMTP id 1F57C5B4
	for <parisc-linux@parisc-linux.org>; Thu, 18 Jul 2002 05:07:47 -0700 (PDT)
To: joel.soete@freebel.net
Subject: Re: gcc-3.2 Ok gcc-3.1.1 Ko (was Re: [parisc-linux] gcc-3.2 bootstrap?)
Message-ID: <1026993989.3d36af45ed334@webmail.tiscalinet.be>
Date: Thu, 18 Jul 2002 14:06:29 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>, joel.soete@freebel.net,
	Matthew Wilcox <willy@debian.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
References: <200207161812.g6GICDIp023677@hiauly1.hia.nrc.ca> <1026925794.3d35a4e296ccf@webmail.tiscalinet.be> <20020717183200.G13352@parcelfarce.linux.theplanet.co.uk> <1026927844.3d35ace43b220@webmail.tiscalinet.be> <20020717191033.H13352@parcelfarce.linux.theplanet.co.uk> <1026972913.3d365cf155c68@webmail.tiscalinet.be>
In-Reply-To: <1026972913.3d365cf155c68@webmail.tiscalinet.be>
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

Quoting joel.soete@freebel.net:

> Quoting Matthew Wilcox <willy@debian.org>:
> 
> > On Wed, Jul 17, 2002 at 07:44:04PM +0200, joel.soete@freebel.net
> wrote:
> > > Quoting Matthew Wilcox <willy@debian.org>:
> > > > but did you test modules?
> > > They were all together build with 'make oldconfig' after a
> distclean,
> > so yes
> > > with modules support. A monolithic test should be interesting? (I
> > already do
> > > this test for gcc-3.1 not 3.1.1 it does not bring success)
> > 
> > build is not sufficient; the EXPORT_MODULE stuff can only be tested
> by
> > loading modules at runtime.
> 
> 
> Is it just to test to load a module? (no relation with TCP problem?)
> 
> Joel
> 
Sorry for delay but I would like to re-compile some more modules. I just test
lvm-mod as well as nfs and nfsd. No problem: insmod, lsmod, rsmod works fine for
gcc-3.1.1 and for gcc-3.2. (do you know some problem with modules with those
release of gcc compiler?)

Joel



-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
