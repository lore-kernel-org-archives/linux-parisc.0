Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19 merge 
In-Reply-To: Message from Alan Cox <alan@lxorguk.ukuu.org.uk>
   of "16 Jul 2002 01:23:30 BST." <1026779010.31925.44.camel@irongate.swansea.linux.org.uk>
References: <20020714091619.B1E35483A@dsl2.external.hp.com> <20020715142028.J27706@parcelfarce.linux.theplanet.co.uk> <1026743879.30202.5.camel@irongate.swansea.linux.org.uk> <20020715230306.93501485E@dsl2.external.hp.com>  <1026779010.31925.44.camel@irongate.swansea.linux.org.uk> 
Date: Tue, 16 Jul 2002 00:40:45 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020716064045.1D1F24863@dsl2.external.hp.com>
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

Alan Cox wrote:
> > Basically with his code, I needed few or no changes to drivers/pci.
> > I'd have to review the diff again.
> > Ivan last sent me a patch on 18.4.2002.
> > You want matching changes for arch/parisc as well?
> 
> That would be interesting to see yes

Original diff from Ivan (plus email comments) is
	ftp://ftp.parisc-linux.org/patches/pci-20020418-ink.diff

Diff against -pa55 (including my changes) is at:
	ftp://ftp.parisc-linux.org/patches/pci-20020418-pa55.diff

DEBUG should probably be disabled in drivers/pci/setup-bus.c.

grant
