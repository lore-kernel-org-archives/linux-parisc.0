From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: [parisc-linux] do_page_fault
Date: Tue, 24 Apr 2007 05:41:19 -0400
Message-ID: <5b2e36650704240241r58da9af2x5b602b2efa0e43ba__36084.1650552631$1416624341$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I've googled a bit and am having trouble finding a guide to interpret
a do_page_fault message.  Are these the result of a userspace app
behaving poorly?  I'm going to try and reduce this to a test case over
the next few days.

do_page_fault() pid=21916 command='gij-4.1.bin' type=15 address=0x00000004

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  000000ff0004ff0f 0000000042cdded8 0000000041655863 0000000042dc4030
r04-07  0000000042c5ced8 0000000042dc4030 0000000042e16600 0000000042e0e198
r08-11  00000000402fe690 000000004014da80 00000000402f5680 0000000040630460
r12-15  0000000042e165a0 0000000040391000 00000000c0381308 000000004036cf88
r16-19  000000004036d308 0000000000000000 0000000000000000 0000000042c5ced8
r20-23  0000000000000043 00000000400f93b0 0000000041655834 0000000000000800
r24-27  0000000000000000 0000000000000001 0000000042d93fc4 0000000000011a74
r28-31  0000000000000000 0000000000000800 00000000c0382180 0000000041bff5bb
sr00-03  0000000000892800 0000000000892800 0000000000000000 0000000000892800
sr04-07  0000000000892800 0000000000892800 0000000000892800 0000000000892800

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00001000000010001000000000000000
FPER1: 00000000
fr00-03  0808800000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  4024000000000000 3fe6e2ffbde423e5 3f400000d2400000 3ff0000000000000
fr08-11  0000000000000028 00000000f000024c 0000000040541380 0000000000000802
fr12-15  42c5ced80000000b 0000000000000001 42e24000404a01d8 42c5ced8455c4108
fr16-19  fffffffffffff000 0000000000000000 0000000000000802 00000000405a1000
fr20-23  00000000455c4398 0000000040541380 42d4ce0013b13bb5 000002bb00000000
fr24-27  0000000600000000 00000000000225e8 5eb15c1bc135d057 14bb70f5e181fefc
fr28-31  5eb15c1b9efa484d 7c39793785daed7c 5eb15c1b455c4398 ec0fba0d40541380

IASQ: 0000000000892800 0000000000892800 IAOQ: 000000004165586f 0000000041655873
 IIR: 0f881083    ISR: 0000000000892800  IOR: 0000000000000004
 CPU:        0   CR30: 0000000114bc0000 CR31: 0000000040500000
 ORIG_R28: 0000000000000002
 IAOQ[0]: 0x4165586c
 IAOQ[1]: 0x41655870
 RP(r2): 0x41655860


-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
