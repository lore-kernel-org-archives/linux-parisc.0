Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id AFB2A482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 13:48:53 -0600 (MDT)
Date: Tue, 16 Oct 2001 21:46:01 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Tom <palinux@alaskatech.org>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] EISA support
In-Reply-To: <Pine.LNX.4.33.0110161110310.20693-100000@goliath.alaskatech.org>
Message-ID: <Pine.LNX.4.33.0110162142230.13084-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Tom,

> I've updated my 715/100 to -pa57, which gives me startup messages that the
> Mirage Was EISA BA is recognized.

Similar for 720. Here i got the message:

Mongoose EISA Adapter found at 0xfc000000

An IBM Auto 16/4 Token Ring card is recognized, but doesn't work (instead, 
i randomly get a stack dump during the module load).

Another comment:

parisc_ksyms.c is missing the exports for memcpy_toio and memcpy_fromio.

Cheers,
Jochen
