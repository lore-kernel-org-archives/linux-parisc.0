Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B5CC48BB
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 09:51:30 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g6HH1vu6006980;
	Wed, 17 Jul 2002 18:01:57 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g6HH1pip006978;
	Wed, 17 Jul 2002 18:01:51 +0100
Subject: Re: [parisc-linux] 2.4.19-rc1-ac6 Merge pa55: #error ...?
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Randolph Chung <randolph@tausq.org>
Cc: HPPA List <parisc-linux@parisc-linux.org>
In-Reply-To: <20020717150349.GN8724@tausq.org>
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk>
	<1026913104.3d357350a4057@webmail.tiscalinet.be>
	<20020717144543.A13352@parcelfarce.linux.theplanet.co.uk>
	<1026914852.3d357a24c4a4a@webmail.tiscalinet.be>
	<20020717142915.GG641@tausq.org>
	<1026922060.5709.148.camel@irongate.swansea.linux.org.uk>
	<20020717150349.GN8724@tausq.org>
Content-Type: text/plain
Date: 17 Jul 2002 18:01:51 +0100
Message-Id: <1026925311.5709.153.camel@irongate.swansea.linux.org.uk>
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

On Wed, 2002-07-17 at 16:03, Randolph Chung wrote:
> > Marcelo merged a load of mips bits for 2.4.19rc2, he may be willing to
> > take a sort of "toilet flush" of arch/parisc and include/asm-parisc to
> > get the diff size down while knowing it touches no code that can
> > actually do harm.
> 
> Good to know. Incidentally I noticed the asm/pg{alloc,table}.h in your
> tree is quite different from what we have in parisc cvs, and doesn't 
> really compile. Any particular reasons?

Thats still on my pending list to look at harder. 
