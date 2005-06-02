From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ccio-dma 64bit debug_init info
Date: Thu, 2 Jun 2005 18:01:20 +0200
Message-ID: <4282FEEE00008707@mail-5-bnl.tiscali.it>
References: <1116610441.5174.40.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: "James Bottomley" <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1116610441.5174.40.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Hello James,
> 
> On Fri, 2005-05-20 at 19:16 +0200, Joel Soete wrote:
> > Btw I also have an external bootable disk narrow SE connected to the
s710
> > driver. Do you know if this one is 64bit capable?
> 
> The lasi700 driver works fine in a 64 bit kernel, yes.
> 
You have right I just reinstall an external disk on lasi700 (53c700) cont=
roler
and boot a 64bit kernel (with ncr53c8x as module) :-)

BUT it is horribly slow:
    o it takes about a 1.5 h to boot (about 5 min for its twin 32bit)
    o a ssh connection takes about a min too (only some seconds for 32bit=

kernel)

and fwiw top:
top - 13:49:13 up  1:02,  1 user,  load average: 1.98, 3.13, 3.64
Tasks:  39 total,   4 running,  35 sleeping,   0 stopped,   0 zombie
Cpu(s):  0.0% us,  0.0% sy,  0.0% ni, 100.0% id,  0.0% wa,  0.0% hi,  0.0=
%
si
Mem:    252696k total,    47148k used,   205548k free,     3192k buffers
Swap:   131928k total,        0k used,   131928k free,    27104k cached
[...]

just show an 100% idle system?

Another known issue for this kind of d model?

Any idea?

Thanks,
    Joel

btw: I read this strange messages when it init raid5
[snip]
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     : -923425.-184 MB/sec
   8regs_prefetch: 1824022.112 MB/sec
   32regs    : 328350.816 MB/sec
   32regs_prefetch: -1188109.-184 MB/sec
raid5: using function: 8regs_prefetch (1824022.112 MB/sec)
md: md driver 0.90.1 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
[snip]

while the 32bit showed me more relevant values:
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :   574.400 MB/sec
   8regs_prefetch:   387.600 MB/sec
   32regs    :   447.600 MB/sec
   32regs_prefetch:   345.200 MB/sec
raid5: using function: 8regs (574.400 MB/sec)
md: md driver 0.90.1 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27

obviously I remove also raid5 support but it doesn't help :-(



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
