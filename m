Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 892EE4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 01:21:23 -0600 (MDT)
Date: Wed, 4 Sep 2002 09:14:19 +0200
Message-ID: <3D3815BD0000B40C@ocpmta5.be.tiscali.com>
In-Reply-To: <20020903203317.C30834829@dsl2.external.hp.com>
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

>jsoe0708@tiscali.be wrote:
>...
>> And here is some data of my analyse:
>> 
>> First surprise in the two case (original checks.c and my checks.c with
>only
>> "if (p->boot_ind != 0x00 && ") p addresses are exactly the same here is
>an
>> example:
>
>...
>> with the checks.c.new:
>> p            add: 0x272ee
>> p.boot_ind   add: 0x272ee
>> p.head       add: 0x272ef
>> p.sector     add: 0x272f0
>> p.cyl        add: 0x272f1
>> p.sys_ind    add: 0x272f2
>> p.end_head   add: 0x272f3
>> p.end_sector add: 0x272f4
>> p.end_cyl    add: 0x272f5
>> p.start_sect add: 0x272f6
>> p.nr_sects   add: 0x272fa
>> 
>> What do you think?
>
>checks.c.new will generate a "misaligned access" when "p.start_sect"
>is accessed. 0x272f6 is aligned on 2byte address, not 4 byte.
>Ditto for "p.nr_sects".
>
(now I have understand, well I think :) )

>You sure checks.c.new is referencing 0x272f6 and not something else?

For this I will have to find all call to this function and write p.start_sect
address and content before.

(very tricky problem to surround isn'it ;<) )

>You reviewed dmesg output?

Yes (I have a mincom 'screen' on this system console and I also examine kern.log
as recall Dave)


Many thanks,
    Joel

PS: In the mean time I learn that this bug was already fix by:
BOOLEAN isa_null_partition_record(struct partition *p)
{
    int          i;
    u_int8_t    *uip = (u_int8_t *) p;
    int          psize = sizeof(struct partition);

    for (i=0; i<psize; i++) {
        if (*(uip+i) != 0x00) return FALSE;
    }

    return TRUE;
}

but not yet comited :?
