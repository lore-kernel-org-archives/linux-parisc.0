Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Gururaj Ananthateerta <gururaj@cup.hp.com>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] new vmlinux!!! 
In-Reply-To: Message from Gururaj Ananthateerta <gururaj@cup.hp.com>
   of "Mon, 11 Mar 2002 14:56:25 PST." <3C8D3619.519A601C@cup.hp.com>
References: <20011001175425.A31305@dogbert.localdomain> <Pine.NEB.4.33.0110021434430.24166-100000@www2.scram.de> <20011005222028.A13585@dogbert.localdomain> <20011005215600.B3745@parcelfarce.linux.theplanet.co.uk> <20011005233602.A13826@dogbert.localdomain>  <3C8D3619.519A601C@cup.hp.com> 
Date: Tue, 12 Mar 2002 10:24:45 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020312172445.B11A64849@dsl2.external.hp.com>
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

Gururaj Ananthateerta wrote:
> I have 3 partitions on primary disk
>    Device Boot    Start       End    Blocks   Id  System
> /dev/sda1             1        95     97264   f0  Linux/PA-RISC boot
> /dev/sda2            96       339    249856   82  Linux swap
> /dev/sda3           340      8683   8544256   83  Linux

partitions are fine.

> I am doing some modifications to the code and trying to boot with a new
> linux.
> I placed my vmlinux in /boot, but the palo doesn't seems to recognize my
> kernel.

What do you mean by "doesn't seems to recognize"?
any specific error msg?

does palo.conf point to that kernel?
or did you interact with palo to tell it to load that image?
"file /boot/vmlinux" says what?

you don't have to answer the above - just stuff to think about.

grant
