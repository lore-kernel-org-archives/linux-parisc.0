Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 233044A18
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Jan 2001 18:36:57 -0700 (MST)
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id SAA23370
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 18:32:51 -0700
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by palrel1.hp.com (Postfix) with ESMTP id B725B1F
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 17:08:30 -0800 (PST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA15859;
	Wed, 31 Jan 2001 12:01:16 +1100
Date: Wed, 31 Jan 2001 12:01:16 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
Cc: parisc-linux@puffin.external.hp.com,
	Jeffrey A Law <law@redhat.com>
Subject: Re: [parisc-linux] Weird compile problems
In-Reply-To: <Pine.LNX.4.21.0101310956430.19209-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0101311139160.19209-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 31 Jan 2001, Alan Modra wrote:

> and I currently have a ld.so.1 that segfaults.

r19 is being trashed.  It's a compiler bug.  One I added too. :-(

At least, it's to do with the new scheme of allowing gcc to allocate a
register to save r19 rather than trying to use a fixed register.  From a
quick glance over disassembled code, it seems that inline functions try
to restore r19 from a register that has never been initialised.

Alan
-- 
Linuxcare.  Support for the Revolution.
