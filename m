Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 586ED482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 03:15:07 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id DE4E4B00C; Fri, 21 Sep 2001 10:14:07 +0100 (BST)
Date: Fri, 21 Sep 2001 10:14:07 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: =?iso-8859-1?Q?Andreas_H=E4rtel?= <andreas@malcolm.in-chemnitz.de>
Cc: "Parisc-Linux (E-Mail)" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 712/60 boots fine
Message-ID: <20010921101407.A24511@linuxcare.com>
References: <000401c14278$c79760e0$0350a8c0@genesis>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <000401c14278$c79760e0$0350a8c0@genesis>; from andreas@malcolm.in-chemnitz.de on Fri, Sep 21, 2001 at 10:38:24AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 21, 2001 at 10:38:24AM +0200, Andreas Härtel wrote:
> Hi,
> 
> my 712 is running now. I've found my own mistake after many hours...
> 
> It is difficult to understand for a newbie, that PALO needs file system type
> 'F0' but this type is unknown by fdisk.

Partition type F0, not a file system type.  Recent fdisk versions do
know F0 as "Linux/PA-RISC boot".

> Or the 2. mistake, the partition where vmlinux is located must be lower or
> equal 2 GByte.

Yes, that has caught me too in the past, I guess it should be
checked by palo or the installer.

Richard
