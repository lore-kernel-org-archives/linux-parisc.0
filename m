Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id BBF22482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 12:43:28 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17G2EJ-0004oW-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 06 Jun 2002 19:43:27 +0100
Date: Thu, 6 Jun 2002 19:43:27 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Probleme while compiling last CVS kernel.
Message-ID: <20020606184327.GO1080@tykepenguin.com>
References: <3CFF593A.18910E50@admin.france.hp.com> <20020606130006.GE1080@tykepenguin.com> <1023388448.3cffab201378e@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <1023388448.3cffab201378e@webmail.tiscalinet.be>
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

On Thu, Jun 06, 2002 at 08:34:08PM +0200, joel.soete@freebel.net wrote:
> Hi all,
> 
> I do not have the opportunity to run a 64bits kernel but for 32bits kernel I run
> a patched kernel with last stable lvm-1.0.4 (and it is runing fine for at least
> two month).
> Humm which CONFIG_ parameter do I have to check to compile this src for 64-bits
> kernel.
> I can so try to see at least if it compiles well and report results.

I don't know about the 64bit compile switches (I only have a 32bit HP box) but
to get LVM running you'll need to take all the bits from
arch/sparc64/kernel/ioctl32.c inside the 

#if defined(CONFIG_BLK_DEV_LVM) || defined(CONFIG_BLK_DEV_LVM_MODULE)

#endif

and replace the bits from arch/parisc/kernel/ioctl32.c with them. I suspect it
will work. If it does then get a patch together and put it into the CVS !

I'm pleased (though not very surprised) that LVM works OK on 32 bit machines.

patrick
aka caulfield@sistina.com
