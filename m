Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 399194859
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 13:15:12 -0700 (MST)
Received: from hpindda.cup.hp.com (hpindda.cup.hp.com [15.13.95.92])
	by palrel12.hp.com (Postfix) with ESMTP id 5E296600359
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 12:15:11 -0800 (PST)
Message-ID: <3C8E6174.9DEBC925@cup.hp.com>
Date: Tue, 12 Mar 2002 12:13:40 -0800
From: Gururaj Ananthateerta <gururaj@cup.hp.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] new vmlinux!!!
References: <20011001175425.A31305@dogbert.localdomain> <Pine.NEB.4.33.0110021434430.24166-100000@www2.scram.de> <20011005222028.A13585@dogbert.localdomain> <20011005215600.B3745@parcelfarce.linux.theplanet.co.uk> <20011005233602.A13826@dogbert.localdomain>  <3C8D3619.519A601C@cup.hp.com> <20020312172445.B11A64849@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii
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

I figured out my mistake.

First my partitions weren't correct. I created
an F0 partition, and swap and an ext2 for /.

boot partition was missing, rather it was i /. As / is not mounted
during the early stages of boot (my guess) the palo used to scream at
me.

Secondly, a strange observation.  Partitions are created in the following
order seems to have have some problem  during from /boot/vmlinux.

50 MB of  FO partition
50 MB of /boot
256 MB of swap
remaining for /

Problem is solved if partitions are created in the following order.

/dev/sda1             1        95     97264   83
Linux                           /boot
/dev/sda2            96       119     24576   f0  Linux/PA-RISC boot
/dev/sda3           120       363    249856   82  Linux swap
/dev/sda4           364      8683   8519680   83  Linux                    /

Doesn't make much sense.

One more thing to add, I am doing all this stuff on a N-Class.

Guru








Grant Grundler wrote:

> Gururaj Ananthateerta wrote:
> > I have 3 partitions on primary disk
> >    Device Boot    Start       End    Blocks   Id  System
> > /dev/sda1             1        95     97264   f0  Linux/PA-RISC boot
> > /dev/sda2            96       339    249856   82  Linux swap
> > /dev/sda3           340      8683   8544256   83  Linux
>
> partitions are fine.
>
> > I am doing some modifications to the code and trying to boot with a new
> > linux.
> > I placed my vmlinux in /boot, but the palo doesn't seems to recognize my
> > kernel.
>
> What do you mean by "doesn't seems to recognize"?
> any specific error msg?
>
> does palo.conf point to that kernel?
> or did you interact with palo to tell it to load that image?
> "file /boot/vmlinux" says what?
>
> you don't have to answer the above - just stuff to think about.
>
> grant
