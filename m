Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E85C9482E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Nov 2002 12:10:11 -0700 (MST)
Message-Id: <200211151910.gAFJA2Sv014896@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [2.5] next issues ...
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Fri, 15 Nov 2002 14:10:01 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bzeeb-lists@lists.zabbadoz.net,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021115175032.GD5673@systemhalted> from "Carlos O'Donell" at Nov 15, 2002 12:50:32 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> I noticed that your 'uname -a' says you compiled the kernel with gcc-3.2.
> AFAIK we have yet to build a kernel with gcc-3.2 that survives network 
> traffic. Perhaps try building the kernel with gcc 3.1 or 3.0? 

3.1.1 and 3.2 are identical except for a change in C++ abi, so as far
as kernel building goes they should be the same.  3.3 has a small struct
ABI fix (affects passing of 5-7 byte structs by value), improved long calls
and a workaround for a linker bug affecting PA 2.0 float loads.  If I
was picking, I would go with the current mainline 3.3 or the debian 3.0.

My impression from what Joel has said is that the problem is bad coding
rather than an actual gcc problem.  However, up to now, nobody has been
able to provide a precise analysis of what's going on.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
