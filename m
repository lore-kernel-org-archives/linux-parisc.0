Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Joel Soete <joel.soete@freebel.net>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, jsoe0708@tiscali.be,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb 
In-Reply-To: Message from Joel Soete <joel.soete@freebel.net>
   of "Sat, 31 Aug 2002 21:23:59 -0000." <3D7133EF.90602@freebel.net>
References: <200208301703.g7UH3TqX029540@hiauly1.hia.nrc.ca>  <3D7133EF.90602@freebel.net> 
Date: Sat, 31 Aug 2002 17:50:15 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020831235015.C3F8D482A@dsl2.external.hp.com>
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

Joel Soete wrote:
> Finaly this trial version of function:
> 
> 
> BOOLEAN isa_null_partition_record(struct partition *p)
> {
>       if (p->boot_ind == 0x00 &&
>           p->head == 0x00 &&
>           p->sector == 0x00 &&
>           p->cyl == 0x00 &&
>           p->sys_ind == 0x00 &&
>           p->end_head == 0x00 &&
>           p->end_sector == 0x00 &&
>           p->end_cyl == 0x00 &&
>           p->start_sect == 0x00 &&
>           p->nr_sects == 0x00 )
>           return TRUE;

Since start_sect and nr_sects are ints, this code will also generate an
"unaligned data reference fault" like the original code did. You need
to find the origin of "struct partition *p" when the address is un-aligned.

grant
