Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from delenn.fl.net.au (int-mail.syd.fl.net.au [202.181.0.28])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68EF148AB
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 13:30:35 -0700 (MST)
From: "Duraid Madina" <duraid@fl.net.au>
To: <mkp@mkp.net>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] 'foreign' PCI cards in an rp2430
Date: Sat, 9 Mar 2002 07:30:30 +1100
Message-ID: <000101c1c6e0$1a4dba00$022a17ac@simplex>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <yq1it87w3y8.fsf@austin.mkp.net>
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

Martin wrote:
> I don't think there are high hopes for the 3ware card.  At 
> least not unless you preconfigure it on a PC.

For sure.
 
> Alpha happens to work because its firmware includes a simple 
> x86 simulator that executes the BIOS code on the card.  That 
> way you can configure your disk setup, etc.

Oops, I think I was misleading when I said 3ware 'worked' in Alpha - 3dm
doesn't (of course) and yes, you need to do all array administration
stuff out of the BIOS on a PC.

> We don't have similar functionality on PA-RISC.  So you are 
> limited what can be done from within Linux. 

Well, so long as it can find the array and read/write, I'm set.
 
> Unfortunately the 3ware management utility is 386 
> binary-only. I.e. you can't configure the card once you get 
> Linux up and running either.

I have to admit, I find hardly any need for that tool even in x86 land
;)

	Duraid
