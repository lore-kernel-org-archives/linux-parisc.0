Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2889E482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Jun 2002 20:26:56 -0600 (MDT)
Date: Wed, 5 Jun 2002 22:26:52 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: marc <marc@centraltx.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Building my first kernel
Message-ID: <20020605222652.C1118@systemhalted>
References: <200206052016.AA1508901426@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200206052016.AA1508901426@mail.centraltx.com>; from marc@centraltx.com on Wed, Jun 05, 2002 at 08:16:24PM -0500
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

> I'm trying to build the 2.4.18 kernel, and everything goes great
> until I get to the `make bzImage` part and it screams about palo.
> I'm assuming I need the palo source. is this right??
> 
> -Marc
>

Yup.

$SRC-TREE--|
           |--- /linux
           |
           |--- /palo

cd linux;
make oldconfig;
make menuconfig; (Fiddle)
make dep;
make palo;

This puts the required lifimage in $SRC-TREE/palo

c.
