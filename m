Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id A2D5D482A
	for <parisc-linux@parisc-linux.org>; Wed,  3 Apr 2002 09:52:27 -0700 (MST)
Date: Wed, 3 Apr 2002 17:35:17 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] palo, f0 partition (Re: Network install on 712/80)
Message-ID: <20020403163517.GZ18391@sleepie.demon.co.uk>
References: <E16q3vH-000828-00.2002-03-27-03-16-27@mail4.svr.pol.co.uk> <20020402171039.GM18391@sleepie.demon.co.uk> <E16sSNd-0003KJ-00.2002-04-02-18-47-37@mail4.svr.pol.co.uk> <20020402181145.GO18391@sleepie.demon.co.uk> <E16smnd-0000BK-00@palinux.fc.hp.com> <20020403154028.GA7903@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020403154028.GA7903@charite.de>
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

On Wed, Apr 03, 2002 at 05:40:28PM +0200, Ralf Hildebrandt wrote:
> On Wed, Apr 03, 2002 at 08:35:49AM -0700, Paul Bame wrote:
> > 
> > The f0 partition needs to be able to hold one recovery kernel plus 265k plus
> > some roundoff -- so minimum size should probably be 8M just to be safe.
> > 
> > f0 is capable of holding both a narrow and a wide kernel plus a ramdisk,
> > which is how the installer works.  After woody perhaps we can arrange
> > for the install to put a recovery ramdisk as well as the customary
> > recovery kernel, into the f0 partition.  For that, 16M is probably
> > a good size.
> 
> So, can I use "parted" to resize it?

Don't know what parted would make of that; it doesn't understand about
'f0' partitions, so may not let you try to resize them.  You could
probably use parted to make enough space for a bigger one, then use
fdisk to actually create it.  you could use parted to create it, but
parted wont let you set the type to 'f0'.

Richard
