Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24DB54851
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 10:50:54 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15qdc9-0003Oi-00; Mon, 08 Oct 2001 17:50:49 +0100
Date: Mon, 8 Oct 2001 17:50:49 +0100
From: Matthew Wilcox <willy@debian.org>
To: hgrothe@mathematik.tu-darmstadt.de
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Message-ID: <20011008175049.K3745@parcelfarce.linux.theplanet.co.uk>
References: <1002553729.3bc1c18187924@webmail.tiscalinet.be> <20011008183917.A15822@mathematik.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011008183917.A15822@mathematik.tu-darmstadt.de>; from hgrothe@mathematik.tu-darmstadt.de on Mon, Oct 08, 2001 at 06:39:17PM +0200
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Re: LVM 1.0.1-rc4 on hppa
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 08, 2001 at 06:39:17PM +0200, hgrothe@mathematik.tu-darmstadt.de wrote:
> I guess :-) that you compiled the lvm-tools with optimization. Since 
> there seems to be a general problem with the lvm-tools and gcc3 (appears 
> also on other architectures (see lvm mailing list)) recompile the 
> lvm-tools without optimisation or "weak" optimisation (-O0).

-O0 is no optimisation, -O1 is weak optimisation and -O2 is most
optimisations.  This is normally a bug in the code, not the compiler...

-- 
Revolutions do not require corporate support.
