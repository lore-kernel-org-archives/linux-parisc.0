Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0EB7048A6
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 07:49:10 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g6FEvnu6030505;
	Mon, 15 Jul 2002 15:57:50 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g6FEvm0S030503;
	Mon, 15 Jul 2002 15:57:48 +0100
Subject: Re: Re: [parisc-linux] STI framebuffer and PINE
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Matthew Wilcox <willy@debian.org>
Cc: Stephan Trajkoff <stephan@itp.bg>, Ralf.Hildebrandt@charite.de,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020715143909.K27706@parcelfarce.linux.theplanet.co.uk>
References: <20020714091619.B1E35483A@dsl2.external.hp.com>
	<20020715142028.J27706@parcelfarce.linux.theplanet.co.uk>
	<1026743879.30202.5.camel@irongate.swansea.linux.org.uk>
	<20020715143909.K27706@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 15 Jul 2002 15:57:48 +0100
Message-Id: <1026745068.30206.8.camel@irongate.swansea.linux.org.uk>
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

On Mon, 2002-07-15 at 14:39, Matthew Wilcox wrote:
> > [ObOnTopic] What is the state of the 2.4 pa-risc code in terms of rate
> > of change now. Would it be a good time to use -ac as a real sync up ?
> 
> rate of change is fairly low; i attempted to do a merge with marcelo
> during early 2.4.19 dev, but someone sent some conflicting patches in
> first, i tripped over my own feet trying to use bitkeeper and ran out
> of motivation to fix conflicts myself.

People who do merges dont use bitkeeper

> at OLS we decided to concentrate on 2.5 RSN.  it's more important to
> work on that than keep trying to push bits into 2.4.

Is there somewhere I can yank a definitive stable 2.4 tree and I'll take
a look at the 2.4 stuff. I've had a bit of practice at the merging game
8)
