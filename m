Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F5954844
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 07:29:45 -0700 (MST)
Date: Mon, 18 Feb 2002 09:29:56 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: =?iso-8859-1?Q?Jo=EBl_Soete?= <jso@europay.com>
Cc: dave@hiauly1.hia.nrc.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: hppa-linux gcc-3.0.3:
Message-ID: <20020218092956.A1324@systemhalted>
References: <OF5687265E.42AF0F56-ONC1256B64.00367C5C@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OF5687265E.42AF0F56-ONC1256B64.00367C5C@com>; from jso@europay.com on Mon, Feb 18, 2002 at 11:19:33AM +0100
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

> Hi Dave,
> 
> Can you explain me how to get those sources.
> 'http://www.parisc-linux.org/toolchain/index.html', I would also need
> corresponding binutils and glibc sources?
> Which release do I have do use to rebuild gcc-3.1 and how to get their src
> (if requested)?

J,

[Re: Numbers]

I think you might mean rebuilding gcc-3.0.1?

[Re: How to build]

You can take a look at:
http://www.parisc-linux.org/toolchain/PARISC-Linux-XC-HOWTO.html

Which has the detail for building binutils, gcc, glibc as a XC,
but in general it's pretty much the same for most situations.


[Re: Locations]

binutils, glibc, gcc:

ftp://ftp.debian.org/debian/pool/main/b/binutils/
ftp://ftp.debian.org/debian/pool/main/g/glibc/

ftp://ftp.debian.org/debian/pool/main/g/gcc-3.0/ (New)
ftp://ftp.debian.org/debian/pool/main/g/gcc-snapshot/ (VERY New)

You can change ftp.debian.org to match the closest mirror.

Get the latest source for everything and start compiling!

/me smiles 

c.
