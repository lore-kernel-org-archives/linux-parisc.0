Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71413482B
	for <parisc-linux@parisc-linux.org>; Thu,  8 Aug 2002 06:17:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17cmE7-0007fk-00; Thu, 08 Aug 2002 13:17:15 +0100
Date: Thu, 8 Aug 2002 13:17:15 +0100
From: Matthew Wilcox <willy@debian.org>
To: jsoe0708@tiscali.be
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	Matthew Wilcox <willy@debian.org>,
	HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Linux-2.4.19 released
Message-ID: <20020808131715.K24631@parcelfarce.linux.theplanet.co.uk>
References: <1028424964.3483.6.camel@irongate.swansea.linux.org.uk> <3D3815AF00001A61@ocpmta3.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D3815AF00001A61@ocpmta3.be.tiscali.com>; from jsoe0708@tiscali.be on Thu, Aug 08, 2002 at 02:05:05PM +0200
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

On Thu, Aug 08, 2002 at 02:05:05PM +0200, jsoe0708@tiscali.be wrote:
> Just still have some problem with pre1-ac1 because of mingo sched (may be
> solved in 2.5 ?)

yes, 2.5.26 has the O(1) scheduler and (i think) Richard & Randolph got
that working.

-- 
Revolutions do not require corporate support.
