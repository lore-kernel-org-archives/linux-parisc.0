Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0997C482E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Nov 2002 09:34:50 -0700 (MST)
Date: Thu, 14 Nov 2002 08:37:53 -0800
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: phi <phi@hpfrcu81.france.hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] .PARISC.unwind where is it for pa2.0w?
Message-ID: <20021114163753.GI8261@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <3DD2C4E5.7000001@gmx.at> <20021113215411.GB32441@beavis.ybsoft.com> <3DD3A56F.665A0FB4@hpfrcu81.france.hp.com> <20021114133326.W30392@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021114133326.W30392@parcelfarce.linux.theplanet.co.uk>
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

> > Where is the "Section: .PARISC.unwind" for palinux2.0w doing an elfdump on the
> > kernel I don't see it?
> > 
> > Is it implemented differently
> 
> looks like we link it into the .text section:

in the kdb branch this was moved (perhaps more appropriately) to the
data section, and surrounded by markers so that you can find the
begin/end. i will add this change to the 2.5 branch. In fact, it
probably should be in the rodata section....

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
