Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 373A84829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 06:46:35 -0700 (MST)
Date: Fri, 10 Jan 2003 14:45:57 +0100
Message-ID: <3E1AA8D5000009DC@ocpmta8.freegates.net>
In-Reply-To: <3E1AA8D500000877@ocpmta8.freegates.net>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] unaligned accesses
To: "Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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
>From: jsoe0708@tiscali.be
>Subject: Re: [parisc-linux] unaligned accesses
>To: "Randolph Chung" <randolph@tausq.org>
>Cc: parisc-linux@lists.parisc-linux.org
>Date: Fri, 10 Jan 2003 09:24:40 +0100
>
>
>
>>-- Original Message --
>>Date: Thu, 9 Jan 2003 23:36:59 -0800
>>From: Randolph Chung <randolph@tausq.org>
>>To: jsoe0708@tiscali.be
>>Cc: parisc-linux@lists.parisc-linux.org
>>Subject: Re: [parisc-linux] unaligned accesses
>>Reply-To: Randolph Chung <randolph@tausq.org>
>>
>>
>...
>>> hmmm buggy: not always, the triky case is when you have to access to
>those
>>> kind of data encapsulated into a structure. I do not yet find any wor=
karound
>>> or how to fix this kind of pb. Any idea (gcc-3.3?)?
>>
>>eh? what do you mean?
>>
>well I will try to find back the example I encounter (somewhere in jfs-1=
.0.23
>IIRC)
>
Yes here it was in evms(1.1.0 since the bug was fix but it is still a sam=
ple
:-)

[this small example was composed of code coming from evms-1.1.0]
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
    u_int32_t   *uip =3D (u_int32_t *) p;

    for (i=3D0; i<4; i++) {
        if (*uip!=3D0x00) return FALSE;
    }

    return TRUE;
}

int main(int argc, char * * argv, char * * env) {

    struct partition p1, p2;

    p1.boot_ind=3D0;
    p1.head=3D0;
    p1.sector=3D0;
    p1.cyl=3D0;
    p1.sys_ind=3D0;
    p1.end_head=3D0;
    p1.end_sector=3D0;
    p1.end_cyl=3D0;
    p1.start_sect=3D0;
    p1.nr_sects=3D0;
 
    printf("Is that p1 is a null partition: %u\n", isa_null_partition_rec=
ord(&p1));

    p2.boot_ind=3D1;
    p2.head=3D2;
    p2.sector=3D3;
    p2.cyl=3D4;
    p2.sys_ind=3D5;
    p2.end_head=3D6;
    p2.end_sector=3D7;
    p2.end_cyl=3D8;
    p2.start_sect=3D9;
    p2.nr_sects=3D10;
 
    printf("Is that p2 is a null partition: %u\n", isa_null_partition_rec=
ord(&p2));
    return 0;
}

Unfortunately this doesn't reproduce the actual problem of which I save
the following traces (from the evms_vgscan 1.1.0: once again this was fix=

since next release):
...
(isa_valid_partition_record) file checks.c
part.start_sect add: 0x27116
part.start_sect    : 0
part.nr_sects   add: 0x2711a
part.nr_sects      : 0
p            add: 0x2710e
p.boot_ind   add: 0x2710e
p.head       add: 0x2710f
p.sector     add: 0x27110
p.cyl        add: 0x27111
p.sys_ind    add: 0x27112
p.end_head   add: 0x27113
p.end_sector add: 0x27114
p.end_cyl    add: 0x27115
p.start_sect add: 0x27116
p.start_sect    : 0
p.nr_sects   add: 0x2711a
p.nr_sects      : 0
p            add: 0x2710e
p.boot_ind   add: 0x2710e
p.head       add: 0x2710f
p.sector     add: 0x27110
p.cyl        add: 0x27111
p.sys_ind    add: 0x27112
p.end_head   add: 0x27113
p.end_sector add: 0x27114
p.end_cyl    add: 0x27115
p.start_sect add: 0x27116
p.start_sect    : 0
p.nr_sects   add: 0x2711a
p.nr_sects      : 0
...

in which we can see that p.start_sect (an int) address (0x27166 =3D=3D 16=
0102)
is not well align (160102/4=3D40025.5).

HTH,
    Joel


********************************************
Promo Tiscali ADSL: 35 Euros/mois, 1er mois et activation =3D 0 Euro http=
://adsl.tiscali.be
