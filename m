Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id DAA25223
	for <parisc-linux@puffin.external.hp.com>; Sun, 28 Jan 2001 03:13:56 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id VAA24625;
	Sun, 28 Jan 2001 21:15:57 +1100
Date: Sun, 28 Jan 2001 21:15:57 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John Marvin <jsm@udlkern.fc.hp.com>
cc: parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Usage of __attribute__?
In-Reply-To: <200101270948.CAA00365@udlkern.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0101282110510.24446-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 27 Jan 2001, John Marvin wrote:

> If I directly declare the type as follows:
> 
>     typedef int _lt_spinlock_t __attribute__((aligned(16)));
> 
> then EVERY int that follows has the aligned 16 attribute, e.g. just
> declaring "int tmp;" gives tmp a 16 byte alignment. So, is that what
> you would expect from my above declaration?

Hi John,
  I don't see this behaviour.  I tried

typedef int _lt_spinlock_t __attribute__ ((aligned (16)));
int a;
int b;
_lt_spinlock_t c;
int d;

and got

	.comm	a,4,4
	.comm	b,4,4
	.comm	c,4,16
	.comm	d,4,4

ie. as expected.  Can you post a testcase and version of gcc you used?

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
