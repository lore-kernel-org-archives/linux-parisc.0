Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0FC04844
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Sep 2002 10:09:58 -0600 (MDT)
Date: Tue, 3 Sep 2002 18:02:58 +0200
Message-ID: <3D3815BD0000B0E9@ocpmta5.be.tiscali.com>
In-Reply-To: <20020902172854.C73F44829@dsl2.external.hp.com>
From: jsoe0708@tiscali.be
To: "Grant Grundler" <grundler@dsl2.external.hp.com>
Cc: "Joel Soete" <joel.soete@freebel.net>,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] Unaligne access [was: Back to evms-1.0.1 && unaligne access && gdb ]
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

Hello Grant,

>
>then I'll wager there is padding between the char and int fields
>of that struct.

That is also what I believe to understand.

>
...
>> What can I do to analyse this problem? (printing all p addresses and its
>> elements
>> during a run with the original code and compare with a run with modified
>> code?)
>
>yes. You want to verify the addreses are unaligned.

And here is some data of my analyse:

First surprise in the two case (original checks.c and my checks.c with only
"if (p->boot_ind != 0x00 && ") p addresses are exactly the same here is an
example:
with checks.c.orig:
dmesg
...
evms_vgscan(10137): unaligned access to 0x000272ee at ip=0x4020a2ab

corresponding adresses:
p            add: 0x272ee
p.boot_ind   add: 0x272ee
p.head       add: 0x272ef
p.sector     add: 0x272f0
p.cyl        add: 0x272f1
p.sys_ind    add: 0x272f2
p.end_head   add: 0x272f3
p.end_sector add: 0x272f4
p.end_cyl    add: 0x272f5
p.start_sect add: 0x272f6
p.nr_sects   add: 0x272fa

with the checks.c.new:
p            add: 0x272ee
p.boot_ind   add: 0x272ee
p.head       add: 0x272ef
p.sector     add: 0x272f0
p.cyl        add: 0x272f1
p.sys_ind    add: 0x272f2
p.end_head   add: 0x272f3
p.end_sector add: 0x272f4
p.end_cyl    add: 0x272f5
p.start_sect add: 0x272f6
p.nr_sects   add: 0x272fa

What do you think?

Thanks again for attention and help,
    Joel

PS1: just in case I made error here is the code I add to print addresses:
    printf("p            add: %p\n", p);
    printf("p.boot_ind   add: %p\n", &(p->boot_ind));
    printf("p.head       add: %p\n", &(p->head));
    printf("p.sector     add: %p\n", &(p->sector));
    printf("p.cyl        add: %p\n", &(p->cyl));
    printf("p.sys_ind    add: %p\n", &(p->sys_ind));
    printf("p.end_head   add: %p\n", &(p->end_head));
    printf("p.end_sector add: %p\n", &(p->end_sector));
    printf("p.end_cyl    add: %p\n", &(p->end_cyl));
    printf("p.start_sect add: %p\n", &(p->start_sect));
    printf("p.nr_sects   add: %p\n", &(p->nr_sects));

PS2: If you think it could help you more, I can send you the complete logs
I get from the two runs as well as sources
