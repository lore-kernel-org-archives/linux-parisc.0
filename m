Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3CD234866
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 08:21:44 -0600 (MDT)
Date: Thu, 29 Aug 2002 16:21:41 +0200
Message-ID: <3D53B3B700008876@ocpmta1.be.tiscali.com>
In-Reply-To: <3D53B3B700008591@ocpmta1.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
To: parisc-linux@lists.parisc-linux.org
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

Well it does not seems to be the right place of the problem :(

I try to reproduce with the following simple C example:
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

and compile with same gcc option (i.e. gcc -ggdb -O2 -Wall -fPIC ) and the
problem is not reproduced?

Any idea?

Thanks in advance for additional advise,
    Joel

>-- Original Message --
>From: jsoe0708@tiscali.be
>Subject: RE: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
>To: parisc-linux@lists.parisc-linux.org
>Date: Thu, 29 Aug 2002 11:51:36 +0200
>
>
>Hey,
>
>I am lucky.
>
>A ^C during a run and I got:
>^C
>Program received signal SIGINT, Interrupt.
>0x4020a0e4 in isa_null_partition_record (p=0x3fe0ff) at checks.c:65
>/usr/src/EVMS/evms-1.0.1/engine/Plugins/defsegmgr/checks.c:65:1603:beg:0x4020a0e4
>
>where I find:
>     60 BOOLEAN isa_null_partition_record(struct partition *p)
>     61 {
>     62     int          i;
>     63     u_int32_t   *uip = (u_int32_t *) p;
>     64
>     65     for (i=0; i<4; i++) {
>     66         if (*uip!=0x00) return FALSE;
>     67     }
>     68
>     69     return TRUE;
>     70 }
>
>So am I right to suspect "u_int32_t   *uip = (u_int32_t *) p;" being the
>actual cause of 'unaligned access' problem?
>
>Thanks in advance for additionnal comments,
>  Joel
>
>>-- Original Message --
>>From: jsoe0708@tiscali.be
>>To: parisc-linux@lists.parisc-linux.org
>>Subject: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
>>Date: Thu, 29 Aug 2002 11:22:45 +0200
>>
>>
>>Hi all,
>>
>>I need to go back to kernel 2.4.18-pa61 and evms-1.0.1 (see problem in
ml:
>>http://lists.parisc-linux.org/pipermail/parisc-linux/2002-August/017368.html
>>with last 1.1.0 evsm release)
>>
>>Kernel build and operate correctly. I so recompile tools with -ggdb gcc
>>option.
>>Then I use ddd to try to debug problem.
>>
>>So I first run without break and got from console:
>>evms_vgscan(7998): unaligned access to 0x0002aaae at ip=0x4020a0e3
>>
>>So I put a break early in main (Ok), relaunch run and try now to insert
>>a breack in gdb window:
>>b *0x4020a0e3
>>
>>Accepted but when 'continue' is launch:
>>warning: Cannot insert breakpoint 2:
>>Cannot access memory at address 0x4020a0e3
>>
>>What do I wrong or what should I better do?
>>
>>Thanks in advance for help,
>>    Joel
>>
>>
>>_______________________________________________
>>parisc-linux mailing list
>>parisc-linux@lists.parisc-linux.org
>>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
