Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA00413
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 16:07:27 -0700
To: parisc-linux@thepuffingroup.com
Cc: jes@linuxcare.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Dec 2000 16:11:15 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001213231115.704D437CA1@carmen.fc.hp.com>
Subject: [parisc-linux] phase 2 gcc build fails
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I'm trying to build an new cross-compiler and have run into the following 
errors,

gcc -c -DHAVE_CONFIG_H -g -O2 -I. -I/home/al-76/puffin/palinux/gcc/libiberty/..
/include  -W -Wall -Wtraditional -pedantic /home/al-76/puffin/palinux/gcc/libib
erty/argv.c
In file included from /home/al-76/puffin/palinux/gcc/libiberty/argv.c:26:
/home/al-76/puffin/palinux/gcc/libiberty/../include/libiberty.h:22: parse error
before `ATTRIBUTE_MALLOC'
/home/al-76/puffin/palinux/gcc/libiberty/../include/libiberty.h:22: warning: 
type defaults to `int' in declaration of `ATTRIBUTE_MALLOC'
/home/al-76/puffin/palinux/gcc/libiberty/../include/libiberty.h:22: ANSI C 
forbids data definition with no type or storage class

it complains about lines 22, 31, 55, 72, 76, 143, 154, 158, 162 all lines with 
"ATTRIBUTE_MALLOC". It didn't do this when I last built on December 11th so I 
think it must be something checked in since then. I have looked at the stuff 
that was checked in and it's not clear to me what's causing it.

Anyone have an idea?

-- 
Matt Taggart
taggart@fc.hp.com
