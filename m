Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id E38A24829
	for <parisc-linux@parisc-linux.org>; Wed, 11 Dec 2002 23:46:59 -0700 (MST)
Date: Wed, 11 Dec 2002 22:50:59 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>, bdale@gag.com,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] ["CSA Test Drive" <TestDrive@compaq.com>] FW: Some issues
Message-ID: <20021212065059.GQ21187@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20021211224404.GC15219@systemhalted> <200212112305.gBBN5Bdj021432@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212112305.gBBN5Bdj021432@hiauly1.hia.nrc.ca>
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

> The code doesn't seem to trap on a A500 which I believe is a PA8500.
> I think we need to look at bits 0..1 of the coprocessor configuration
> register to determine instruction validity.  See table 8-6 on page 8-11.

it does cause a trap actually, we just don't usually print it. 

FP assist exception at 0x10433
FP VZOUICxxxxCQCQCQCQCQCRMxxTDVZOUI ->
   00000000000000000000000001000000

i'm confused tho because that iaoq doesn't point where i thought it
might point. is this because of delayed exceptions?

(oh, as an aside, looks like there's a small objdump bug :-)
00010428 <ull2dbl>:
   10428:       0f d9 12 81     stw r25,-10(sr0,sp)
   1042c:       0f da 12 89     stw r26,-c(sr0,sp)
   10430:       2f c1 10 16     fldd -10(sr0,sp),fr22
   10434:       e8 40 d0 00     bve (rp)
   10438:       32 c2 aa 04     fcnv Disassembler botch.

(should be fcnv,udw,dbl %fr22,%fr4)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
