Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4FE43482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Aug 2002 10:39:33 -0600 (MDT)
Date: Wed, 7 Aug 2002 12:37:57 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Paul Bame <bame@fc.hp.com>
Cc: Alex Green <alexdgreen@hotmail.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo issues
Message-ID: <20020807163757.GF13287@systemhalted>
References: <OE22Aztxc1o8yfogkJX00009958@hotmail.com> <20020807123807.GB9966@systemhalted> <OE50nwpGR881Np7vXee0000cb29@hotmail.com> <E17cSWK-0000pp-00@paul.bame> <OE62f84mtceYvUAA3qj0000304b@hotmail.com> <E17cSja-0000tS-00@paul.bame> <OE59QOuE3chAHrey7dl000009a1@hotmail.com> <E17cSwB-0000wS-00@paul.bame> <OE66fNykoS1Nz19qG9600002f67@hotmail.com> <E17cTgj-00012Z-00@paul.bame>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E17cTgj-00012Z-00@paul.bame>
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

> > --commandline=4/boot/vmlinux-64 root=/dev/sda4 HOME=/
> 
> Partition 4 is _NOT_ contained within the first 2G.
> 
> > /dev/sda4          1049     17366  16709632   83  Linux
> 
> Sorry my question wasn't clearer.  Perhaps you can turn sda2 or 3 into
> a /boot partition, or something more drastic...
> 
> > Yep, the f0 partition is the first 75mb of the disk:

Or you could set --commandline=0/vmlinux and have palo copy the
kernel into f0. Though you'll need to do this for every new kernel
you want to use. Very much like a normal lilo setup on x86. Though
if you muck it up... you can't recover.

c.
