Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Gururaj Ananthateerta <gururaj@cup.hp.com>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] new vmlinux!!! 
In-Reply-To: Message from Gururaj Ananthateerta <gururaj@cup.hp.com>
   of "Tue, 12 Mar 2002 12:13:40 PST." <3C8E6174.9DEBC925@cup.hp.com>
References: <20011001175425.A31305@dogbert.localdomain> <Pine.NEB.4.33.0110021434430.24166-100000@www2.scram.de> <20011005222028.A13585@dogbert.localdomain> <20011005215600.B3745@parcelfarce.linux.theplanet.co.uk> <20011005233602.A13826@dogbert.localdomain> <3C8D3619.519A601C@cup.hp.com> <20020312172445.B11A64849@dsl2.external.hp.com>  <3C8E6174.9DEBC925@cup.hp.com> 
Date: Tue, 12 Mar 2002 15:26:07 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020312222607.D777E4839@dsl2.external.hp.com>
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
> First my partitions weren't correct. I created
> an F0 partition, and swap and an ext2 for /.

That's right - my bad.
(Not having a good day today)

> /dev/sda1             1        95     97264   83
> Linux                           /boot
> /dev/sda2            96       119     24576   f0  Linux/PA-RISC boot
> /dev/sda3           120       363    249856   82  Linux swap
> /dev/sda4           364      8683   8519680   83  Linux                    /

If your / (sda3 in the previous example) *ends* before 2GB,
you don't need a /boot partition. Several boot/install howto's
describe this problem. I didn't catch it in your original mail.

> > Gururaj Ananthateerta wrote:
> > > I have 3 partitions on primary disk
> > >    Device Boot    Start       End    Blocks   Id  System
> > > /dev/sda1             1        95     97264   f0  Linux/PA-RISC boot
> > > /dev/sda2            96       339    249856   82  Linux swap
> > > /dev/sda3           340      8683   8544256   83  Linux
> >
> > partitions are fine.

NOT!

BTW, take a look at
	http://www.parisc-linux.org/hardware/supported.html

hth,
grant
