Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E14344831
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 May 2002 14:05:27 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17Bhmz-0002b5-00; Sat, 25 May 2002 21:05:21 +0100
Date: Sat, 25 May 2002 21:05:21 +0100
From: Matthew Wilcox <willy@debian.org>
To: Stacy Olivas <olivas@eurisko.ws>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Getting a 750 to boot
Message-ID: <20020525210521.C10366@parcelfarce.linux.theplanet.co.uk>
References: <20020525195423.BE4A636F9@sitemail.everyone.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020525195423.BE4A636F9@sitemail.everyone.net>; from olivas@eurisko.ws on Sat, May 25, 2002 at 12:54:23PM -0700
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

On Sat, May 25, 2002 at 12:54:23PM -0700, Stacy Olivas wrote:
> When I boot the system up it has the following:
> 
> (c) Copyright.  Hewlett-Packard Company.  1991.
> All rights reserved
> 
> PDC ROM rev. 1.2
> IODC ROM rev. 1.0
> 128 MB of memory configured and tested.
> 
> 
> Selecting a system to boot.
> 
> Hard booted.
> 
> ISL Revision A.00.38 OCT 26, 1994
> 
> ISL booting  hpux
> Exec failed: Cannot find /stand/vmunix or /vmunix.
> 
> ISL> 
> 
> 
> How can I get this beast to boot?  It has 2 HD's in it and a tape
> backup/floppy unit on it as well.  It also has a network card in it,
> (a TPT 92 series 802.3 10BASE-T Transciever with Lanview hooked into
> the AUI port on the back).

Probably easiest to netboot it.  When it says `Selecting a system to
boot', press the escape key.  You can then `sea' to find bootable devices.
Note that the 750 is old enough that it uses the rboot protocol rather
than bootp.  Of course, you can try a CD-ROM at this point too.

-- 
Revolutions do not require corporate support.
