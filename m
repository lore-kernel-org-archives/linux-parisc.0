Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23BE84845
	for <parisc-linux@parisc-linux.org>; Tue, 15 Oct 2002 16:52:08 -0600 (MDT)
Date: Tue, 15 Oct 2002 18:52:14 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.5 status
Message-ID: <20021015225214.GC26368@systemhalted>
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

> In an attempt to get more people involved in the 2.5 porting effort, I'm
> going to try to send out weekly updates of what's going on.  Feel free to
> respond to things and point out where I'm wrong.

Thanks Willy :)
 
>  - Serial code not working for a 712 (willy)
>  - the fix for do_fork needs checking
>  - stifb doesn't compile

Didn't Helge just fix this?

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

e.g. Things in 2.4 not in 2.5?

>  - review diff vs 2.5 for changes which still need to be sent to Linus.
> would these lists be more useful in html or would they just bitrot?

Sending things to the mailing list gets you both:
- HTML based ref. of list archives.
- Ever present reminder in my parisc-linux folder.

Here's to getting all of the PA changes into 2.5! :)

c.
