Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9F56E4829
	for <parisc-linux@parisc-linux.org>; Thu, 12 Dec 2002 05:15:27 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18MSFM-0008G1-00; Thu, 12 Dec 2002 12:15:20 +0000
Date: Thu, 12 Dec 2002 12:15:20 +0000
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Carlos O'Donell <carlos@baldric.uwo.ca>, bdale@gag.com,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] ["CSA Test Drive" <TestDrive@compaq.com>] FW: Some issues
Message-ID: <20021212121520.D32514@parcelfarce.linux.theplanet.co.uk>
References: <20021211224404.GC15219@systemhalted> <200212112305.gBBN5Bdj021432@hiauly1.hia.nrc.ca> <20021212065059.GQ21187@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021212065059.GQ21187@tausq.org>; from randolph@tausq.org on Wed, Dec 11, 2002 at 10:50:59PM -0800
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

On Wed, Dec 11, 2002 at 10:50:59PM -0800, Randolph Chung wrote:
> (oh, as an aside, looks like there's a small objdump bug :-)
> 00010428 <ull2dbl>:
>    10428:       0f d9 12 81     stw r25,-10(sr0,sp)
>    1042c:       0f da 12 89     stw r26,-c(sr0,sp)
>    10430:       2f c1 10 16     fldd -10(sr0,sp),fr22
>    10434:       e8 40 d0 00     bve (rp)
>    10438:       32 c2 aa 04     fcnv Disassembler botch.
> 
> (should be fcnv,udw,dbl %fr22,%fr4)

well, there's another one:

stw r25,-10(sr0,sp)

printing `sr0,' is misleading -- were not using sr0, we're using `short
addressing mode', it should be just:

stw r25,-10(sp)

i remember jsm pointing this out a couple of years ago.  basically for insns
which have a 2-bit s field, print nothing if it's zero.  sr0 should still be
pinted for insns with a 3-bit s field.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
