Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2B05482A
	for <parisc-linux@parisc-linux.org>; Mon, 22 Oct 2001 12:54:59 -0600 (MDT)
Date: Mon, 22 Oct 2001 20:53:07 +0200 (CEST)
From: Jochen Friedrich <jochen+parisc-linux@scram.de>
To: Alan Modra <amodra@bigpond.net.au>
Cc: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Latest debian binutils broken?
In-Reply-To: <20011022095826.J1037@bubble.sa.bigpond.net.au>
Message-ID: <Pine.LNX.4.33.0110222052030.30215-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Alan,

On Mon, 22 Oct 2001, Alan Modra wrote:

> ldd as ?

hp720:~# ldd /usr/bin/as
        libopcodes-2.11.92.0.7.so => /usr/lib/libopcodes-2.11.92.0.7.so 
(0x4002b000)
        libbfd-2.11.92.0.7.so => /usr/lib/libbfd-2.11.92.0.7.so 
(0x40049000)
        libc.so.6 => /lib/libc.so.6 (0x400b3000)
        /lib/ld.so.1 => /lib/ld.so.1 (0x40000000)
hp720:~#

All i did was to apt-get upgrade my box to the latest level...

Cheers,
Jochen
