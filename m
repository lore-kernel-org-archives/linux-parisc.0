Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2F1C482E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Nov 2002 15:18:19 -0700 (MST)
Date: Fri, 15 Nov 2002 22:17:23 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] [2.5] next issues ...
In-Reply-To: <200211151910.gAFJA2Sv014896@hiauly1.hia.nrc.ca>
Message-ID: <Pine.BSF.4.44.0211152207240.39295-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 15 Nov 2002, John David Anglin wrote:

> 3.1.1 and 3.2 are identical except for a change in C++ abi, so as far
> as kernel building goes they should be the same.  3.3 has a small struct

ok.

> ABI fix (affects passing of 5-7 byte structs by value), improved long calls
> and a workaround for a linker bug affecting PA 2.0 float loads.  If I

no PA 2.0 here.

> was picking, I would go with the current mainline 3.3 or the debian 3.0.

ok, how and where to get 3.3 from ?
	- subversions.gnu.org cvs ?
	- cvs.parisc-linux.org cvs ? (looks older)

I am going to dig into this.

What about binutils 2.13.90.0.10-2 ... do you know what changes where
there from previous versions ?

Ok, first thing I am going to do is build with gcc 3.0.4 and see if it
works.

all native building btw. here.

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
