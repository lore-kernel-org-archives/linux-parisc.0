Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D70F4871
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 08:55:46 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g6HG5Ru6006817;
	Wed, 17 Jul 2002 17:05:28 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g6HG5QNm006815;
	Wed, 17 Jul 2002 17:05:26 +0100
Subject: Re: [parisc-linux] 2.4.19-rc1-ac6 Merge pa55: #error ...?
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Matthew Wilcox <willy@debian.org>
Cc: joel.soete@freebel.net, HPPA List <parisc-linux@parisc-linux.org>
In-Reply-To: <20020717154756.B13352@parcelfarce.linux.theplanet.co.uk>
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk>
	<1026913104.3d357350a4057@webmail.tiscalinet.be>
	<20020717144543.A13352@parcelfarce.linux.theplanet.co.uk>
	<1026919215.1688.140.camel@irongate.swansea.linux.org.uk>
	<20020717154756.B13352@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 17 Jul 2002 17:05:26 +0100
Message-Id: <1026921926.1687.146.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
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

On Wed, 2002-07-17 at 15:47, Matthew Wilcox wrote:
> On Wed, Jul 17, 2002 at 04:20:15PM +0100, Alan Cox wrote:
> > On Wed, 2002-07-17 at 14:45, Matthew Wilcox wrote:
> > > Joel, the -ac series will NOT contain all the changes necessary to build
> > > on PA.
> >  
> > Yet 8)
> 
> You told me you'd never accept the LOFF_T hacks i made to readv/writev ;-)

Indeed. I'd rather you stuck parisc_readv/writev in and those did the
magic stack rejig. 

Alan
