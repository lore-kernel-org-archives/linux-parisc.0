Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88E0F483F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Aug 2002 17:55:36 -0600 (MDT)
Date: Fri, 30 Aug 2002 16:57:06 -0700
From: Randolph Chung <randolph@tausq.org>
To: Will Newton <will@misconception.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64 byte alignment
Message-ID: <20020830235705.GD14634@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <E17kvMv-0002G4-00.2002-08-31-00-40-01@cmailg2.svr.pol.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E17kvMv-0002G4-00.2002-08-31-00-40-01@cmailg2.svr.pol.co.uk>
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

> I'm trying to 64 byte align a stack pointer, unfortunately it's not working. 
> Here is my code:
> 
>         ldi 0x03f,%r21                  ; Load mask (b0111111)
>         and,<> %r3,%r21,%r21            ; Check alignment
>         addi 64,%r3,%r3                 ; If not aligned round up
>         depwi 0x0,31,6,%r3               ; Clear low order bits
> 
> Basically the idea is:
>  and the low 6 bits with a mask to see if any are set.
>  if any are set, add 64 and clear the low order bits
> 
> I may be doing something horribly ignorant here, but PA-RISC assembly is not 
> the most widely documented of things. :)

nullification only applies to one instruction. you probably need a
branch there.

as for documentation, the entire intruction set is documented for pa1.1
and 2.0 on the hp web site:

http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,958!1!253,00.html

http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,959,00.html

horrid link names :-(

another good way to do this is to write what you want in C, and tell gcc
to tell you what you want :-)


input: r26, r20 is scratch

        extru %r26,31,6,%r20
        comib,=,n 0,%r20,.L2
        ldo 64(%r26),%r26
        depi 0,31,6,%r26
.L2:
        /* ... */

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
