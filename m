Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA04235
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Sep 1999 00:06:22 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id CAA14910
	for <parisc-linux@thepuffingroup.com>; Wed, 29 Sep 1999 02:05:59 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id XAA06877 for <parisc-linux@thepuffingroup.com>; Tue, 28 Sep 1999 23:05:33 -0700 (PDT)
Message-Id: <199909290605.XAA06877@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Tue, 28 Sep 1999 23:05:27 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] HOSTCC vs CC and other nits
List-ID: <linux-parisc.vger.kernel.org>


I think Phil (with help from Alex) broke kernel builds...

While trying to creatively fix the init_task_union alignment
garbage, I can't build anymore....Here's the problems:

o I don't have and don't want a native gcc.  I want to know when
  things are building for the native or cross environment.
  That means use HOSTCC (instead of $(CC)) in the Makefiles.
  I can then do "make vmlinux HOSTCC=cc".

o I don't have obj_dump. And I haven't the faintest clue
  where to find it. Could we use nm instead?

o I looked at checkalign.c and am feeling a bit confused.
  Why is the code testing for 4K alignment?
  I though the requirement was 8K alignement...

I fixed the first problem.

Here another idea for the second two:

/usr/bin/nm vmlinux |awk '/init_task_union/ {
	n = int($2); t = int(n/8192); t *= 8192;
	if (n != t) {
		print NOT
	}
	printf("0x%x vs 0x%x\n", n, t)
}' FS=\|

Perl is probably better for this kind of stuff (has "&"
operator which is missing from awk). But I'm not a very good
perl hacker...

enjoy,
grant


Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
