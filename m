Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 810854866
	for <parisc-linux@lists.parisc-linux.org>; Sun, 27 Oct 2002 02:34:00 -0700 (MST)
Date: Sun, 27 Oct 2002 10:33:55 +0100
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Stephan <stephan@itp.bg>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ext3 /
Message-ID: <20021027093355.GD9302@charite.de>
References: <20021027092756.D8B974862@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021027092756.D8B974862@dsl2.external.hp.com>
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

On Sun, Oct 27, 2002 at 11:28:04AM +0200, Stephan wrote:
> Hello,
> /dev/sda1   *         1        15     61814   f0  Linux/PA-RISC boot
> /dev/sda2            16       441   1756398   83  Linux
> /dev/sda3           442       562    498883   82  Linux swap
> /dev/sda4           563      1017   1875965   83  Linux
> it is my partitions of my linux
> Can I make /dev/sda2 which is / partition ext3 or reiserfs? i.e. journaling
> FS

Yes, why not?

tune2fs -j /

> After I made dist-upgrade 1 week ago, my uname don't works, if I write uname
> -a there is segmentation fault, any ideas?

I filed a bug report a few days ago. Check the Debian bug database.

-- 
Ralf Hildebrandt (Im Auftrag des Referat V a)   Ralf.Hildebrandt@charite.de
Charite Campus Mitte                            Tel.  +49 (0)30-450 570-155
Referat V a - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Microsoft: "Where do you want to go today?"
Linux:     "Where do you want to be tomorrow?"
BSD:       "Are you guys coming, or what?"
