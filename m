Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id E13A54829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Aug 2002 09:08:02 -0600 (MDT)
Received: from postamt1.charite.de (postamt1.charite.de [193.175.66.246])
	by hauptpostamt.charite.de (Postfix) with ESMTP id 8F2AA15C00A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Aug 2002 17:08:01 +0200 (CEST)
Date: Mon, 5 Aug 2002 17:08:01 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19 tree merged in.
Message-ID: <20020805150801.GA21487@charite.de>
References: <1028503560.977.15.camel@beavis> <20020805123404.GW7040@charite.de> <20020805145538.GA31773@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020805145538.GA31773@systemhalted>
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

Am 05.08.2002 um 10:55:38 -0400 schrieb Carlos O'Donell folgendes:

> Please include a list of the following:
> 
> 1. Compiler version.

gcc            3.0.4-7

> 2. Binutils version.

binutils       2.12.90.0.15-1

> 3. Last time you ran "apt-get update; apt-get dist-upgrade;".

Today?

> 4. Running kernel version.

2.4.18-pa59

> 5. How you got the kernel source tree.
> 	- Did you 'cvs co' ontop of a 2.4.18 tree?

Did that. Then I thought this may not be smart and fetched the 2.4.19
pa0 tarball and did a "cvs co" on top of that. Nothing changed.

> 6. What steps you took to compile the kernel.
> 	- Did you try runnig 'make mrproper' first?

make-kpkg clean && make-kpkg --revision=20020805 kernel_image modules_image

> 7. Full output of all the steps.

That would be a little too much.

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Why you can't find your system administrators:
(S)he's catching twenty winks under the floorboards, tread gingerly. 
