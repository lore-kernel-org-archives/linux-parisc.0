Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6AABF4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 13:07:11 -0700 (MST)
Date: Sat, 9 Nov 2002 12:11:44 -0800
From: Randolph Chung <randolph@tausq.org>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5.46-pa7 boot prob
Message-ID: <20021109201144.GW9563@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.BSF.4.44.0211091923280.32930-100000@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.44.0211091923280.32930-100000@e0-0.zab2.int.zabbadoz.net>
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

In reference to a message from Bjoern A. Zeeb, dated Nov 09:
> run it through ksymoops but got nothing usable. Only
> stack dump was printed...

yeah, we haven't gotten ksymoops to work yet...

> If you need more information please let me know.

In general, a System.map file that corresponds to your kernel is also
needed.

from the reg dump:

> r20-23  00000000 00000000 10029c60 00000001
>  IIR: 0ea01085    ISR: 00000000  IOR: 00000000

it's a null ptr deref...
faulting insn is: ldw 0(sr0,r21),r5
and r21 is 0...

can you either supply a System.map, or look up the 
"iaoq" and "r02" addresses in the register dump and see which function
they are in?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
