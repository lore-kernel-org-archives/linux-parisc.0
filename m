Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA21026
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 11:46:23 -0700
From: willy@thepuffingroup.com
Date: Wed, 15 Mar 2000 12:46:50 -0500
To: "Brian S. Julin" <bri@mojo.calyx.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] need tftp boot and ELF
Message-ID: <20000315124650.P27942@thepuffingroup.com>
References: <E12VGYA-0008AB-00@endor.fc.hp.com> <Pine.BSO.4.21.0003151223080.7474-100000@mojo.calyx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSO.4.21.0003151223080.7474-100000@mojo.calyx.net>; from Brian S. Julin on Wed, Mar 15, 2000 at 12:28:20PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 15, 2000 at 12:28:20PM -0500, Brian S. Julin wrote:
> 
> 
> > [1] A simple elf->som translator would be sufficient to enable the
> > hpux boot loader to work again.
> 
> Hmm... any chance someone is going to do this?  Considering I
> have yet to see a shell and I have no way to restore my HPUX if
> it breaks (I gave away the tape drive and there's no CD.)  
> I'm not about to go partitioning my hard disk.  I need to boot
> from a tftp server.  

you can still boot from a tftp server using palo.  i agree this isn't
clear in the palo docs (i initially thought you couldn't either).
suggestions on making this more obvious gratefully received.
