Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id B29644829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 05:49:01 -0600 (MDT)
Date: Wed, 4 Sep 2002 13:48:47 +0200
Message-ID: <3D53B3B70000AEB5@ocpmta1.be.tiscali.com>
In-Reply-To: <3D3815BD0000B40C@ocpmta5.be.tiscali.com>
From: jsoe0708@tiscali.be
To: "Grant Grundler" <grundler@dsl2.external.hp.com>
Cc: "Joel Soete" <joel.soete@freebel.net>,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] Re: Unaligne access [was: Back to evms-1.0.1 && unaligne access && gdb ]
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

>>jsoe0708@tiscali.be wrote:
>>...
>>> And here is some data of my analyse:
>>> 
>>> First surprise in the two case (original checks.c and my checks.c with
>>only
>>> "if (p->boot_ind != 0x00 && ") p addresses are exactly the same here
is
>>an
>>> example:
>>
>>...
>>> with the checks.c.new:
...
>>
>>checks.c.new will generate a "misaligned access" when "p.start_sect"
>>is accessed. 0x272f6 is aligned on 2byte address, not 4 byte.
>>Ditto for "p.nr_sects".
>>
>(now I have understand, well I think :) )
>
>>You sure checks.c.new is referencing 0x272f6 and not something else?
>
>For this I will have to find all call to this function and write p.start_sect
>address and content before.
>
>(very tricky problem to surround isn'it ;<) )
>
And so here is a test (where an unaligne access did not occurs where it would??):
(isa_valid_partition_record) file checks.c
### before the call ###
part.start_sect add: 0x242a6
part.start_sect    : 9439488   [1]
part.nr_sects   add: 0x242aa
part.nr_sects      : 15791872  [2]
### Into the function isa_null_partition_record() ###
p            add: 0x2429e
p.boot_ind   add: 0x2429e
p.head       add: 0x2429f
p.sector     add: 0x242a0
p.cyl        add: 0x242a1
p.sys_ind    add: 0x242a2
p.end_head   add: 0x242a3
p.end_sector add: 0x242a4
p.end_cyl    add: 0x242a5
p.start_sect add: 0x242a6
p.start_sect    : 9439488      [3]
p.nr_sects   add: 0x242aa
p.nr_sects      : 15791872     [4]

As far as I can see [1] and [3] (as well as [2] and [4]) seems to show that
it point actualy to the same thing.

And here is an other sample:

(isa_valid_partition_record) file checks.c
part.start_sect add: 0x24556
part.start_sect    : 536870912
part.nr_sects   add: 0x2455a
part.nr_sects      : 3768004864
p            add: 0x2454e
p.boot_ind   add: 0x2454e
p.head       add: 0x2454f
p.sector     add: 0x24550
p.cyl        add: 0x24551
p.sys_ind    add: 0x24552
p.end_head   add: 0x24553
p.end_sector add: 0x24554
p.end_cyl    add: 0x24555
p.start_sect add: 0x24556
p.start_sect    : 536870912
p.nr_sects   add: 0x2455a
p.nr_sects      : 3768004864
p            add: 0x2454e
p.boot_ind   add: 0x2454e
p.head       add: 0x2454f
p.sector     add: 0x24550
p.cyl        add: 0x24551
p.sys_ind    add: 0x24552
p.end_head   add: 0x24553
p.end_sector add: 0x24554
p.end_cyl    add: 0x24555
p.start_sect add: 0x24556
p.start_sect    : 536870912
p.nr_sects   add: 0x2455a
p.nr_sects      : 3768004864

Joel



Big Brother Anders  - With Tiscali you will see it all !  Check it up on
 www.tiscali.be/bigbrother
