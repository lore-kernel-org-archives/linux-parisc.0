Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B6A5482D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Jun 2003 19:32:53 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [127.0.0.1] (may be forged))
	by hiauly1.hia.nrc.ca (8.12.9/8.12.9) with ESMTP id h5L1WqgL001952
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Jun 2003 21:32:52 -0400 (EDT)
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.12.9/8.12.9/Submit) id h5L1WpSr001950
	for parisc-linux@lists.parisc-linux.org; Fri, 20 Jun 2003 21:32:51 -0400 (EDT)
Message-Id: <200306210132.h5L1WpSr001950@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Date: Fri, 20 Jun 2003 21:32:51 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Wierd IIR value in expect crash
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

Today, expect dumped core during the running of the GCC testsuite.  The
debug listing is as follows:

Jun 20 10:03:41 gsyprf11 kernel: expect (pid 27377): Illegal instruction (code 8)
Jun 20 10:03:41 gsyprf11 kernel: 
Jun 20 10:03:41 gsyprf11 kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Jun 20 10:03:41 gsyprf11 kernel: PSW: 00000000000001101111111100001111 Not tainted
Jun 20 10:03:41 gsyprf11 kernel: r00-03  0000000000000000 0000000040065120 000000004003bb47 0000000000000066
Jun 20 10:03:41 gsyprf11 kernel: r04-07  0000000000000066 000000000023a050 0000000040066120 000000000000012c
Jun 20 10:03:41 gsyprf11 kernel: r08-11  00000000000225d0 000000000000012c 0000000040067a0c 0000000040067a0c
Jun 20 10:03:41 gsyprf11 kernel: r12-15  0000000000211890 0000000000000001 0000000040050ba8 000000000000012c
Jun 20 10:03:41 gsyprf11 kernel: r16-19  00000000000225d0 0000000000000000 0000000000000001 0000000040066120
Jun 20 10:03:41 gsyprf11 kernel: r20-23  0000000000000000 0000000040041f14 000000004004caa8 0000000000000000
Jun 20 10:03:41 gsyprf11 kernel: r24-27  0000000000000000 00000000002ce740 000000000023a050 0000000000020e0c
Jun 20 10:03:41 gsyprf11 kernel: r28-31  00000000002ce740 0000000000000000 00000000faf06880 00000000400c5e03
Jun 20 10:03:41 gsyprf11 kernel: sr0-3   0000000000000300 0000000000000300 0000000000000000 0000000000000300
Jun 20 10:03:41 gsyprf11 kernel: sr4-7   0000000000000300 0000000000000300 0000000000000300 0000000000000300
Jun 20 10:03:41 gsyprf11 kernel: 
Jun 20 10:03:41 gsyprf11 kernel: IASQ: 0000000000000300 0000000000000300 IAOQ: 0000000040041f17 0000000040041f1b
Jun 20 10:03:41 gsyprf11 kernel:  IIR: 0015e398    ISR: 0000000010240080  IOR: 0000006d5ab068a0
Jun 20 10:03:41 gsyprf11 kernel:  CPU:        0   CR30: 000000002e9a0000 CR31: 00000000104f8000
Jun 20 10:03:41 gsyprf11 kernel:  ORIG_R28: 0000000000000000

Looking at the core dump, I noted that the insn at 0x40041f14 was
stw rp,-14(sr0,sp).  This is doesn't agree with the IIR value shown above.
It is supposed to contain the trapping instruction when an illegal instruction
trap occurs (type 8).  I'm not sure how this can happen.  The register
values recorded in the core dump are consistent with those above,
including IIR.  The trap occured on the first instruction of a function.

I have also noted that gdb isn't able to `step' into functions.  Also,
breakpoints don't always take until a program is restarted.  Richard
Hirst did a flush_icache_page patch to fix this problem about a year
ago.

Richard Hirst <rhirst@linuxcare.com> wrote on 29 May 2002:
>  gdb has a problem in that it often doesn't stop the target program
>  when you do a 'step' or 'next'.  This is because it plants breakpoints,
>  but those breakpoints sit in the data cache and don't get flushed
>  through to be visible as code in time.  We need a flush_icache_page()
>  implementation to fix this; the following adds that and
>  flush_icache_range() also.  It does fix gdb for me on my a500.

I am currently seeing these problems on gsyprf11.external.hp.com
which is a 9000/800/A500-6X (PA8700 (PCX-W2)).  The system is
2.4.20-pa31.

Possibly, there is a problem with cache flushing in both cases.  Thoughts?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
