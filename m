Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA17495
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Aug 2000 13:10:56 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 21 Aug 2000 19:10:46 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
References: <Pine.LNX.4.21.0008191523470.28329-100000@front.linuxcare.com.au> <87em3iy0b8.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 21 Aug 2000 15:09:58 -0400
In-Reply-To: David Huggins-Daines's message of "21 Aug 2000 13:46:19 -0400"
Message-ID: <877l9axwft.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> Quite well, once I did this:

Oh, that patch was obviously bogus.  Sorry.  The real bogosity is
setting elf.plt.offset to -1 in order to prevent finish_dynamic_symbol
from filling in the PLT entry, which, aside from overwriting (part of)
the first PLT entry with the target for the last import stub, also
causes these stubs themselves to contain references to PLT - 1 (these
immediately cause SIGBUS at the moment, which is probably a good
thing).

This is doubly strange because finish_dynamic_symbol has a check for
h->pic_call in it already :-)

I've hacked around it for my own purposes but I imagine you know best
what to do.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
