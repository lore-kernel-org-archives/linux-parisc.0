Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA29038
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Dec 2000 18:05:56 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 3E070955
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Dec 2000 17:08:59 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id RAA20271
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Dec 2000 17:10:06 -0800 (PST)
Message-Id: <200012230110.RAA20271@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Fri, 22 Dec 2000 17:10:05 -0800
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] dd and 2k transfers on A500
List-ID: <linux-parisc.vger.kernel.org>


Hi all,
2k transfers w/dd don't work. I think it was Richard Hirst who indicated
the same problem existed on 32-bit w/C3k. A500/c3k have the same I/O MMU.
I haven't been able to verify to problem with 32-bit kernel on c3k yet.

Half the attempts to "dd bs=2k" result in "garbage" data.

I'm using local disks on the A500 to do the following:
for i in 0 1 2 3 4 5 6 7 8 9; do dd if=/dev/sdd of=t$i \
bs=2k count=1; od -A x -t xC t$i > x$i; done

And then varied bs:
bs	count	corruption?
512	1	n
1k	1	n
2k	1	y
4k	1	n
6k	1	n
8k	1	n

1k	2	n
2k	2	y

Here's cksum output from 2k (count=1) output:
2984123064 7047 x0
3362192344 3584 x1
2984123064 7047 x2
3362192344 3584 x3
...

x0 compares correctly with the original data I pushed out to disk
(skipped the first 1k of vmlinux and then wrote 20k to /dev/sdd):
000000 20 34 18 05 e0 20 2e 22 20 34 28 05 e0 20 20 72
000010 20 34 38 05 e0 20 2f 2a 20 33 c8 03 e0 20 24 8a
000020 20 21 98 03 e0 20 2b fa 20 34 38 05 e0 20 24 9a
000030 20 34 38 05 e0 20 2b f2 20 24 78 03 e0 20 2a 3a
000040 20 35 18 05 e0 20 29 12 20 2c a8 05 e0 20 21 0a
...

x1 starts with data that matches x0 at +0x400:
000000 08 01 02 56 0b 93 0a 13 62 da 01 00 0e 93 12 80
000010 00 00 0d 64 00 01 0e 60 22 60 08 01 2b 66 40 00
000020 4a 77 07 88 22 a0 08 00 4a 7a 07 90 34 14 07 50
000030 4a 79 07 80 36 d3 01 00 0a b3 0a 13 34 18 00 06
000040 6b d4 3f 99 34 21 00 00 0a a1 0a 01 6b dc 3f 79
000050 6b c0 3f 89 6b c1 3f 91 6b c0 3f 71 e8 46 09 38
...

from x0 again:
000400 08 01 02 56 0b 93 0a 13 62 da 01 00 0e 93 12 80
000410 00 00 0d 64 00 01 0e 60 22 60 08 01 2b 66 40 00
000420 4a 77 07 88 22 a0 08 00 4a 7a 07 90 34 14 07 50
000430 4a 79 07 80 36 d3 01 00 0a b3 0a 13 34 18 00 06
000440 6b d4 3f 99 34 21 00 00 0a a1 0a 01 6b dc 3f 79
000450 6b c0 3f 89 6b c1 3f 91 6b c0 3f 71 e8 46 09 38
000460 6b d3 3f 81 00 04 18 60 4b c2 3e d9 e8 40 c0 00          


If SBA code mangled the address offset bits when it contructed the
virtual DMA, this could happen. But then I would expect a similar
behavior for 1k blocks and we don't see that.

It seems like we start reading from the wrong 1k block
on the disk - assuming the data is really coming from disk.
If so, I should be able to capture this with a SCSI analyzer.
I'll try that next week.

I very suspicous of generic kernel since the data is placed wrong
by a 1k offset, the same size linux uses internally.
SBA code deals with stuff in 4k (PAGESIZE) chunks and is unlikely
candidate for misplacing data by 1k.

Any ideas on what might be wrong?

Anyone have a 2.4.0-test10 x86 box running?
Could you try the above dd command out with 2k blocks?

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
