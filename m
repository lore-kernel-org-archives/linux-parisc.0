Received: from phnxpop5.phnx.uswest.net (phnxpop5.phnx.uswest.net [206.80.192.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA18046
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Nov 2000 18:00:30 -0700
Date: Sat, 4 Nov 2000 18:02:03 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@puffin.external.hp.com
Message-ID: <20001104180203.A1271@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ldd segfaulting?
List-ID: <linux-parisc.vger.kernel.org>

I think this may be related to what bdale has been seeing...

frodo:~# cat test.c
int main(int a, char **b) { return 0; }
frodo:~# gcc -o test test.c
frodo:~# ./test
frodo:~# ldd ./test

do_page_fault() pid=144 command='ld.so.1'

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001000000100001011
r0-3	 00000000 2aac367c 2aaacd67 2aaaa2f0
r4-7	 2aac367c 2aaab4e8 2aac3622 2aac02b8
r8-11	 20020048 2aaaccb8 2aaaa2f0 00000000
r12-15	 00000081 00000080 200201e8 2001fe10
r16-19	 00000000 00000000 00000000 2aac367c
r20-23	 00000000 2aaaa000 2aaaa000 00000041
r24-27	 2aaaa000 70000021 20020048 00076b50
r28-31	 00000021 20020048 200202c0 2aaacd1b
sr0-4	 00000000 00002003 00000000 00002003
sr4-8	 00002003 00002003 00002003 00002003

IASQ: 00002003 00002003 IAOQ: 2aaadc63 2aaadc67
 IIR: 0ce61280    ISR: 00002003  IOR: 2aac02b8
ORIG_R28: 00086350

do_page_fault() pid=145 command='ld.so.1'

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001000000100001011
r0-3	 00000000 2aac367c 2aaacd67 2aaaa2f0
r4-7	 2aac367c 2aaab4e8 2aac3622 2aac02b8
r8-11	 20020048 2aaaccb8 2aaaa2f0 00000000
r12-15	 00000081 00000080 200201e8 2001fe10
r16-19	 00000000 00000000 00000000 2aac367c
r20-23	 00000000 2aaaa000 2aaaa000 00000041
r24-27	 2aaaa000 70000021 20020048 00076b50
r28-31	 00000021 20020048 200202c0 2aaacd1b
sr0-4	 00000000 00002003 00000000 00002003
sr4-8	 00002003 00002003 00002003 00002003

IASQ: 00002003 00002003 IAOQ: 2aaadc63 2aaadc67
 IIR: 0ce61280    ISR: 00002003  IOR: 2aac02b8
ORIG_R28: 00090190
ldd: /lib/ld.so.1 exited with unknown exit code (139)
frodo:~# gcc --version
2.96
frodo:~# ldd --version
ldd (GNU libc) 2.1.95
Copyright (C) 1999 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
Written by Roland McGrath and Ulrich Drepper.
frodo:~# 

Any ideas what's going on? I've tried this both with a Oct26 kernel and
one that is from cvs today. Same results.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
