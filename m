Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id QAA26876
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 16:04:21 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA04898;
	Tue, 16 Jan 2001 10:07:45 +1100
Date: Tue, 16 Jan 2001 10:07:45 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Jeffrey A Law <law@redhat.com>
cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED 
In-Reply-To: <9023.979580819@upchuck.cygnus.com>
Message-ID: <Pine.LNX.4.21.0101160955240.4272-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 15 Jan 2001, Jeffrey A Law wrote:

> First, if an ASM trashes a fixed register, then it is the ASM's responsibility
> to restore it.  So that part of this patch is wrong.

OK, that's fair enough.

> The rest of it looks pretty reasonable and can be installed.

There is possibly a small problem.  The test at the end of
hppa_expand_prologue:

  if (flag_pic && HARD_REGISTER_P (PIC_OFFSET_TABLE_SAVE_RTX))

might be wrong.  I tested HARD_REGISTER_P because we don't want to emit
the instruction as part of the prologue if PIC_OFFSET_TABLE_SAVE_RTX is
dead.  What happens if register pressure causes the pseudo to be allocated
a stack slot?

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
