Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF47B482C
	for <parisc-linux@parisc-linux.org>; Tue, 13 Nov 2001 11:33:42 -0700 (MST)
Date: Tue, 13 Nov 2001 19:33:30 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Deb's broken ?
Message-ID: <20011113193330.D12388@lug-owl.de>
References: <20011113181352.B382@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011113181352.B382@hp.is>
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

On Tue, 2001-11-13 18:13:52 +0000, Richard Allen <ra@hp.is>
wrote in message <20011113181352.B382@hp.is>:
> bofh:~# apt-get upgrade
[...]

> Sorry, but the following packages have unmet dependencies:
>   gzip: PreDepends: libc6 (>= 2.2.4-4) but 2.2.4-3 is to be installed
> E: Sorry, broken packages
> 
> ii  libc6          2.2.4-3        GNU C Library: Shared libraries and Timezone
> ii  libc6-dev      2.2.4-3        GNU C Library: Development Libraries and Hea

I've tried to natively build 2.2.4-4 on a 712/60 with gcc-3.0. It
breaks in ./glibc-2.2.4/sysdeps/hppa/dl-machine.h at line 534:

    533       /* .eh_frame can have unaligned relocs.  */
--> 534       if (reloc_addr & 3)
    535         {
    536           char *rel_addr = (char *) reloc_addr;
    537           rel_addr[0] = value >> 24;
    538           rel_addr[1] = value >> 16;
    539           rel_addr[2] = value >> 8;
    540           rel_addr[3] = value;
    541           return;
    542         }
    543       break;
    544 

I didn't see why I may not check the two low bits... I gave up:-(

MfG, JBG

-- 
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	http://lug-owl.de/~jbglaw/software/snapshot2cvs/
