Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1EF28482B
	for <parisc-linux@parisc-linux.org>; Fri,  2 Nov 2001 09:18:33 -0700 (MST)
To: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
Cc: dan@bigw.org, parisc-linux@parisc-linux.org
Subject: Re: Betr.: [parisc-linux] More Install on C110: Kernel doesn't load... 
In-Reply-To: Your message of "Fri, 02 Nov 2001 12:06:49 +0100."
             <sbe28dc3.046@ms-zrt1>
References: <sbe28dc3.046@ms-zrt1> 
Date: Fri, 02 Nov 2001 09:18:30 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15zh1a-0006SD-00@noam.fc.hp.com>
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

= >Entry 00100000 first 00100000 n 4
= >Segment 0 load 00100000 size 160694 mediaptr 0x1000
= >Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
= >Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
= >Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8
= >
= >Error: read from boot device failed (status = -4)
= >byteio_read: seekread() returned -1 expected 2048
= >Error:  segment 0 read() failed

palo has read thee ELF header by then, but fails to read the first
program segment (0).  It's unusual for things to die here.  The
firmware docs say error -4 is "unrecoverable hardware error".
Perhaps the ISO image got truncated or is shorter than it should be?

	-P

	-P
