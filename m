Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 55DD24829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 10:59:16 -0600 (MDT)
Date: Thu, 29 Aug 2002 18:59:07 +0200
Message-ID: <3D53B3B70000896D@ocpmta1.be.tiscali.com>
In-Reply-To: <200208291428.g7TESm9l024111@hiauly1.hia.nrc.ca>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
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
>Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
>To: jsoe0708@tiscali.be
>From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
>Cc: parisc-linux@lists.parisc-linux.org
>Date: Thu, 29 Aug 2002 10:28:48 -0400 (EDT)
>
>
>> >Program received signal SIGINT, Interrupt.
>> >0x4020a0e4 in isa_null_partition_record (p=0x3fe0ff) at checks.c:65
>
>You can see from the value of p above that it is not properly aligned
>for a 4 byte access.  Put a break on isa_null_partition_record and
>
>cond n p==0x3fe0ff
>
>where n is the breakpoint number of the break at isa_null_partition_record.

As previously, I could not put a break at isa_null_partition_record (function
not define but with ^C I reach to stop recursively in this function and so
for example with p==0x26ece I got p.boot_ind=0 ; p.head=63 ; p.sector=224
; p.cyl=255; ...

p is of type partition define as follow:
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

So anyway there is a bug because I presume that the for loop is there to
scan the 4 int what it doen't do (?) and find another way to say an 'int'
is null ( hmm why not simply 
u_int8_t *uip = (u_int8_t *)p;
for (i=0 ; i<16 ; i++){
    if (*uip+i != 0x00) return FALSE;
}
return TRUE;

what do you think?


>Then, run the program and it should stop at isa_null_partition_record
>when the fault is about to occur.  You will then have to do a bt to
>determine why p is incorrectly aligned (last hex digit should be 0,
>4, 8 or c).

Many thanks,
    Joel
