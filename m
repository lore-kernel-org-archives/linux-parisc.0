Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from opus.allegro.com (opus.allegro.com [209.10.39.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D664482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Jun 2001 21:21:49 -0600 (MDT)
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200106260321.UAA03457@opus.allegro.com>
Subject: Re: [parisc-linux] HP9000 - 822 - a gift?
To: burgesstim@yahoo.com (Tim Burgess)
Date: Mon, 25 Jun 2001 20:21:48 -0700 (PDT)
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20010626013052.25142.qmail@web11503.mail.yahoo.com> from "Tim Burgess" at Jun 25, 2001 06:30:52 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> I just was 'gifted' a hp9000 822 with 

A very old, and very slow, PA-RISC 1.0 (?) HP 9000.
Probably not likely to support boot-from-SCSI.
 
> A quick look round suggests this is a silverfox - low.
> But I cant seem to id the CPU etc.

?
 
> Am I going to get linux up on this baby or the install
> hpux?

Not linux, but HP-UX should work.  I can't recall if 11.00
will run on it, but certainly earlier versions will.

IIRC, it's an interesting box because you can stick a lot
of memory in it ... slots in the front *and* slots in the
rear.  Later systems would accept far less memory (of course,
most later systems had higher density memory boards/SIMMs :)

Also, I think the memory boards had a proprietary HP controller
chip on them, with the result that no one made third party memory
for a long time.  (I saw one where the vendor had taken the chip
from a low density HP board and put it on their own high density
board!)   In the back of my mind something is saying "Datagate
eventually figured out how to make boards for it", but I'm not positive.

My notes (as best I can read a hex dump of a spreadsheet ... I
don't have Excel on my home machine :) says that the CPU is a 
25 MHz CPU.
 
-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com
