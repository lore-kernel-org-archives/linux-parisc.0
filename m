Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2926482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Apr 2001 17:11:32 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id DBEEAB007; Tue,  3 Apr 2001 00:11:14 +0100 (BST)
Date: Tue, 3 Apr 2001 00:11:14 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010403001114.F9198@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] request_region()
List-ID: <linux-parisc.vger.kernel.org>

My 715/old, with a cvs head kernel, has no entries in /proc/ioports.
If I change our IO_SPACE_LIMIT in io.h from 0x00ffffff to 0xfffffff,
I get

apollo:~# cat /proc/ioports 
f0800000-f08fffff : ASP
  f0800000-f0800013 : reserved
  f0800020-f0800020 : led_data
  f0824800-f0824802 : parport0
  f0826000-f0826010 : i82596
apollo:~# 


(others won't see the i82596 entry, that is local to my tree)


So, normally they don't show up because their addresses are above
IO_SPACE_LIMIT, and luckily none of them check for error returns
from request_region().

I also have:

apollo:~# cat /proc/iomem 
f0825100-f082513f : sim700


Should all that ASP related stuff be doing a request_mem_region()
so they show up in /proc/iomem rather than /proc/ioports?

If so, does that have implications for EISA devices which will appear
under ASP, where we might want to use exisiting drivers that do
request_region()?

from io.h:

/* IO Port space is :      BBiiii   where BB is HBA number. */
#define IO_SPACE_LIMIT 0x00ffffff


Richard
