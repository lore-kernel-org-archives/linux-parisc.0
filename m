Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7EB5A482A
	for <parisc-linux@parisc-linux.org>; Sun, 25 Mar 2001 17:02:48 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14hKT1-0002UB-00; Mon, 26 Mar 2001 01:02:39 +0100
Date: Mon, 26 Mar 2001 01:02:39 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] The printf fiasco
Message-ID: <20010326010239.P31126@parcelfarce.linux.theplanet.co.uk>
References: <E14hKMI-0000iy-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14hKMI-0000iy-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Mon, Mar 26, 2001 at 12:55:38AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Mar 26, 2001 at 12:55:38AM +0100, Alan Cox wrote:
> Actually you cant take the address. Instead your 
> 
> 	(void *)printf
> 
> generates
> 	(void *)fprintf
> 
> and your program core dumps mysteriously at run time

No it doesn't.

# cat ./def-test.c 
#include <stdio.h>

int main(void)
{
        void *a = (void *)printf;
        void *b = (void *)fprintf;
#undef printf
        void *c = (void *)printf;

        printf("a = %p, b = %p, c = %p\n", a, b, c);
        return 0;
}

# gcc -O2 -Wall -W def-test.c -o def-test
# gcc --version
3.0
# ./def-test 
a = 0x26f2, b = 0x271a, c = 0x26f2

that's because

# if __GNUC_PREREQ (2,97)
#  define printf(fmt, args...) fprintf (stdout, fmt, ##args)
# endif

doesn't match printf, but only printf(...)

-- 
Revolutions do not require corporate support.
