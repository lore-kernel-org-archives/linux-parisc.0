Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 609B74829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 14:17:04 -0700 (MST)
Date: Mon, 11 Nov 2002 16:17:13 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111211713.GD9704@systemhalted>
References: <20021111204248.GB9704@systemhalted> <200211112057.gABKvb32002918@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211112057.gABKvb32002918@hiauly1.hia.nrc.ca>
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

On Mon, Nov 11, 2002 at 03:57:37PM -0500, John David Anglin wrote:
> > make[2]: *** [/elf/vismain.out] Error 1
> > make[2]: *** [/elf/neededtest.out] Error 14
> > make[2]: *** [/elf/neededtest2.out] Error 14
> > make[2]: *** [/elf/neededtest3.out] Error 17
> > make[2]: *** [/elf/neededtest4.out] Error 2
> > make[2]: *** [/elf/circleload1.out] Error 9
> > make[1]: *** [elf/tests] Error 2
> > make: *** [check] Error 2
> 
> I am not surprised about these.  There definitely problems with
> the visibility of symbols based on the binutils testsuite.  These
> didn't show up before because the visibility tests didn't run
> on the pa.
> 

The fix is non-obvious to me. I have no idea where to begin here.
Any hints? :)

c.
