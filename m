Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 172F14829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Sep 2002 02:54:57 -0600 (MDT)
Date: Mon, 2 Sep 2002 10:47:59 +0200
Message-ID: <3D3815BD0000A476@ocpmta5.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb 
To: "Grant Grundler" <grundler@dsl2.external.hp.com>,
	"Joel Soete" <joel.soete@freebel.net>
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

>-- Original Message --
>To: Joel Soete <joel.soete@freebel.net>
>Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, jsoe0708@tiscali.be,
>	parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
>
>From: Grant Grundler <grundler@dsl2.external.hp.com>
>Date: Sat, 31 Aug 2002 17:50:15 -0600
>
>
>Joel Soete wrote:
>> Finaly this trial version of function:
>>
>>
>> BOOLEAN isa_null_partition_record(struct partition *p)
>> {
>>       if (p->boot_ind == 0x00 &&
>>           p->head == 0x00 &&
>>           p->sector == 0x00 &&
>>           p->cyl == 0x00 &&
>>           p->sys_ind == 0x00 &&
>>           p->end_head == 0x00 &&
>>           p->end_sector == 0x00 &&
>>           p->end_cyl == 0x00 &&
>>           p->start_sect == 0x00 &&
>>           p->nr_sects == 0x00 )
>>           return TRUE;
>
>Since start_sect and nr_sects are ints, this code will also generate an
>"unaligned data reference fault" like the original code did.

Trust me it does not? (it works fine)

>You need
>to find the origin of "struct partition *p" when the address is un-aligned.
>
Very hard to define:
a. the previous code works (again all odds)
b. the following trial code:
"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

typedef u_int8_t  BOOLEAN;

#ifndef TRUE
  #define TRUE  1
#endif
#ifndef FALSE
  #define FALSE 0
#endif

struct partition {
    unsigned char boot_ind;     /* 0x80 - active */
    unsigned char head;     /* starting head */
    unsigned char sector;       /* starting sector */
    unsigned char cyl;      /* starting cylinder */
    unsigned char sys_ind;      /* What partition type */
    unsigned char end_head;     /* end head */
    unsigned char end_sector;   /* end sector */
    unsigned char end_cyl;      /* end cylinder */
    unsigned int start_sect;    /* starting sector counting from 0 */
    unsigned int nr_sects;      /* nr of sectors in partition */
};

BOOLEAN isa_null_partition_record(struct partition *p)
{
    int          i;
    u_int32_t   *uip = (u_int32_t *) p;

    for (i=0; i<4; i++) {
        if (*uip!=0x00) return FALSE;
    }

    return TRUE;
}

int main(int argc, char * * argv, char * * env) {

    struct partition p1, p2;

    p1.boot_ind=0;
    p1.head=0;
    p1.sector=0;
    p1.cyl=0;
    p1.sys_ind=0;
    p1.end_head=0;
    p1.end_sector=0;
    p1.end_cyl=0;
    p1.start_sect=0;
    p1.nr_sects=0;

    printf("Is that p1 is a null partition: %u\n", isa_null_partition_record(&p1));

    p2.boot_ind=1;
    p2.head=2;
    p2.sector=3;
    p2.cyl=4;
    p2.sys_ind=5;
    p2.end_head=6;
    p2.end_sector=7;
    p2.end_cyl=8;
    p2.start_sect=9;
    p2.nr_sects=10;

    printf("Is that p2 is a null partition: %u\n", isa_null_partition_record(&p2));
    return 0;
}
"
did not reproduce the problem.


Even if in the previous code, I replace:
BOOLEAN isa_null_partition_record(struct partition *p)
{
    int          i;
    u_int32_t   *uip = (u_int32_t *) p;

    for (i=0; i<4; i++) {
        if (*uip!=0x00) return FALSE;
    }

    return TRUE;
}
by
extern BOOLEAN isa_null_partition_record(struct partition *p);

and also link it with the original library containing isa_null_partition_record,
I can no more reproduce the problem.

The only difference I can notice is that 'isa_null_partition_record' is
not directly used by evms tools but through modules loaded at run time (the
cause of gdb debug difficulties) (or am I wrong and a subtil detail escape
to my attention)?

What can I do to analyse this problem? (printing all p addresses and its
elements
during a run with the original code and compare with a run with modified
code?)

Thanks again for attention and help,
    Joel
