Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.73.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA19B483B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Mar 2002 23:34:35 -0700 (MST)
Date: Tue, 12 Mar 2002 07:34:29 +0100
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Gururaj Ananthateerta <gururaj@cup.hp.com>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] new vmlinux!!!
Message-ID: <20020312063429.GA24304@charite.de>
References: <20011001175425.A31305@dogbert.localdomain> <Pine.NEB.4.33.0110021434430.24166-100000@www2.scram.de> <20011005222028.A13585@dogbert.localdomain> <20011005215600.B3745@parcelfarce.linux.theplanet.co.uk> <20011005233602.A13826@dogbert.localdomain> <3C8D3619.519A601C@cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C8D3619.519A601C@cup.hp.com>
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

On Mon, Mar 11, 2002 at 02:56:25PM -0800, Gururaj Ananthateerta wrote:
> I have 3 partitions on primary disk
>    Device Boot    Start       End    Blocks   Id  System
> /dev/sda1             1        95     97264   f0  Linux/PA-RISC boot
> /dev/sda2            96       339    249856   82  Linux swap
> /dev/sda3           340      8683   8544256   83  Linux
> 
> I am doing some modifications to the code and trying to boot with a new
> linux.
> I placed my vmlinux in /boot, but the palo doesn't seems to recognize my
> kernel.

How does the palo.conf look like?
What happens if you run palo?

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Why you can't find your system administrators:
The admin is suffering so bad from sleep deprivation that they may as well not be there for all the sense you can make of the words they are saying. 
