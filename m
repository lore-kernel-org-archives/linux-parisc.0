Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19 merge
In-Reply-To: Message from Alan Cox <alan@lxorguk.ukuu.org.uk>
   of "15 Jul 2002 15:37:59 BST." <1026743879.30202.5.camel@irongate.swansea.linux.org.uk>
References: <20020714091619.B1E35483A@dsl2.external.hp.com> <20020715142028.J27706@parcelfarce.linux.theplanet.co.uk>  <1026743879.30202.5.camel@irongate.swansea.linux.org.uk> 
Date: Mon, 15 Jul 2002 17:03:06 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020715230306.93501485E@dsl2.external.hp.com>
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

[ sorry - change the subject line ]

Alan Cox wrote:
> [ObOnTopic] What is the state of the 2.4 pa-risc code in terms of rate
> of change now. Would it be a good time to use -ac as a real sync up ?

BTW, I've been testing Ivan K's PCI rewrite/changes on A500 for the past
couple of monthes but never committed those to CVS. I guess I didn't
want more churn until Ivan could tell me his bits were in 2.4.

Basically with his code, I needed few or no changes to drivers/pci.
I'd have to review the diff again.
Ivan last sent me a patch on 18.4.2002.
You want matching changes for arch/parisc as well?

thanks,
grant
