From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] D380 attempt to boot in 64bits [Was: ccio-dma 64bit
	debug_init info]
Date: Fri, 3 Jun 2005 18:01:51 +0200
Message-ID: <4282FEEC00008F40@mail-3-bnl.tiscali.it>
References: <4282FEEE00008707@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: "James Bottomley" <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4282FEEE00008707@mail-5-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

> >
> > On Fri, 2005-05-20 at 19:16 +0200, Joel Soete wrote:
> > > Btw I also have an external bootable disk narrow SE connected to th=
e
> s710
> > > driver. Do you know if this one is 64bit capable?
> >
> > The lasi700 driver works fine in a 64 bit kernel, yes.
> >
> You have right I just reinstall an external disk on lasi700 (53c700) co=
ntroler
> and boot a 64bit kernel (with ncr53c8x as module) :-)
> 
> BUT it is horribly slow:
>     o it takes about a 1.5 h to boot (about 5 min for its twin 32bit)
>     o a ssh connection takes about a min too (only some seconds for 32b=
it
> kernel)
> 
> and fwiw top:
> top - 13:49:13 up  1:02,  1 user,  load average: 1.98, 3.13, 3.64
> Tasks:  39 total,   4 running,  35 sleeping,   0 stopped,   0 zombie
> Cpu(s):  0.0% us,  0.0% sy,  0.0% ni, 100.0% id,  0.0% wa,  0.0% hi,  0=
.0%
> si
> Mem:    252696k total,    47148k used,   205548k free,     3192k buffer=
s
> Swap:   131928k total,        0k used,   131928k free,    27104k cached=

> [...]
> 
> just show an 100% idle system?
> 
> Another known issue for this kind of d model?
> 
> Any idea?
> 
> Thanks,
>     Joel
> 
> btw: I read this strange messages when it init raid5
> [snip]
> md: linear personality registered as nr 1
> md: raid0 personality registered as nr 2
> md: raid1 personality registered as nr 3
> md: raid5 personality registered as nr 4
> raid5: measuring checksumming speed
>    8regs     : -923425.-184 MB/sec
>    8regs_prefetch: 1824022.112 MB/sec
>    32regs    : 328350.816 MB/sec
>    32regs_prefetch: -1188109.-184 MB/sec
> raid5: using function: 8regs_prefetch (1824022.112 MB/sec)
> md: md driver 0.90.1 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
> [snip]
> 
> while the 32bit showed me more relevant values:
> md: linear personality registered as nr 1
> md: raid0 personality registered as nr 2
> md: raid1 personality registered as nr 3
> md: raid5 personality registered as nr 4
> raid5: measuring checksumming speed
>    8regs     :   574.400 MB/sec
>    8regs_prefetch:   387.600 MB/sec
>    32regs    :   447.600 MB/sec
>    32regs_prefetch:   345.200 MB/sec
> raid5: using function: 8regs (574.400 MB/sec)
> md: md driver 0.90.1 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
> 
> obviously I remove also raid5 support but it doesn't help :-(
> 
Would I ever have a chance to boot it 64bits?

Here are some additional strage stuff:
[snip]
CPU(s): 1 x PA8000 (PCX-U) at 180.000000 MHz
Whole cache flush 378186 cycles, flushing 274443696 bytes 107618208 cycle=
s
Setting cache flush threshold to 0xeb780 (1 CPUs online)
[snip]
LASI 82596 driver - Revision: 1.30
Found i82596 at 0xffffffffffd07000, IRQ 17
eth0: 82596 at 0xffffffffffd07000, 00 00 00 00 08 00 IRQ 17.
[snip]

while the 32bit kernel said:
[snip]
Setting cache flush threshold to 20 (1 CPUs online)
[snip]
LASI 82596 driver - Revision: 1.30
Found i82596 at 0xffd07000, IRQ 17javascript:OnPhoenixSend();
eth0: 82596 at 0xffd07000, 08 00 09 D2 89 15 IRQ 17.
[snip]

Questions are:
    o could it be that 'cache flush threshold' value was the reason why t=
he
system became so slow?
       (couldn't it be why ncr doesn't start correctly?
        s=3D2 sec in top actualy means about 30sec between 2 changes in d=
isplay
:-( )
    o Is nic 82596 is not 64bit ready? (apparently didn't report the righ=
t
MAC Address?)

Thanks in advance for help,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
