Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id A87E6482E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Aug 2003 09:37:37 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali)
	id 19kmnI-0003Ex-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 07 Aug 2003 17:35:12 +0200
Date: Thu, 7 Aug 2003 17:37:35 +0200
Message-ID: <3F2E2C7700000FE5@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] a fast fls also for 2.6?
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

Hi pa,

well as last 2.6 doesn't yet boot on my b2k and having any chance to grab
any debug info (I tried 32bits and 64bits kernel: same results. And only
TOC just refer to unrelevant info. OTC it seems to works fine on the b180.
I really don't know where to look for this bug?), I tried to understand better
Lamont's Fastffs code. To verify that I actualy understand it, I tried this
Fast_fls:

#include <stdio.h>
#include <limits.h>

int generic_fls(int x)
{
	int r = 32;

	if (!x)
		return 0;
	if (!(x & 0xffff0000u)) {
		x <<= 16;
		r -= 16;
	}
	if (!(x & 0xff000000u)) {
		x <<= 8;
		r -= 8;
	}
	if (!(x & 0xf0000000u)) {
		x <<= 4;
		r -= 4;
	}
	if (!(x & 0xc0000000u)) {
		x <<= 2;
		r -= 2;
	}
	if (!(x & 0x80000000u)) {
		x <<= 1;
		r -= 1;
	}
	return r;
}

int PseudoFast_fls(int x)
{
/*
    Rewritte off generic_fls to mimic what would be done in asm
    (just as proof of concept)
 */

	int r = 1;

	if (!x)
		return 0;
	if (!(x & 0xffff0000u))
		x <<= 16;
        else
		r += 16;
	if (!(x & 0xff000000u))
		x <<= 8;
        else
		r += 8;
	if (!(x & 0xf0000000u))
		x <<= 4;
        else
		r += 4;
	if (!(x & 0xc0000000u))
		x <<= 2;
        else
		r += 2;
	if (!(x & 0x80000000u))
		x <<= 1;
        else
		r += 1;
	return r;
}

int __fls(int x)
{
	int ret;
	__asm__(" ldi    1,%1\n"
		" extru,<>  %0,15,16,%%r0\n"
		" zdep,TR  %0,15,16,%0\n"
		" addi     16,%1,%1\n"
		" extru,<>  %0,7,8,%%r19\n"
		" zdep,TR  %0,23,24,%0\n"
		" addi     8,%1,%1\n"
		" extru,<>  %0,3,4,%%r19\n"
		" zdep,TR  %0,27,28,%0\n"
	 	" addi     4,%1,%1\n"
		" extru,<>  %0,1,2,%%r19\n"
		" zdep,TR  %0,29,30,%0\n"
		" addi     2,%1,%1\n"
		" extru,=  %0,0,1,%%r19\n"
		" addi     1,%1,%1\n"
		: "=r" (x), "=r" (ret)
		: "0" (x), "1" (ret));
	return ret;
}

int Fastfls(int x)
{
	int ret;
	if (!x)
		return 0;
	return (__fls(x));
}

main()
{
	unsigned int i;

	for (i=0; i<0xffffffffU; i++) {
/*		if (generic_fls(i) != PseudoFast_fls(i)) */
		if (generic_fls(i) != Fastfls(i))
			printf ("Problem with i = %#010x (%d)\n", i, i);
	}
}

Cheers,
    Joel

PS: Don not hesitate to let me know if you would like that I make a patch
with this stuff

------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
