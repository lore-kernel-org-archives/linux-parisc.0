Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id B42704829
	for <parisc-linux@parisc-linux.org>; Tue, 15 Oct 2002 14:51:11 -0600 (MDT)
Date: Tue, 15 Oct 2002 13:51:16 -0700
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.5 status
Message-ID: <20021015205116.GR5602@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20021015211627.A15163@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021015211627.A15163@parcelfarce.linux.theplanet.co.uk>
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

>  - Serial code not working for a 712 (willy)
>  - the fix for do_fork needs checking
>  - stifb doesn't compile
>  - mux driver needs to be forward ported from 2.4 (rbrad)
>  - merge 2.5.42
>  - think the tcpdiag_cookie patch in our tree is now obsolete
>  - need to get an official number for PDC_CONS or MUX (any problem with using
> 	the same number for both?) (rbrad)
>  - send .text.init -> .init.text change to Linus (willy)
>  - send tulip changes to jgarzik (grant)
>  - figure out why we have genrtc 1.05 in our tree when linus has 1.06
>  - do a better job of vmlinux{32,64}.lds
>  - review diff vs 2.4 for additional changes
>  - review diff vs 2.5 for changes which still need to be sent to Linus.

- show_trace()/show_stack() etc need to be implemented for parisc. right
now they are just empty stubs. i have some initial versions of these
that are probably not quite correct. will look into it some more.
- our PDC early debug console hacks need to be cleaned up somehow
- pci serial is broken still in 2.5.41, may be fixed in 2.5.42
- drivers/pci/setup-bus.c has a hppa-specific #ifdef right now to
  prevent pci reinit from hpmc'ing the machine. this probably needs to
  go upstream

> would these lists be more useful in html or would they just bitrot?

email's good.... :-) perhaps keep the list in cvs (so people can
add/remove items) and you can post it periodically.

thanks,
randolph
