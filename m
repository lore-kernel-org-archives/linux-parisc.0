Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 688B3482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 May 2002 09:47:58 -0600 (MDT)
To: Armijn Hemel <armijn@nl.linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing on b2600 fails 
In-Reply-To: Your message of "Thu, 23 May 2002 15:20:53 +0200."
             <20020523152053.I11717@humbolt.geo.uu.nl>
References: <Pine.A41.4.44.0205211630470.17882-100000@stalin.acc.umu.se> <maswan@acc.umu.se> <20020521154508.99536482A@dsl2.external.hp.com> <20020521175328.A2442@humbolt.geo.uu.nl> <armijn@nl.linux.org> <20020521180553.5470F482A@dsl2.external.hp.com>  <20020523152053.I11717@humbolt.geo.uu.nl> 
Date: Thu, 23 May 2002 09:47:52 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E17Auoi-0001eA-00@paul.bame>
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

> Ehr...how exactly should I do that? I know the first few steps (burn
> lifimage somewhere on a CD, turn on machine, insert CD), but how
> should I proceed? I looked in the FAQ, but the answer (nor the question)
> is there. So, basically my question is: "How do I boot a lifimage from
> a CD?"

I believe there's a booting howto on the web site.

The short answer is to interrupt the boot firmware by pressing
any key in 10 seconds like it says.  Then with the CD in place,
type 'search' and wait.  It should report at least two bootable
devices similar to this:

    temporary
    nickname	bootable-device

	P0	scsi.6.0
	P1	ide

Then you type 'boot p1' or 'boot ide' (or maybe it's ide.0 I forget).

The firmware has a reasonable set of on-line help built in -- that's
how I learned how to use it.

	-P
