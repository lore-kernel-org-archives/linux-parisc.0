Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA32152
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Aug 2000 23:20:19 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 10 Aug 2000 23:18:04 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 10 Aug 2000 23:11:00 -0000
Received: (from willy@localhost)
	by vodka.thepuffingroup.com (8.9.3/8.9.3) id SAA14594
	for parisc-linux@thepuffingroup.com; Thu, 10 Aug 2000 18:06:24 -0400
Date: Thu, 10 Aug 2000 18:06:24 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000810180624.J10843@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 64-bit binutils problem
List-ID: <linux-parisc.vger.kernel.org>


ok, i'm in way over my head here.

in arch/parisc64/real/head.S:

        /* And the return address(es) too */
        ldil            L%start_parisc,%r10
        ldo             R%start_parisc(%r10),%r10
        depdi           0, 31, 32, %r10
        mtctl           %r10,%cr18
        ldo             4(%r10),%r10
        mtctl           %r10,%cr18

which (after linking) becomes:

    c0100074:   21 42 28 07     ldil -3fcfb000,r10
    c0100078:   35 4a 09 c0     ldo 4e0(r10),r10
    c010007c:   f5 40 0c 00     depdi 0,31,32,r10
    c0100080:   02 4a 18 40     mtctl r10,pcoq
    c0100084:   35 4a 00 08     ldo 4(r10),r10
    c0100088:   02 4a 18 40     mtctl r10,pcoq

however, C03054E0 is in the middle of gateway_init and start_parisc is
nowhere to be found, except as:

0000000000000000       F *UND*  0000000000000304 start_parisc

which seems rather bogus to me.  i'll put my compiled kernel tree up on
pehc:/home/willy/parisc64/ in a few moments.

p.s.  does anyone want to change the `-3fcfb000' to an unsigned representation?
this would please me more:

    c0100074:   21 42 28 07     ldil ffffffffc0305000,r10
    c0100078:   35 4a 09 c0     ldo 4e0(r10),r10
    c010007c:   f5 40 0c 00     depdi 0,31,32,r10

as it would make it more clear exactly what's going on.


p.p.s.  anyone know why my piece of debug code:

        ldil            0xdecf0000, %r9

is getting assembled as:

    c0100000:   21 20 0f 00     ldil 78000000,r9

? ser pim hpmc dumps show the value 78000008 in r9, so i'm convinced it's
not objdump misdisassembling it.

-- 
Revolutions do not require corporate support.
