Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2892E489B
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 08:47:57 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17Uq5s-0006ZO-00; Wed, 17 Jul 2002 15:47:56 +0100
Date: Wed, 17 Jul 2002 15:47:56 +0100
From: Matthew Wilcox <willy@debian.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Wilcox <willy@debian.org>, joel.soete@freebel.net,
	HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] 2.4.19-rc1-ac6 Merge pa55: #error ...?
Message-ID: <20020717154756.B13352@parcelfarce.linux.theplanet.co.uk>
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk> <1026913104.3d357350a4057@webmail.tiscalinet.be> <20020717144543.A13352@parcelfarce.linux.theplanet.co.uk> <1026919215.1688.140.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1026919215.1688.140.camel@irongate.swansea.linux.org.uk>; from alan@lxorguk.ukuu.org.uk on Wed, Jul 17, 2002 at 04:20:15PM +0100
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

On Wed, Jul 17, 2002 at 04:20:15PM +0100, Alan Cox wrote:
> On Wed, 2002-07-17 at 14:45, Matthew Wilcox wrote:
> > Joel, the -ac series will NOT contain all the changes necessary to build
> > on PA.
>  
> Yet 8)

You told me you'd never accept the LOFF_T hacks i made to readv/writev ;-)

-- 
Revolutions do not require corporate support.
