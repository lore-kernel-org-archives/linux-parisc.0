Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (f70.law4.hotmail.com [216.33.149.70])
	by dsl2.external.hp.com (Postfix) with ESMTP id B200F482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 03:06:35 -0600 (MDT)
From: "Kenneth Westelinck" <kennywest1@hotmail.com>
To: carlos@baldric.uwo.ca, marc@centraltx.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Building my first kernel
Date: Thu, 06 Jun 2002 09:06:33 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Message-ID: <F70qSkZ2On3DnRB0MtS00012bca@hotmail.com>
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

Hi,

For what it's worth.

I always build my kernel the i386 way:
make menuconfig
make dep clean bzImage

I always use the nightly snapshots available from ftp.parisc-linux.org/cvs/ 
.


regards,

Kenneth
>From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
>To: marc <marc@centraltx.com>
>CC: parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] Building my first kernel
>Date: Wed, 5 Jun 2002 22:26:52 -0400
>
> > I'm trying to build the 2.4.18 kernel, and everything goes great
> > until I get to the `make bzImage` part and it screams about palo.
> > I'm assuming I need the palo source. is this right??
> >
> > -Marc
> >
>
>Yup.
>
>$SRC-TREE--|
>            |--- /linux
>            |
>            |--- /palo
>
>cd linux;
>make oldconfig;
>make menuconfig; (Fiddle)
>make dep;
>make palo;
>
>This puts the required lifimage in $SRC-TREE/palo
>
>c.
>
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


enjoy life, enjoy linux,

Kenneth

_________________________________________________________________
Verzend en ontvang Hotmail via je mobieltje: http://mobile.msn.com
