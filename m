Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lufmech.rwth-aachen.de (karman.lufmech.RWTH-Aachen.DE [134.130.177.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF4834A19
	for <parisc-linux@parisc-linux.org>; Thu, 22 Mar 2001 05:40:33 -0700 (MST)
Sender: markus@lufmech.rwth-aachen.de
Message-ID: <3AB9F2BC.33E89887@lufmech.rwth-aachen.de>
Date: Thu, 22 Mar 2001 13:40:28 +0100
From: Markus Werle <markus@lufmech.rwth-aachen.de>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
Subject: [parisc-linux] configure --host=xx revisited
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi !

during the last months I stumbled through the naming
conventions of "host" used in configure scripts of
gcc/binutils and other gnu packages.

I am looking for information about this naming convention.
Some people got confused configuring gcc for hpux, because
e.g. hppa-2.0w-etc. does not mean a 64-bit version.

In order to obtain at least hpux/linux-specific clarity:
Can someone provide a matrix / a mapping between
hp CPUs (or models), operating systems, number of bits and
the gcc naming conventions?

What I want are answers of the form;
If I want to build gcc on a machine YYY running OS XXX,
I have the possibilty to configure for hppa-ZZZZ (32bit)
or hppa-AAAA (64bit).

This leads to a matrix that contains for every combination of
vendor, machine/processor-type, OS and  # of bits
a string XXX for the  --host=XXX command line option
- or a n/a.

Thanks for any help,


Markus
