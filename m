Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id A76CA489E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 14:03:44 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1EC96B00C; Mon, 24 Sep 2001 21:02:22 +0100 (BST)
Date: Mon, 24 Sep 2001 21:02:22 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Sonny Cook <sonny@aspersion.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel 2.5.9-pa24 won't boot 735/125
Message-ID: <20010924210222.J5051@linuxcare.com>
References: <Pine.LNX.4.33.0109201328390.14604-100000@lefou>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0109201328390.14604-100000@lefou>; from sonny@aspersion.org on Thu, Sep 20, 2001 at 01:33:09PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 20, 2001 at 01:33:09PM -0600, Sonny Cook wrote:
> Hi,
> I just tried my hand at cross compiling the parisc-linux kernel on my x86
> box.  Something compiled, so I put the vmlinux on my 735/125 and tried to
> boot it.  It went like this:
> 
...
> At this point, I can't even think where to begin looking for problems.
> Any hints?

Don't know what kernel config you used, but the official 32 bit
kernels use arch/parisc/debian-configs/32.  Might be relevant.
Also, trying serial console might be useful, as Jurriaan suggested.

Richard
