Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8EA974877
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 12:10:38 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17UtFx-00037S-00; Wed, 17 Jul 2002 19:10:33 +0100
Date: Wed, 17 Jul 2002 19:10:33 +0100
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: gcc-3.2 Ok gcc-3.1.1 Ko (was Re: [parisc-linux] gcc-3.2 bootstrap?)
Message-ID: <20020717191033.H13352@parcelfarce.linux.theplanet.co.uk>
References: <200207161812.g6GICDIp023677@hiauly1.hia.nrc.ca> <1026925794.3d35a4e296ccf@webmail.tiscalinet.be> <20020717183200.G13352@parcelfarce.linux.theplanet.co.uk> <1026927844.3d35ace43b220@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1026927844.3d35ace43b220@webmail.tiscalinet.be>; from joel.soete@freebel.net on Wed, Jul 17, 2002 at 07:44:04PM +0200
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

On Wed, Jul 17, 2002 at 07:44:04PM +0200, joel.soete@freebel.net wrote:
> Quoting Matthew Wilcox <willy@debian.org>:
> > but did you test modules?
> They were all together build with 'make oldconfig' after a distclean, so yes
> with modules support. A monolithic test should be interesting? (I already do
> this test for gcc-3.1 not 3.1.1 it does not bring success)

build is not sufficient; the EXPORT_MODULE stuff can only be tested by
loading modules at runtime.

-- 
Revolutions do not require corporate support.
