Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel10.hp.com (palrel10.hp.com [156.153.255.245])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC7714873
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 21:30:17 -0700 (MST)
Message-ID: <3C8ED5C5.A0E78DC3@cup.hp.com>
Date: Tue, 12 Mar 2002 20:29:57 -0800
From: Gururaj Ananthateerta <gururaj@cup.hp.com>
MIME-Version: 1.0
To: Paul Bame <bame@riverrock.org>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] new vmlinux!!!
References: <20011001175425.A31305@dogbert.localdomain> <Pine.NEB.4.33.0110021434430.24166-100000@www2.scram.de> <20011005222028.A13585@dogbert.localdomain> <20011005215600.B3745@parcelfarce.linux.theplanet.co.uk> <20011005233602.A13826@dogbert.localdomain> <3C8D3619.519A601C@cup.hp.com>  <20020312172445.B11A64849@dsl2.external.hp.com> <m16kqpC-000KyQC@phantom.home>
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

Paul Bame wrote:

> > Gururaj Ananthateerta wrote:
> > > I have 3 partitions on primary disk
> > >    Device Boot    Start       End    Blocks   Id  System
> > > /dev/sda1             1        95     97264   f0  Linux/PA-RISC boot
> > > /dev/sda2            96       339    249856   82  Linux swap
> > > /dev/sda3           340      8683   8544256   83  Linux
> >
> > partitions are fine.
>
> Actually they're not.  This is a frequent install problem and I've
> replied off the list about it.  The root partition passes the 2G limit
> and Gururaj now has a small /boot I think.
>

>         -P

yes you are right,
thanks
grant clarified this in his previous mail.
