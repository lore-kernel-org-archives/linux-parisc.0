Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mf2.bredband.net (mf2.lab.bredband.com [195.54.122.120])
	by dsl2.external.hp.com (Postfix) with ESMTP id B96FC482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 18:05:03 -0700 (MST)
Date: Tue, 15 Jan 2002 23:10:52 +0100
From: Daniel Engstrom <5116@telia.com>
To: Jochen Friedrich <jochen@scram.de>
Cc: linux-tr@linuxtr.net,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] IBM TR patch
Message-ID: <20020115231052.A4018@zaphod.halden.lillfab.se>
References: <Pine.LNX.4.43.0201142041450.7418-200000@alpha.bocc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
In-Reply-To: <Pine.LNX.4.43.0201142041450.7418-200000@alpha.bocc.de>; from jochen@scram.de on Mon, Jan 14, 2002 at 20:53:26 +0100
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

On 2002.01.14 20:53 Jochen Friedrich wrote:
> Hi there,
HI
> this patch fixes some endianess issues of the current ibmtr driver. 
> Although the current uses of htons() etc look correct, they are not: the 
> writew/readw API already do the byte swap on big endian machines.
>
I think the driver was correct. The i/o layer should not try to byteswap
the io requests, because it can not second-guess what the driver is doing.

And in the case of the tr driver it now does two swaps for each word it tranfers on
big endian platforms instad of zero.

The ne2000 driver had the same problem, but I removed the swaps from the parisc i/o code 
instad of touching the driver.

/Daniel
-- 
