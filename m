Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.storm.ca (mail.storm.ca [209.87.239.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9329E482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Jul 2002 12:06:52 -0600 (MDT)
Received: from storm.ca (ppp-209-87-255-11.ottawa.storm.ca [209.87.255.11])
	by mail.storm.ca (8.11.6+Sun/8.11.6) with ESMTP id g6PI6pT11704
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Jul 2002 14:06:51 -0400 (EDT)
Message-ID: <3D406598.B862D0EC@storm.ca>
Date: Thu, 25 Jul 2002 13:54:48 -0700
From: Sandy Harris <sandy@storm.ca>
MIME-Version: 1.0
Cc: parisc list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] i dont know jack
References: <DAV66Z9F2u1YOyJvAiS00005c0c@hotmail.com> <3D40275B.55D3B7C7@ruhr-west.de>
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

Juergen Braukmann wrote:

> Hi Rick, there probably is. Boot into some nini root environment and
> type:
> 
> dd if=/dev/null of=/dev/sda [assuming THE drive is sda]
> 
> this will overwrite the intire disk with zero bytes (or was /dev/zero
> the proper device for that??).

/dev/zero gives a stream of null bytes.

Don't use /dev/null; it returns EOF on all reads, or did when I learned
the rules on older Unix and I suspect that still true.

> Atlernetivly, /dev/random might be a good source of rubbish data. ;-)

Not /dev/random. It was designed to produce high-grade random numbers
for critical applications like generating PGP keys. It blocks if you
try to take out more random data than it has input entropy.

/dev/urandom does not block, so you could use that.

It would likely be better to use a little program that just seeds itself
from /dev/urandom and then cranks out lots of psuedo-random crud
quickly.
The FreeS/WAN libraries include source you could use:
http://www.freeswan.org/freeswan_snaps/CURRENT-SNAP/doc/manpage.d/ipsec_prng.3.html
 
> there is the bs= parameter as well (block size). You probably need to
> experiment a bit with that, I tried to copy a 20GB disk via dd and it
> was dead slow, but I used 8KB as bs. I'd now start with a value of 4-8
> MB.

Yes, use a large block size.

How thorough do you need to be? At one extreme, just trashing the
partition table or superbloack may be all you need. At the other,
you may need to do a fair bit of programming.

The classic paper on secure deletion is:
http://www.cs.auckland.ac.nz/~pgut001/pubs/secure_del.html

I once read a US gov't standard for overwriting disks with
non-classified
data on them. (For classified data, you destroy the disk.) It wanted a
minimum of three overwrites, all-0s, all-1s and random data.

The hard part was that you had to guarantee to do that everywhere,
including
blocks the OS or drive had marked bad, things outside partitions that
the OS
couldn't see, ...

A handy loop for cheap but fairly thorough deletions is:

for( i = u = 0 ; i < 4 ; i++, u += 0x55555555 )

This walks each nybble of u through the values 0000, 0101, 1010, 1111 so
you gat the US gov'ts all-0s and all-1s plus a couple of others.
