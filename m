Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cuprel1.hp.com (cuprel1.hp.com [156.153.254.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id 00E40485F
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 10:11:59 -0600 (MDT)
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by cuprel1.hp.com (Postfix) with ESMTP id 0876E158F
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 09:11:59 -0700 (PDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17UrPB-0000Yt-00; Wed, 17 Jul 2002 17:11:57 +0100
Date: Wed, 17 Jul 2002 17:11:57 +0100
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	Randolph Chung <randolph@tausq.org>,
	HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] 2.4.19-rc1-ac6 Merge pa55: #error ...?
Message-ID: <20020717171157.F13352@parcelfarce.linux.theplanet.co.uk>
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk> <1026913104.3d357350a4057@webmail.tiscalinet.be> <20020717144543.A13352@parcelfarce.linux.theplanet.co.uk> <1026914852.3d357a24c4a4a@webmail.tiscalinet.be> <20020717142915.GG641@tausq.org> <1026922060.5709.148.camel@irongate.swansea.linux.org.uk> <20020717150349.GN8724@tausq.org> <1026925311.5709.153.camel@irongate.swansea.linux.org.uk> <20020717165722.E13352@parcelfarce.linux.theplanet.co.uk> <1026922139.3d35969bd5ebf@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1026922139.3d35969bd5ebf@webmail.tiscalinet.be>; from joel.soete@freebel.net on Wed, Jul 17, 2002 at 06:08:59PM +0200
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

On Wed, Jul 17, 2002 at 06:08:59PM +0200, joel.soete@freebel.net wrote:
> Quoting Matthew Wilcox <willy@debian.org>:
> > iirc this was what broke me when trying to merge to marcelo before.
> > someone deleted a line that we'd already deleted or something...
> 
> IIRC too
> 
> Remember:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2002-January/015290.html

um, this is to do with O(1) scheduler.  has nothing to do with
asm-parisc/pg{alloc,table}.h

-- 
Revolutions do not require corporate support.
