Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 5140C482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Jun 2001 06:32:20 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Unaligned trap handler - comments appreciated
Date: Sat, 23 Jun 2001 14:31:53 +0200
References: <20010618000128.G14564@tausq.org> <20010622235443.I14564@tausq.org>
In-Reply-To: <20010622235443.I14564@tausq.org>
MIME-Version: 1.0
Message-Id: <20010623123220.5140C482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Randolph,

I've tested your changes on a 32bit kernel:

c3000:~/unaligned# uname -a
Linux c3000 2.4.0-pa37 #1 Sam Jun 23 11:42:43 CEST 2001 parisc unknown
c3000:~/unaligned# gcc unaligned.c
c3000:~/unaligned# ./a.out
Bus error

In the syslog:
Jun 23 14:26:36 c3000 kernel: a.out(3225): unaligned access to 0xbff00649 at 
ip=0x000104fb

Greetings,
Helge

On Saturday 23 June 2001 08:54, Randolph Chung wrote:
> In reference to a message from Randolph Chung, dated Jun 18:
> > I just checked in an arch/parisc/kernel/unaligned.c file into palinux
> > cvs.
>
> I've updated traps.c to call the unaligned handler now. Many thanks to
> jsm for his help and advice.
>
> I've only tested this for parisc64, would appreciate if someone can test
> to make sure it works on a narrow kernel as well. My test case looks
> something like this:
>
>
> #include <stdio.h>
>
> struct data_t {
>         unsigned long a;
>         unsigned long b;
> };
>
> int main(int argc, char **argv)
> {
>         struct data_t data;
>         unsigned char *t;
>         unsigned long l;
>         int i;
>
>         data.a = 0x12345678;
>         data.b = 0x87654321;
>
>         t = (unsigned char *)(&data)+1;
>         l = *((unsigned long *)t);
>         printf("l = 0x%08lx\n\n\n", l);
>
>         printf("expected result is: 0x");
>         for (i = 0; i < sizeof(unsigned long); i++)
>                 printf("%x", *(t+i));
>         printf("\n");
>
>         printf("testing store...\n");
>         *((unsigned long *)t) = 0x13572468;
>
>         l = *((unsigned long *)t);
>         printf("l = 0x%08lx\n", l);
>
>         return 0;
> }
>
> randolph
