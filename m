Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA19020
	for <parisc-linux@puffin.external.hp.com>; Sun, 12 Nov 2000 11:04:59 -0700
Date: Sun, 12 Nov 2000 11:06:38 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001112110638.A1005@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] glibc build fails / bash bug
List-ID: <linux-parisc.vger.kernel.org>

Bdale, taggart and I have been looking at trying to build glibc on hppa
from Debian's sources.  What we saw was that it looks like a lot of the 
syscalls were not being reocognized as such by one part of the build, so 
it tries to build things from the sysdeps/generic directory and fails.

After a lot of digging, I *think* what is at fault is actually bash. It
looks like during the build, a shell script (make-syscalls.sh) parses
through syscalls.list to generate syscall stubs that are needed for the
build to happen correctly, but these are not being generated. What it 
boils down to, I think, is this:

(on hppa - bdale's J5K)
=============================
tausq@j5k:/space/tausq $ bash --version
GNU bash, version 2.04.0(1)-release (hppa-unknown-linux-gnu)
Copyright 1999 Free Software Foundation, Inc.
tausq@j5k:/space/tausq $ dpkg -l |grep bash
ii  bash           2.04-7         The GNU Bourne Again SHell
tausq@j5k:/space/tausq $ cat test.sh
#!/bin/sh

echo "1 2 3 4 5
a b c d e 
" | 
while read a b c d e; do
        echo $a $b $c $d $e
done
tausq@j5k:/space/tausq $ /bin/bash test.sh
1 2 3 4 5
=============================
(on other archs, tested with i386 and sparc)
samwise[11:06] ~% bash --version    
GNU bash, version 2.04.0(1)-release (i386-pc-linux-gnu)
Copyright 1999 Free Software Foundation, Inc.
samwise[11:06] ~% dpkg -l |grep bash
ii  bash           2.04-7         The GNU Bourne Again SHell
samwise[11:06] ~% /bin/bash test.sh
1 2 3 4 5
a b c d e


This causes the parsing routines to die quite miserably....

Anyone feel like trying to fix this? :-)

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
