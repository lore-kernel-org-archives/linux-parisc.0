Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ausmtp01.au.ibm.com (ausmtp01.au.ibm.com [202.81.18.186])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4014B4829
	for <parisc-linux@parisc-linux.org>; Mon,  2 Jun 2003 17:10:46 -0600 (MDT)
Date: Tue, 3 Jun 2003 09:09:49 +1000
From: Alan Modra <amodra@bigpond.net.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, bug-binutils@gnu.org,
	binutils@sources.redhat.com, parisc-linux@parisc-linux.org,
	debian-gcc@lists.debian.org
Subject: Re: [parisc-linux] Re: [hppa] binutils will not build shared libraries with external deps?
Message-ID: <20030602230949.GB17437@ozlabs.au.ibm.com>
References: <20030528190706.GC21904@bubble.sa.bigpond.net.au> <200306022110.h52LAdt3024082@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200306022110.h52LAdt3024082@hiauly1.hia.nrc.ca>
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

On Mon, Jun 02, 2003 at 05:10:38PM -0400, John David Anglin wrote:
> tmpdir/sh1p.o(.text+0x0): In function `shlib_mainvar':
> /home/dave/binutils-2.14.90/src/ld/testsuite/ld-elfvsb/sh1.c:32: undefined refer
> ence to `mainvar'
> ...
> FAIL: visibility (hidden)

Fixing this one probably requires porting some of the recent changes
I made for x86 and ppc to hppa.  See SYMBOL_REFERENCES_LOCAL and
SYMBOL_CALLS_LOCAL.

-- 
Alan Modra
IBM OzLabs - Linux Technology Centre
