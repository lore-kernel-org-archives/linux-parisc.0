Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 36CDD482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Jun 2001 00:55:14 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 6.03.0009/NU8172.00.4d3e3a24) with ESMTP id omfjgaaa for parisc-linux@lists.parisc-linux.org; Fri, 22 Jun 2001 23:51:53 -0700
Date: Fri, 22 Jun 2001 23:54:43 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Unaligned trap handler - comments appreciated
Message-ID: <20010622235443.I14564@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20010618000128.G14564@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010618000128.G14564@tausq.org>; from randolph@tausq.org on Mon, Jun 18, 2001 at 12:01:29AM -0700
List-ID: <linux-parisc.vger.kernel.org>

In reference to a message from Randolph Chung, dated Jun 18:
> I just checked in an arch/parisc/kernel/unaligned.c file into palinux
> cvs.

I've updated traps.c to call the unaligned handler now. Many thanks to
jsm for his help and advice.

I've only tested this for parisc64, would appreciate if someone can test
to make sure it works on a narrow kernel as well. My test case looks
something like this:


#include <stdio.h>

struct data_t {
        unsigned long a;
        unsigned long b;
};

int main(int argc, char **argv)
{
        struct data_t data;
        unsigned char *t;
        unsigned long l;
        int i;

        data.a = 0x12345678;
        data.b = 0x87654321;

        t = (unsigned char *)(&data)+1;
        l = *((unsigned long *)t);
        printf("l = 0x%08lx\n\n\n", l);

        printf("expected result is: 0x");
        for (i = 0; i < sizeof(unsigned long); i++)
                printf("%x", *(t+i));
        printf("\n");

        printf("testing store...\n");
        *((unsigned long *)t) = 0x13572468;

        l = *((unsigned long *)t);
        printf("l = 0x%08lx\n", l);

        return 0;
}

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
