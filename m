Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 900C6482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 24 Jun 2001 09:21:24 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 84AF8B00C; Sun, 24 Jun 2001 16:21:58 +0100 (BST)
Date: Sun, 24 Jun 2001 16:21:58 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] boot-floppies build status
Message-ID: <20010624162158.M14416@linuxcare.com>
References: <20010623170024.G14416@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010623170024.G14416@linuxcare.com>; from rhirst@linuxcare.com on Sat, Jun 23, 2001 at 05:00:25PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jun 23, 2001 at 05:00:25PM +0100, Richard Hirst wrote:
> Last night an install on my 712 broke during 2nd stage, ran to the
> end, but had never asked for root password, or to create a user, etc.
> Some perl errors flashed by.  Date was 1970... Will try with the newer
> stuff tonight.

We need an up to date build of perl to fix this, see #100557.

Richard
