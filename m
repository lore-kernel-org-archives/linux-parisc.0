Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C042482D
	for <parisc-linux@parisc-linux.org>; Fri,  1 Aug 2003 11:14:33 -0600 (MDT)
Date: Fri, 1 Aug 2003 11:14:26 -0600
To: Joel Soete <jsoe0708@tiscali.be>
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	parisc-linux@parisc-linux.org, lamont@hp.com
Subject: Re: [parisc-linux] backport bitops.h stuff
Message-ID: <20030801171426.GA18508@security.hp.com>
References: <1059753543.2092.30.camel@mulgrave> <3F29178A000004FF@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F29178A000004FF@ocpmta7.freegates.net>
From: lamont@hp.com (LaMont Jones)
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

On Fri, Aug 01, 2003 at 07:09:37PM +0200, Joel Soete wrote:
> > Actually, this patch looks decidedly non-optimal.

Here's a more optimal ffs() routine for hppa, along with the
output from the test program...  Should run in ~15 states on
just about anything [yes, it's that lock-stepped that it'll
take about 15 states on PA-8000's as well.. :-(]

Freshly coded, since the hp-ux version (which I can't find
anymore) looked for most significant set bit, not least.

lamont

#include <stdio.h>

int fastffs(int x)
{
	int ret;
	__asm__(" ldi		31,%1\n"
		" extru,<>	%0,31,16,%%r0\n"
		" extru,TR	%0,15,16,%0\n"
		" addi		-16,%1,%1\n"
		" extru,<>	%0,31,8,%%r0\n"
		" extru,TR	%0,23,8,%0\n"
		" addi		-8,%1,%1\n"
		" extru,<>	%0,31,4,%%r0\n"
		" extru,TR	%0,27,4,%0\n"
		" addi		-4,%1,%1\n"
		" extru,<>	%0,31,2,%%r0\n"
		" extru,TR	%0,29,2,%0\n"
		" addi		-2,%1,%1\n"
		" extru,=	%0,31,1,%%r0\n"
		" addi		-1,%1,%1\n"
		: "=r" (x), "=r" (ret)
		: "0" (x), "1" (ret));
	return ret;
}
doffs(x)
{
	printf("fastffs(%x)==%d\n",x,fastffs(x));
}
main()
{
	int i;
	for (i=0;i<5;i++)
		doffs(i);
	for (;i;i<<=1)
		doffs(i);
}


ffs(0)==31
ffs(1)==0
ffs(2)==1
ffs(3)==0
ffs(4)==2
ffs(5)==0
ffs(a)==1
ffs(14)==2
ffs(28)==3
ffs(50)==4
ffs(a0)==5
ffs(140)==6
ffs(280)==7
ffs(500)==8
ffs(a00)==9
ffs(1400)==10
ffs(2800)==11
ffs(5000)==12
ffs(a000)==13
ffs(14000)==14
ffs(28000)==15
ffs(50000)==16
ffs(a0000)==17
ffs(140000)==18
ffs(280000)==19
ffs(500000)==20
ffs(a00000)==21
ffs(1400000)==22
ffs(2800000)==23
ffs(5000000)==24
ffs(a000000)==25
ffs(14000000)==26
ffs(28000000)==27
ffs(50000000)==28
ffs(a0000000)==29
ffs(40000000)==30
ffs(80000000)==31
