Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id EFE6E482F
	for <parisc-linux@lists.parisc-linux.org>; Sat, 31 Aug 2002 14:20:02 -0600 (MDT)
Message-ID: <3D7133EF.90602@freebel.net>
Date: Sat, 31 Aug 2002 21:23:59 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
References: <200208301703.g7UH3TqX029540@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

> 
> Because the initial field of the struct is an unsigned char type,
> the cast to uint32_t is wrong.  The code is making implementation
> dependent assumptions.
> 
Finaly this trial version of function:


BOOLEAN isa_null_partition_record(struct partition *p)
{
      if (p->boot_ind == 0x00 &&
          p->head == 0x00 &&
          p->sector == 0x00 &&
          p->cyl == 0x00 &&
          p->sys_ind == 0x00 &&
          p->end_head == 0x00 &&
          p->end_sector == 0x00 &&
          p->end_cyl == 0x00 &&
          p->start_sect == 0x00 &&
          p->nr_sects == 0x00 )
          return TRUE;
      else
          return FALSE;
}

would be more portable and more easy to read and understand :<)

Thanks again for your help,
	Joel
