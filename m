Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id A025448B9
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 09:00:59 -0600 (MDT)
Date: Wed, 17 Jul 2002 08:03:50 -0700
From: Randolph Chung <randolph@tausq.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] 2.4.19-rc1-ac6 Merge pa55: #error ...?
Message-ID: <20020717150349.GN8724@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk> <1026913104.3d357350a4057@webmail.tiscalinet.be> <20020717144543.A13352@parcelfarce.linux.theplanet.co.uk> <1026914852.3d357a24c4a4a@webmail.tiscalinet.be> <20020717142915.GG641@tausq.org> <1026922060.5709.148.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1026922060.5709.148.camel@irongate.swansea.linux.org.uk>
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

> Marcelo merged a load of mips bits for 2.4.19rc2, he may be willing to
> take a sort of "toilet flush" of arch/parisc and include/asm-parisc to
> get the diff size down while knowing it touches no code that can
> actually do harm.

Good to know. Incidentally I noticed the asm/pg{alloc,table}.h in your
tree is quite different from what we have in parisc cvs, and doesn't 
really compile. Any particular reasons?

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
