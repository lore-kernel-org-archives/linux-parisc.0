Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id OAA01366
	for <parisc-linux@puffin.external.hp.com>; Sun, 28 Jan 2001 14:55:41 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id 1F199E3A
	for <parisc-linux@puffin.external.hp.com>; Sun, 28 Jan 2001 16:59:42 -0500 (EST)
Date: Sun, 28 Jan 2001 14:58:27 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200101282158.OAA09549@udlkern.fc.hp.com>
To: alan@linuxcare.com.au, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Usage of __attribute__?
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:
>   I don't see this behaviour.  I tried
>
> typedef int _lt_spinlock_t __attribute__ ((aligned (16)));
> int a;
> int b;
> _lt_spinlock_t c;
> int d;
>
> and got
>
>         .comm   a,4,4
>         .comm   b,4,4
>         .comm   c,4,16
>         .comm   d,4,4
>
> ie. as expected.  Can you post a testcase and version of gcc you used?

OK, I was just writing a test case on my pc and hadn't bothered to test it
on hppa. The compiler on my PC was version 2.95.2. The problem doesn't
exist on my native hppa gcc, which is version 2.96. So, although it is
possible that the bug might be 386 only, most likely the bug was machine
independent and was fixed between 2.95.2 and 2.96. I guess I just
don't expect to see many compiler bugs on 386, since it has a lot more
exposure.

Here's the test case:

typedef int _lt_spinlock_t __attribute__((aligned(16)));

struct test
{
	int i1;
	int i2;
	int i3;
	int i4;
};

main()
{
	struct test foo;

	printf("sizeof struct test %d offsets %d %d %d %d\n",
		sizeof(struct test),
		(unsigned long)&foo.i1 - (unsigned long)&foo,
		(unsigned long)&foo.i2 - (unsigned long)&foo,
		(unsigned long)&foo.i3 - (unsigned long)&foo,
		(unsigned long)&foo.i4 - (unsigned long)&foo);
}


GCC Version 2.95.2 -- Native i386 linux result:
    sizeof struct test 64 offsets 0 16 32 48

GCC Version 2.96 -- Native hppa linux result:
    sizeof struct test 16 offsets 0 4 8 12


John
