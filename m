Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gwyn.tux.org (gwyn.tux.org [207.96.122.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F8AF482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 May 2002 08:56:51 -0600 (MDT)
Received: (from timball@localhost)
	by gwyn.tux.org (8.9.3/8.9.1) id KAA11416
	for parisc-linux@lists.parisc-linux.org; Wed, 22 May 2002 10:56:32 -0400
Date: Wed, 22 May 2002 10:56:32 -0400
From: Timothy Ball <timball@tux.org>
To: parics Linux Mailing List <parisc-linux@lists.parisc-linux.org>
Message-ID: <20020522145632.GA10313@gwyn.tux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] wierd vmstuff in /var/log/debug
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

Going thru my logs like I do once a week I noticed this: 

timball@orwell {42}$ uname -a
Linux orwell 2.4.18-pa9 #1 Tue Mar 26 12:37:53 EST 2002 parisc unknown

--snip--snip--snip--
May 22 06:25:12 orwell kernel: 
May 22 06:25:12 orwell kernel: do_page_fault() pid=15193 command='apache' type=7 address=0x405b6d93
May 22 06:25:12 orwell kernel: vm_start = 0x405b6000, vm_end = 0x405b8000
May 22 06:25:12 orwell kernel: 
May 22 06:25:12 orwell kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
May 22 06:25:12 orwell kernel: PSW: 00000000000001000000000000001111 Not taintedMay 22 06:25:12 orwell kernel: r00-03  00000000 400263e0 405b7893 bff010c0
May 22 06:25:12 orwell kernel: r04-07  405c7ed4 bff01198 000eac00 000000a8
May 22 06:25:12 orwell kernel: r08-11  00000010 bff01154 00000002 00000022
May 22 06:25:12 orwell kernel: r12-15  bff01198 ffffff78 40026604 00061f18
May 22 06:25:12 orwell kernel: r16-19  00068f18 00068f18 00068f18 405c7ed4
May 22 06:25:12 orwell kernel: r20-23  00000001 405c7ed4 405b7878 400263f4
May 22 06:25:12 orwell kernel: r24-27  40026604 405b7878 000eac00 00061f18
May 22 06:25:12 orwell kernel: r28-31  40022bc6 000003b5 bff01240 4000d2bb
May 22 06:25:12 orwell kernel: sr0-3   00000047 00000047 00000000 00000047
May 22 06:25:12 orwell kernel: sr4-7   00000047 00000047 00000047 00000047
May 22 06:25:12 orwell kernel: 
May 22 06:25:12 orwell kernel: IASQ: 00000047 00000047 IAOQ: 405b6d93 405b6d97
May 22 06:25:12 orwell kernel:  IIR: 08000240    ISR: 00000047  IOR: 40501230
May 22 06:25:12 orwell kernel:  CPU:        0   CR30: 12514000 CR31: 10370000
May 22 06:25:12 orwell kernel:  ORIG_R28: 00000000
--snip--snip--snip--

I can't even tell if this is an error or not.
I'm guessing I should upgrade (it's been a few weeks now).
But everything else seems to be working just fine. 

--timball

-- 
	GPG key available on pgpkeys.mit.edu
pub  1024D/511FBD54 2001-07-23 Timothy Lu Hu Ball <timball@tux.org>
Key fingerprint = B579 29B0 F6C8 C7AA 3840  E053 FE02 BB97 511F BD54
