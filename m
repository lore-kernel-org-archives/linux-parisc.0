Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc171-bre9.cable.ntl.com [213.105.88.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1111F482A
	for <parisc-linux@parisc-linux.org>; Wed,  9 May 2001 07:26:47 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 8FA4BB007; Wed,  9 May 2001 14:26:11 +0100 (BST)
Date: Wed, 9 May 2001 14:26:11 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] boot-floppies (installer)
Message-ID: <20010509142611.W1840@linuxcare.com>
References: <20010508075325.O1840@linuxcare.com> <20010508153029.R1840@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010508153029.R1840@linuxcare.com>; from rhirst@linuxcare.com on Tue, May 08, 2001 at 03:30:29PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, May 08, 2001 at 03:30:29PM +0100, Richard Hirst wrote:
> ## Don't forget to add /sbin/termwrap to root.bin before you
> ## try to boot from it.

Doh!  termwrap needs adding to the installed system, after install stage
1, but before booting from the disk to run stage 2.

Richard
