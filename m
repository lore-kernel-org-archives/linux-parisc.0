Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 18 Sep 2003 17:00:05 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: "SUDARSANAN,RANJITH (HP-India,ex2)" <ranjith_sudarsanan@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems with raw interface.
Message-ID: <20030918230005.GA2315@dsl2.external.hp.com>
References: <A11077E28200D51182EA00D0B7755253099DF4E0@xin02.india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <A11077E28200D51182EA00D0B7755253099DF4E0@xin02.india.hp.com>
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

On Fri, Sep 19, 2003 at 12:36:55AM +0530, SUDARSANAN,RANJITH (HP-India,ex2) wrote:
...
> oak:/home/sranjith# raw /dev/raw/rawsdb /dev/sdb
> /dev/raw/raw1:  bound to major 8, minor 16
> oak:/home/sranjith# raw /dev/raw/rawsda /dev/sda
> /dev/raw/raw2:  bound to major 8, minor 0
> 
> oak:/home/sranjith# raw -qa
> /dev/raw/raw1:  bound to major 8, minor 16
> /dev/raw/raw2:  bound to major 8, minor 0

I get the impression "raw" is ignoring your input parameter
to use /dev/raw/rawsdb and is using /dev/raw/raw<N> instead.
So it looks like you are comparing the wrong data...

root@debian:/dev# raw --help
raw: invalid option -- -
Usage:
  raw /dev/raw/rawN <major> <minor>
  raw /dev/raw/rawN /dev/<blockdev>
  raw -q /dev/raw/rawN
  raw -qa

What does "dd if=/dev/raw/raw2 of=/tmp/o_raw2 bs=512 count=8" result in?

Anyway, it looks broken for me too.
I tried using raw on 32-bit 2.4.20-pa28:

	raw /dev/raw/raw1 /dev/sda
	raw -qa
/dev/raw/raw1:  bound to major 8, minor 0
	dd if=/dev/raw/raw1 of=/tmp/raw1.o count=8
	/usr/bin/od -Ax -t x /tmp/raw1.o 
000000 00000000 00000000 00000000 00000000
*
001000


/dev/sda is the boot disk for this machine.

root@debian:/dev# /usr/bin/od -Ax -t x /dev/sda | less
000000 00000000 00000000 00000000 00000000
*
000400 40030800 60653403 00000000 0a086200
000410 cd700200 00000000 02000000 02000000
000420 00800000 00800000 40010000 371e6a3f
000430 371e6a3f 10001800 53ef0100 01000000
....


grant
