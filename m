Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from quasimodo.zinkens.net (as17-5-3.bi.s.bonet.se [217.215.178.76])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CE9F483E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Sep 2003 17:40:15 -0600 (MDT)
Received: from zinkens.net (quasimodo.zinkens.net [192.168.66.111])
	(authenticated bits=0)
	by quasimodo.zinkens.net (8.12.3/8.12.3/Debian-6.6) with ESMTP id h8PNdXSY031874
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 01:39:34 +0200
From: mlist@zinkens.net
Message-ID: <35989.192.168.66.99.1064533174.squirrel@www.zinkens.net>
Date: Fri, 26 Sep 2003 01:39:34 +0200 (CEST)
To: <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] kernel error message.
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

i keep getting about ten a day of these messages in the /var/log/kern.log
file. can anyone tell me whats going on, and point me in the right
direction  to fix it? thanks.
some info on my hard/software:

quasimodo:/# uname -a
Linux quasimodo 2.4.20-64 #1 Sun Feb 23 18:50:45 CET 2003 parisc64 unknown

quasimodo:/# cat /etc/debian_version
3.0

quasimodo:/# apache -v -V
Server version: Apache/1.3.26 (Unix) Debian GNU/Linux
Server built:   Oct 26 2002 09:15:53


and the log-message:

Sep 23 16:14:14 quasimodo kernel: do_page_fault() pid=6089
command='apache' type=15 address=0x00000008Sep 23 16:14:14 quasimodo kernel:
Sep 23 16:14:14 quasimodo kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Sep 23 16:14:14 quasimodo kernel: PSW: 00000000000001101111111100001111
Not taintedSep 23 16:14:14 quasimodo kernel: r00-03  0000000000000000
00000000404c36c7 0000000040515d67 0000000311528cbaSep 23 16:14:14 quasimodo kernel: r04-07  00000000405ee948
0000000000182bd0 0000000000000009 0000000000182bd9Sep 23 16:14:14 quasimodo kernel: r08-11  00000000001f4a00
00000000405ee948 00000000faf03590 00000000faf034c8Sep 23 16:14:14 quasimodo kernel: r12-15  0000000000000008
00000000000689f0 0000000060000000 00000000000629f0Sep 23 16:14:14 quasimodo kernel: r16-19  00000000000629f0
00000000000000c8 00000000000699f0 00000000405ee948Sep 23 16:14:14 quasimodo kernel: r20-23  0000000000000002
0000000000000000 0000000000182bd9 00000000faf03590Sep 23 16:14:14 quasimodo kernel: r24-27  0000000000000009
0000000000182bd0 00000000001f4a00 00000000000629f0Sep 23 16:14:14 quasimodo kernel: r28-31  0000000000000003
00000000405f3948 00000000faf036c0 000000004049b817Sep 23 16:14:14 quasimodo kernel: sr0-3   0000000000000f00
0000000000000f00 0000000000000000 0000000000000f00Sep 23 16:14:14 quasimodo kernel: sr4-7   0000000000000f00
0000000000000f00 0000000000000f00 0000000000000f00Sep 23 16:14:14 quasimodo kernel:
Sep 23 16:14:14 quasimodo kernel: IASQ: 0000000000000f00 0000000000000f00
IAOQ: 00000000404c3caf 00000000404c3cb3Sep 23 16:14:14 quasimodo kernel:  IIR: 0eb42084    ISR: 0000000000000f00 
IOR: 0000000000000008Sep 23 16:14:14 quasimodo kernel:  CPU:        0   CR30: 0000000017dbc000
CR31: 0000000010508000Sep 23 16:14:14 quasimodo kernel:  ORIG_R28: 0000000040307254
