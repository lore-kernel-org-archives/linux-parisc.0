Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout09.sul.t-online.com (mailout09.sul.t-online.com [194.25.134.84])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07249482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Jul 2002 11:07:39 -0600 (MDT)
Content-Type: text/plain; charset=us-ascii
Date: Thu, 25 Jul 2002 18:29:15 +0200
From: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Message-ID: <3D40275B.55D3B7C7@ruhr-west.de>
MIME-Version: 1.0
References: <DAV66Z9F2u1YOyJvAiS00005c0c@hotmail.com>
Subject: Re: [parisc-linux] i dont know jack
To: Rick Vernam <rickvernam@hotmail.com>,
	parisc list <parisc-linux@lists.parisc-linux.org>
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

> Rick Vernam schrieb:
> 
> i work at place that gets tons of computer junk >from companies that
> are getting rid of their equip.  one of our requirements is to kill
> the partitions on the HDs ( it is known that will no completely remove
> data, just make is a little more difficult to get too ).  so we are
> getting HP machines with pa-risc stuff and most wont boot ( i know
> enough to know how to initiate a boot ).  is there some way, using
> this parisc-linux that i can quickly kill partitions?
> 
> -Rick
> rickvernam@hotmail.com

Hi Rick, there probably is. Boot into some nini root environment and
type:

dd if=/dev/null of=/dev/sda [assuming THE drive is sda]

this will overwrite the intire disk with zero bytes (or was /dev/zero
the proper device for that??). Atlernetivly, /dev/random might be a good
source of rubbish data. ;-)

there is the bs= parameter as well (block size). You probably need to
experiment a bit with that, I tried to copy a 20GB disk via dd and it
was dead slow, but I used 8KB as bs. I'd now start with a value of 4-8
MB.

dd if=/dev/null of=/dev/sda bs=512 count=1 will overwrite the boot
sector and partition table; but that's DOS-logic, I do not know how much
of that applies to original HP-UX disks.

Juergen

-- 
===========================================     __   _
Juergen Braukmann juergen.braukmann@gmx.de| -o)/ /  (_)__  __ ____  __
Tel: 0201-743648  dk4jb@db0qs.#nrw.deu.eu | /\\ /__/ / _ \/ // /\ \/ /
===========================================_\_v __/_/_//_/\_,_/ /_/\_\
