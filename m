Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 30 Jun 2003 11:52:01 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Alexander Gabert <pappy@nikita.ath.cx>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.21-pa0 problems with ifconfig?
Message-ID: <20030630175201.GJ14971@dsl2.external.hp.com>
References: <20030630151704.GA24413@nikita.ath.cx> <20030630165550.GG14971@dsl2.external.hp.com> <20030630171125.GA17892@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030630171125.GA17892@nikita.ath.cx>
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

On Mon, Jun 30, 2003 at 07:11:25PM +0200, Alexander Gabert wrote:
> hi,
> 
> adam:/usr/src# uname -a
> Linux adam 2.4.18-32 #1 Sat Mar 30 18:26:22 MST 2002 parisc unknown
> adam:/usr/src# dmesg | grep tulip
> tulip0: no phy info, aborting mtable build
> tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.

This is missing the phy reset polling patch.
expected result.
See ftp://ftp.parisc-linux.org/patches/diff.tulip_media-02

> on a 2.4.20-pa35 with tulip driver compiled in statically:
> adam:/usr/src/working02-gentoo/linux-2.4.20-pa35# grep TULIP .config
> CONFIG_TULIP=y

2.4.20-pa35 tulip definitely works on both hppa and hppa64 kernels.
I use both (c3000 and A500). Something else is wrong.

Perhaps you've suffered some data corruption in a dynamic
lib that ifconfig uses? or ifconfig binary itself?

> ...
> ifconfig (pid 2769): Illegal instruction (code 8)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>      PSW: 00000000000001000000000000001111 Not tainted
>      r00-03  00000000 10348cd0 102041a0 100addc1
>      r04-07  100ad800 10348968 10348968 00000000
>      r08-11  2f2c994c 2efdc610 00000000 00008914
>      r12-15  00000000 ffff7000 faf00560 0003022c
>      r16-19  0003022c 0003022c 0003022c 000000ff
>      r20-23  000000ef 100addc5 102efc1c 0bebc200
>      r24-27  100addc5 000000ef 10348968 1030e010
>      r28-31  e0000000 00000001 2efdcd00 102041a0
>      sr0-3   00000000 00000000 00000000 000023b5
>      sr4-7   00000000 00000000 00000000 00000000

sorry - even though this is the right output, it's incomplete.
I need the IOAQ.

thanks,
grant
