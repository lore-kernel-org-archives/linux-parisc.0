Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mf1.bredband.net (mf1.lab.bredband.com [195.54.122.119])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0F835482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jan 2002 05:22:11 -0700 (MST)
Date: Sat, 19 Jan 2002 13:20:49 +0100
From: Daniel Engstrom <5116@telia.com>
To: Jochen Friedrich <jochen@scram.de>
Cc: Daniel Engstrom <5116@telia.com>, linux-tr@linuxtr.net,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] IBM TR patch
Message-ID: <20020119132049.C21392@zaphod.halden.lillfab.se>
References: <20020115231052.A4018@zaphod.halden.lillfab.se> <Pine.LNX.4.43.0201162119070.16072-100000@alpha.bocc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
In-Reply-To: <Pine.LNX.4.43.0201162119070.16072-100000@alpha.bocc.de>; from jochen@scram.de on Wed, Jan 16, 2002 at 21:20:12 +0100
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

On 2002.01.16 21:20 Jochen Friedrich wrote:
> Hi Daniel,
> 
> > I think the driver was correct. The i/o layer should not try to byteswap
> > the io requests, because it can not second-guess what the driver is doing.
> 
> I guess the 68000 code is the reference here as it was the first BE port, 
> and they do the byteswap, as well.

Do the 68000 port support ISA and PCI buses?

/Daniel
-- 
