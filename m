Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4AE304848
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 10:48:14 -0600 (MDT)
From: bame@hp.com
Reply-To: bame@hp.com
To: Mihails Nikitins <nikitins@latnet.lv>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PALO questions 
In-Reply-To: Message from Mihails Nikitins <nikitins@latnet.lv>
   of "Thu, 14 Aug 2003 19:36:08 +0300." <1060878968.3f3bba7807eb5@clients.latnet.lv>
References: <1060878968.3f3bba7807eb5@clients.latnet.lv> 
Date: Thu, 14 Aug 2003 10:48:12 -0600
Message-Id: <20030814164813.281BD733C4@fc.hp.com>
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

> Hi all,
> 
> 1. PALO docs tell "recoverykernel" in palo.conf is the path to the kernel that
> you want to boot within a failsafe session, it will be stored in the 'f0'
> partition. Do I undertstand correctly that command like 
> palo &#8211;I /dev/sda
> copies file specified by paloc.conf line
> --recoverykernel=/boot/vmlinux   ?

Yes, that kernel is copied to the f0 partition (or wherever you designate)

> 2. Is it possible to see f0 partition contents? In HP-UX, there are commands
> working with LIF files like lifls and lifcp. How can I check if there is a
> recovery kernel in PALO area?

Palo shows the contents in a very crude form during booting.  There is
no file system as such, like LIF, in the f0 partition, thus no convenient
tools for that.  Thought about doing something like that but the
payoff doesn't seem worth it especially since we usually boot kernels
from the file system anyway.  Feel free to send me a patch for "palo --ls"
or something :-)

> 3. I noticed palo warns about bad DOS magic. Is it normal?

Harmless if annoying.  From the source:

            /* we're currently using 32-bit file seeks which is ok since
             * the IPL is also limited to 2G right now.  So on big disks
             * this next read may fail, and we need to let that happen
             * gracefully.
             */
            if (seekread(bootdev, (char *)&fb, sizeof fb, 512 * offset) == -1)
                break;
            if (fb.dosmagic[0] != 0x55 || fb.dosmagic[1] != 0xaa)
            {
                printf("Bad DOS magic in extended partition\n\r");
                break;
            }

Either the disk is improperly formatted or (more likely) the seekread()
call isn't returning the -1 error like it should.  Since we can't
boot from anything past the 2G limit anyway it doesn't matter.
