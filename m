Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0F4A482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jan 2002 13:21:25 -0700 (MST)
Date: Wed, 16 Jan 2002 21:20:12 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Daniel Engstrom <5116@telia.com>
Cc: linux-tr@linuxtr.net,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] IBM TR patch
In-Reply-To: <20020115231052.A4018@zaphod.halden.lillfab.se>
Message-ID: <Pine.LNX.4.43.0201162119070.16072-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Daniel,

> I think the driver was correct. The i/o layer should not try to byteswap
> the io requests, because it can not second-guess what the driver is doing.

I guess the 68000 code is the reference here as it was the first BE port, 
and they do the byteswap, as well.

--jochen
