Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 73AF248C6
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 10:15:09 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] 2.4.19-rc1-ac6 Merge pa55: #error ...?
Message-ID: <1026922139.3d35969bd5ebf@webmail.tiscalinet.be>
Date: Wed, 17 Jul 2002 18:08:59 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	Randolph Chung <randolph@tausq.org>,
	HPPA List <parisc-linux@parisc-linux.org>
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk> <1026913104.3d357350a4057@webmail.tiscalinet.be> <20020717144543.A13352@parcelfarce.linux.theplanet.co.uk> <1026914852.3d357a24c4a4a@webmail.tiscalinet.be> <20020717142915.GG641@tausq.org> <1026922060.5709.148.camel@irongate.swansea.linux.org.uk> <20020717150349.GN8724@tausq.org> <1026925311.5709.153.camel@irongate.swansea.linux.org.uk> <20020717165722.E13352@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020717165722.E13352@parcelfarce.linux.theplanet.co.uk>
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

> On Wed, Jul 17, 2002 at 06:01:51PM +0100, Alan Cox wrote:
> > On Wed, 2002-07-17 at 16:03, Randolph Chung wrote:
> > > Good to know. Incidentally I noticed the asm/pg{alloc,table}.h in
> your
> > > tree is quite different from what we have in parisc cvs, and doesn't
> 
> > > really compile. Any particular reasons?
> > 
> > Thats still on my pending list to look at harder. 
> 
> iirc this was what broke me when trying to merge to marcelo before.
> someone deleted a line that we'd already deleted or something...
> 

IIRC too

Remember:
http://lists.parisc-linux.org/pipermail/parisc-linux/2002-January/015290.html

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
