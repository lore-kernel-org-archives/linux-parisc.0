Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD7754829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Aug 2002 16:01:58 -0600 (MDT)
Date: Sun, 4 Aug 2002 17:59:56 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: James Srinivasan <james_srinivasan@yahoo.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HIL Mouse device cannot be opened
Message-ID: <20020804215956.GF19482@systemhalted>
References: <20020804211706.43184.qmail@web11201.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020804211706.43184.qmail@web11201.mail.yahoo.com>
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

> I've followed the HOWTO for using a HIL mouse with
> XFree86 on my Apollo 715/33 but get the error message:
> 
> xf86OpenSerial: Cannot open device /dev/input/mice No
> such device
> 
> when executing startx. Indeed, cat /dev/input/mice
> also gives "No such device".
> 
> I upgraded the kernel using apt-get - does the 2.4.18
> kernel available through this method support the HIL
> drivers?
> 
> Many Thanks,
> 
> James

Double check that you have:

- When using devfs
	= Enabled input layer support in the kernel
- When not using devfs
	= Have the device node entries for /dev/input/*
	= And enabled input layer support in the kernel.

c.
