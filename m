Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78847487F
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 17:13:31 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g6G0NVu6032685;
	Tue, 16 Jul 2002 01:23:32 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g6G0NU6a032683;
	Tue, 16 Jul 2002 01:23:30 +0100
Subject: Re: [parisc-linux] 2.4.19 merge
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020715230306.93501485E@dsl2.external.hp.com>
References: <20020714091619.B1E35483A@dsl2.external.hp.com>
	<20020715142028.J27706@parcelfarce.linux.theplanet.co.uk>
	<1026743879.30202.5.camel@irongate.swansea.linux.org.uk>  
	<20020715230306.93501485E@dsl2.external.hp.com>
Content-Type: text/plain
Date: 16 Jul 2002 01:23:30 +0100
Message-Id: <1026779010.31925.44.camel@irongate.swansea.linux.org.uk>
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

On Tue, 2002-07-16 at 00:03, Grant Grundler wrote:
> 
> [ sorry - change the subject line ]
> 
> Alan Cox wrote:
> > [ObOnTopic] What is the state of the 2.4 pa-risc code in terms of rate
> > of change now. Would it be a good time to use -ac as a real sync up ?
> 
> BTW, I've been testing Ivan K's PCI rewrite/changes on A500 for the past
> couple of monthes but never committed those to CVS. I guess I didn't
> want more churn until Ivan could tell me his bits were in 2.4.
> 
> Basically with his code, I needed few or no changes to drivers/pci.
> I'd have to review the diff again.
> Ivan last sent me a patch on 18.4.2002.
> You want matching changes for arch/parisc as well?

That would be interesting to see yes
