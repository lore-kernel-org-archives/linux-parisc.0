Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.73.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id BCD0A482A
	for <parisc-linux@parisc-linux.org>; Wed,  3 Apr 2002 08:40:37 -0700 (MST)
Date: Wed, 3 Apr 2002 17:40:28 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] palo, f0 partition (Re: Network install on 712/80)
Message-ID: <20020403154028.GA7903@charite.de>
References: <E16q3vH-000828-00.2002-03-27-03-16-27@mail4.svr.pol.co.uk> <20020402171039.GM18391@sleepie.demon.co.uk> <E16sSNd-0003KJ-00.2002-04-02-18-47-37@mail4.svr.pol.co.uk> <20020402181145.GO18391@sleepie.demon.co.uk> <E16smnd-0000BK-00@palinux.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E16smnd-0000BK-00@palinux.fc.hp.com>
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

On Wed, Apr 03, 2002 at 08:35:49AM -0700, Paul Bame wrote:
> 
> The f0 partition needs to be able to hold one recovery kernel plus 265k plus
> some roundoff -- so minimum size should probably be 8M just to be safe.
> 
> f0 is capable of holding both a narrow and a wide kernel plus a ramdisk,
> which is how the installer works.  After woody perhaps we can arrange
> for the install to put a recovery ramdisk as well as the customary
> recovery kernel, into the f0 partition.  For that, 16M is probably
> a good size.

So, can I use "parted" to resize it?

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
"There are two ways of constructing a software design: One way is to
make it so simple that there are obviously no deficiencies, and the
other way is to make it so complicated that there are no obvious
deficiencies. The first method is far more difficult." 
 -C.A.R. Hoare
