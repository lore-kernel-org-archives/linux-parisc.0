Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from Cantor.suse.de (ns.suse.de [213.95.15.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F500482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 01:29:19 -0600 (MDT)
Sender: ak@suse.de
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: davem@redhat.com (David S. Miller), willy@debian.org,
	thunder7@xs4all.nl, parisc-linux@lists.parisc-linux.org,
	linux-kernel@vger.kernel.org
Subject: Re: [parisc-linux] documented Oops running big-endian reiserfs on parisc architecture
References: <20010903002514.X5126@parcelfarce.linux.theplanet.co.uk.suse.lists.linux.kernel> <E15dghq-0000bZ-00@the-village.bc.nu.suse.lists.linux.kernel>
From: Andi Kleen <ak@suse.de>
Date: 03 Sep 2001 09:29:12 +0200
In-Reply-To: Alan Cox's message of "3 Sep 2001 01:32:44 +0200"
Message-ID: <oup66b0zq9j.fsf@pigdrop.muc.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox <alan@lxorguk.ukuu.org.uk> writes:

> > > Is it impossible to handle unaligned access traps properly on
> > > parisc?  If so, well you have some problems...
> > 
> > No, we just haven't bothered to implement it yet.  Not many people
> > use IPX these days.
> 
> You also need unaligned trap fixups for
> 
> AX.25, NetROM, LAPB, X.25, Appletalk, PPP, Anything over 802.2LLC, Linus
> NFS code for some NFS mount options (although not the -ac NFS code)

And also everybody connected to the internet needs them, because you can 
create arbitarily unaligned TCP/UDP/ICMP headers using IP option byte sized 
NOPs. 

-Andi
