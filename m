Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA14885
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 12:34:39 -0700
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by atlrel1.hp.com (Postfix) with ESMTP id 19C36263A
	for <parisc-linux@thepuffingroup.com>; Wed, 24 Nov 1999 14:36:26 -0500 (EST)
Received: (from frowand@localhost) by xsvr4.cup.hp.com (8.7.6/8.7.3) id LAA19634 for parisc-linux@thepuffingroup.com; Wed, 24 Nov 1999 11:36:25 -0800 (PST)
From: Frank Rowand <frowand@cup.hp.com>
Message-Id: <199911241936.LAA19634@xsvr4.cup.hp.com>
Subject: Re: itmr rollover in delay loop
To: parisc-linux@thepuffingroup.com
Date: Wed, 24 Nov 1999 11:36:25 PST
List-ID: <linux-parisc.vger.kernel.org>

>> Look at the loop.  What we do is basically
>> 
>>       cr16 = mfctl(16);
>>       while(((cr16+loops)-mfctl(16))>0);
>
>You definitely don't want to do the above!
>
>Even ignoring the possibility of an interrupt that takes us away
>for awhile, there's the simple possibility that cr16 might
>roll over during your loop.

Careful use of unsigned variables fixes the problem.  The easiest way to
explain this is by a small sample program:


main() {

unsigned long a;
unsigned long b;
int k;

a = 0xfffffffd;
b = 0xfffffffa;

printf("a       b        b - a         0 < (int)(b - a)\n\n");

for (k = 0; k < 10; k++) {
        printf("0x%x  0x%x  0x%x  %s\n", a, b, (b-a), (0 < (int)(b-a)) ? "y" : "n");
        b++;
}

printf("\n\n");

b += 0x7ffffff4;

for (k = 0; k < 10; k++) {
        printf("0x%x  0x%x  0x%x  %s\n", a, b, (b-a), (0 < (int)(b-a)) ? "y" : "n");
        b++;
}

}




The output from this program is:


a       b        b - a         0 < (int)(b - a)

0xfffffffd  0xfffffffa  0xfffffffd  n
0xfffffffd  0xfffffffb  0xfffffffe  n
0xfffffffd  0xfffffffc  0xffffffff  n
0xfffffffd  0xfffffffd  0x0  n
0xfffffffd  0xfffffffe  0x1  y
0xfffffffd  0xffffffff  0x2  y
0xfffffffd  0x0  0x3  y
0xfffffffd  0x1  0x4  y
0xfffffffd  0x2  0x5  y
0xfffffffd  0x3  0x6  y


0xfffffffd  0x7ffffff8  0x7ffffffb  y
0xfffffffd  0x7ffffff9  0x7ffffffc  y
0xfffffffd  0x7ffffffa  0x7ffffffd  y
0xfffffffd  0x7ffffffb  0x7ffffffe  y
0xfffffffd  0x7ffffffc  0x7fffffff  y
0xfffffffd  0x7ffffffd  0x80000000  n
0xfffffffd  0x7ffffffe  0x80000001  n
0xfffffffd  0x7fffffff  0x80000002  n
0xfffffffd  0x80000000  0x80000003  n
0xfffffffd  0x80000001  0x80000004  n



Note that the calculation to decide whether rollover occurred is only
good for half the maximum magnitude of the counter (2^31 in our case).



-Frank
