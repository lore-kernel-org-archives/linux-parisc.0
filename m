Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from portablue.intern.mind.be (NAT.office.mind.be [62.166.230.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 033F54829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 Jan 2003 12:49:37 -0700 (MST)
Date: Wed, 8 Jan 2003 20:49:19 +0100
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	Peter 'p2' De Schrijver <p2@mind.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Matrox Millenium II in C240
Message-ID: <20030108194919.GB1313@portablue.intern.mind.be>
References: <20030102123856.GD871@portablue.intern.mind.be> <20030103051715.GA14565@dsl2.external.hp.com> <20030105131037.E19239@parcelfarce.linux.theplanet.co.uk> <20030106170059.GE9947@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="3V7upXqbjpZ4EhLz"
In-Reply-To: <20030106170059.GE9947@dsl2.external.hp.com>
From: p2@mind.be (Peter 'p2' De Schrijver)
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

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> 
> Hmmm. /proc/iomem should tell us which ranges dino/cujo are forwarding.
> 

/proc/iomem in attachement.

> But looking at dino.c, it's clear the code is not handling multiple
> ranges correctly even if firmware did program it right.
> 
>         res = &dino_dev->hba.lmmio_space;
> 
> lmmio_space needs to be an array.
> In HP speak, this is an "unsupported configuration". 
> 
> Elroy (lba_pci.c) suffers a similar problem with "directed ranges"
> (code currently only handles "distributed ranges"). At some point
> I'll get back to working on the lba code since it has a few other
> minor oustanding issues as well.
> 

So, this basically means it won't work for now ?

Cheers,

Peter.

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=iomem-parisc

00000000-1fffffff : System RAM
  00000000-000009ff : PDC data (Page Zero)
  00100000-002bffff : Kernel code
  002c0000-003b5c1b : Kernel data
f0190001-f0190001 : led_data
f1000000-f1ffffff : GSC Bus [10/]
  f1000000-f1000fff : Cujo
  f1800000-f1ffffff : Cujo LMMIO
f2000000-f5ffffff : GSC Bus [8/]
  f2000000-f2000fff : Dino
  f2003000-f2003fff : Serial RS232
  f2800000-f2ffffff : Dino LMMIO
  f3ffb000-f3ffb3ff : tulip
f6000000-f7ffffff : GSC Bus [10/]
f8000000-fff7ffff : GSC Bus [8/]
  ffd00000-ffdfffff : Lasi
    ffd00000-ffd00fff : Lasi
    ffd02000-ffd02fff : Parallel
    ffd04000-ffd04fff : Lasi Harmony
    ffd05000-ffd05fff : Serial RS232
    ffd06000-ffd06fff : Lasi SCSI
    ffd08000-ffd0800f : keyboard
    ffd08100-ffd0810f : psaux
fff80000-fffaffff : Central Bus
  fff88000-fff88fff : U2/Uturn
  fff8a000-fff8afff : U2/Uturn
  fffa0000-fffa0fff : CPU
fffb0000-fffdffff : Local Broadcast
fffe0000-ffffffff : Global Broadcast

--3V7upXqbjpZ4EhLz--
