Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0099483C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Jun 2002 08:13:26 -0600 (MDT)
To: neil@gcc.gnu.org, gcc-bugs@gcc.gnu.org, gcc-prs@gcc.gnu.org,
	joel.soete@freebel.net, neil@gcc.gnu.org, gcc-gnats@gcc.gnu.org,
	neil@gcc.gnu.org
Message-ID: <1025273580.3d1c6eec17b64@webmail.tiscalinet.be>
Date: Fri, 28 Jun 2002 16:13:00 +0200 (CEST)
From: joel.soete@freebel.net
Cc: gcc-bugs@gcc.gnu.org, gcc-prs@gcc.gnu.org,
	joel.soete@freebel.net, neil@gcc.gnu.org
References: <20020628063144.498.qmail@sources.redhat.com>
In-Reply-To: <20020628063144.498.qmail@sources.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Re: preprocessor/7138: gcc-3.2 failed to compile kernel
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

Quoting neil@gcc.gnu.org:

> Synopsis: gcc-3.2 failed to compile kernel
> 
> State-Changed-From-To: analyzed->closed
> State-Changed-By: neil
> State-Changed-When: Thu Jun 27 23:31:44 2002
> State-Changed-Why:
>     Fixed.  Please let me know if it doesn't work for you (unlikely).
> 
> http://gcc.gnu.org/cgi-bin/gnatsweb.pl?cmd=view%20audit-trail&database=gcc&pr=7138
> 
> 
Hi Neil,

This seems to be fixed but (just for info) another problem at the same place:

gcc -D__KERNEL__ -I/Develop/parisc-linux/src/linux-2.4.18-pa40/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing
-fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
-mschedule=7100   -DKBUILD_BASENAME=cache  -c -o cache.o cache.c
gcc -D__ASSEMBLY__ -traditional -D__KERNEL__
-I/Develop/parisc-linux/src/linux-2.4.18-pa40/include  -c -o pacache.o pacache.S
/Develop/parisc-linux/src/linux-2.4.18-pa40/include/asm/pgtable.h: Assembler
messages:
/Develop/parisc-linux/src/linux-2.4.18-pa40/include/asm/pgtable.h:45: Fatal
error: Unknown opcode: `printk("%s:%d: bad pte %08lx.\n",
"/Develop/parisc-linux/src/linux-2.4.18-pa40/include/asm/pgtable.h",45,pte_val(e))'
make[1]: *** [pacache.o] Error 1
make[1]: Leaving directory
`/Develop/parisc-linux/src/linux-2.4.18-pa40/arch/parisc/kernel'
make: *** [_dir_arch/parisc/kernel] Error 2


But that will be another story (next 2 weeks i will be on hollidays :))

Many thanks Neil for your attention,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
