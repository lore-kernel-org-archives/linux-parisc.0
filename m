Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id E4910482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Nov 2001 08:40:37 -0700 (MST)
Received: from localhost (nick@localhost)
	by ns.snowman.net (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA28627
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Nov 2001 10:40:36 -0500
Date: Wed, 14 Nov 2001 10:40:36 -0500 (EST)
From: <nick@snowman.net>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Installing Debian on a C180
In-Reply-To: <C10F60785AE7D211B6E00800060DA391028782A5@vieg128a.gud.siemens.at>
Message-ID: <Pine.LNX.4.21.0111141039190.18005-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

I attempted to install debian on my C180 a while ago.  I had to do a
number of umpleaseant hacks includeing disableing one of the two scsi
drivers in the kernel.  Did you run into that problem or did it go
relativly smoothly until the copying?
	Nick

On Wed, 14 Nov 2001, Strohmayer Peter Hans wrote:

> Hello,
> 
> i have made a CD from the ISO.image and now i will install
> Debian on a C180 with a 4GB Harddisk.
> The partitionlayout is like the README, 20MB for palo and
> 1800MB for root, 800MB for swap and rest for anything.
> 
> But i have serious troubles to install the base system to the
> disk, the machine hang with a dumb while copying the *.deb
> packages to disk from CD.
> 
> Is there something special what should do on a C180?
> 
> Greetings from Austria,
> 
> Ing. Peter Hans Strohmayer
> SBS ORS BOS CDU GUD
> 
> * Tel:    +43 5 1707 47564
> *  Fax:   +43 5 1707 57560
> * E-Mail: mailto:peter-hans.strohmayer@sbs.at
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
