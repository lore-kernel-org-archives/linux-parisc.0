Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA19893
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Aug 2000 17:40:35 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 21 Aug 2000 23:40:24 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA30773;
	Tue, 22 Aug 2000 09:39:57 +1000
Date: Tue, 22 Aug 2000 09:39:57 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
In-Reply-To: <877l9axwft.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0008220919520.30012-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 21 Aug 2000, David Huggins-Daines wrote:

> The real bogosity is
> setting elf.plt.offset to -1 in order to prevent finish_dynamic_symbol
> from filling in the PLT entry, which, aside from overwriting (part of)
> the first PLT entry with the target for the last import stub, also
> causes these stubs themselves to contain references to PLT - 1 (these
> immediately cause SIGBUS at the moment, which is probably a good
> thing).
> 
> This is doubly strange because finish_dynamic_symbol has a check for
> h->pic_call in it already :-)

I think just deleting these lines (which predated the check in
finish_dynamic_symbol) in build_one_stub

	  /* Flag this .plt entry as having been filled in so that
	     finish_dynamic_symbol doesn't repeat our work here.  */
	  eh->elf.plt.offset = (bfd_vma) -1;

will do the trick.  I simply forgot to remove it after fixing
finish_dynamic_symbol to genereate correct .plt entries for the
cases where we don't have a dynamic relocation.

The problem is that you get one stub per input section to ensure that the
stub can be reached.  Messing with plt.offset on the first stub has dire
consequences for subsequent ones.

Alan
-- 
Linuxcare.  Support for the Revolution.
