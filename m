From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: kernel BUG at lib/atomic64_test.c:45!
Date: Fri, 10 Jun 2011 18:58:19 -0400
Message-ID: <20110610225819.GA11574@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I enabled a few kernel debug tests.  CONFIG_ATOMIC64_SELFTEST=y
triggers a bug:

Brought up 1 CPUs
------------[ cut here ]------------
kernel BUG at lib/atomic64_test.c:45!

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001000111000001111 Not tainted
r00-03  000000ff08048e0f 000000004065a5c0 000000004011b024 000000004068c8f8
r04-07  000000004063d5c0 0000000000000000 00000000405a300c 00000000405ff9a0
r08-11  000000004068f3c0 00000000405252b0 0000000000000001 0000000000000000
r12-15  000000004068f3c0 000000004065a5c0 ffffffffc0000000 0000000000000081
r16-19  000000004064b5c0 000000007f0732a0 0000000000000000 0000000000000001
r20-23  aaa31337c001d00d 0000000000000001 0000000040596ec0 0000000000000080
r24-27  0000000000000020 0000000000000020 00000000405ff9a0 000000004063d5c0
r28-31  0000000040596ec0 000000007f08c200 000000007f08c270 000000000800000f
sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040674fc4 0000000040674fc8
 IIR: 03ffe01f    ISR: 0000000010240000  IOR: 0000000165996ec0
 CPU:        0   CR30: 000000007f08c000 CR31: 886904b488140042
 ORIG_R28: 0000000040118c1c
 IAOQ[0]: test_atomic64+0x28c/0x290
 IAOQ[1]: pci_sort_bf_cmp+0x0/0x48
 RP(r2): do_one_initcall+0x4c/0x1e0

        INIT(v0);
	r += onestwos;
=>      BUG_ON(atomic64_add_return(onestwos, &v) != r);
	BUG_ON(v.counter != r);

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
