Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA31830
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Nov 1999 12:30:14 -0700
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 30 Nov 1999 19:32:04 -0000
Subject: Re: [parisc-linux] Progress - Update
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Tue, 30 Nov 1999 19:31:46 +0000 (GMT)
Cc: dave@hiauly1.hia.nrc.ca, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        alan@lxorguk.ukuu.org.uk, sieler@allegro.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19991130193244.A4951@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 30, 99 07:32:44 pm
Content-Type: text
Message-Id: <E11st08-00079l-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> to use spin_lock_irqsave / spin_unlock_irqrestore on an array of spinlocks
> indexed by a hash of the address - x86istic code expecting xchg() to be
> fast is going to suck I'd guess.

You can catch the suitably aligned case. I don't think anyone will have a problem
if you submit patches over time so that critical xchg()'d objects are 16byte
aligned where it doesnt impact other platforms.

Keep counters of aligned/unaligned
