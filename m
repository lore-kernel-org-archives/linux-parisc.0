From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] Ctrl-C bug again
Date: Sun, 23 Oct 2005 01:09:18 +0200
Message-ID: <7d01f9f00510221609q598c2f8m2281f54421c84f73@mail.gmail.com>
References: <7d01f9f00510211609g3cf6f223i52c0f10a20f442c3@mail.gmail.com>
	<20051022002244.GB18007@tachyon.int.mcmartin.ca>
	<7d01f9f00510220538heef8ae7od7dfa38530b3916e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00510220538heef8ae7od7dfa38530b3916e@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 10/22/05, Thibaut VARENE <T-Bone@parisc-linux.org> wrote:
> On 10/22/05, Kyle McMartin <kyle@mcmartin.ca> wrote:
> > On Sat, Oct 22, 2005 at 01:09:02AM +0200, Thibaut VARENE wrote:
> > >  IIR: 0ee850b6    ISR: 0000000000000000  IOR: 0000000000024000
> > >  CPU:        1   CR30: 00000000f9400000 CR31: 0000000080000000
> > >  ORIG_R28: 0000000000093000
> > >  IAOQ[0]: pa_memcpy+0x88/0x2b0
> > >  IAOQ[1]: pa_memcpy+0x8c/0x2b0
> > >  RP(r2): 0x1e90
> > > Kernel panic - not syncing: Kernel Fault
> > >
> >
> > I wonder... was snd-ad1889/alsa a module?
>
> yes indeed
> I'll try again with built-in driver

here you go:

Backtrace:
 [<00000000102ef6cc>] copy_from_user+0x34/0x40
 [<00000000103b15c4>] snd_pcm_lib_write_transfer+0x144/0x178
 [<00000000103b1a64>] snd_pcm_lib_write1+0x46c/0x688
 [<00000000103b1d1c>] snd_pcm_lib_write+0x9c/0x158
 [<00000000103bb824>] snd_pcm_oss_sync+0x32c/0x348
 [<00000000103bca34>] snd_pcm_oss_release+0x3c/0x240
 [<00000000101b93bc>] __fput+0xe4/0x310
 [<00000000101b966c>] fput+0x84/0x90
 [<00000000101b7438>] filp_close+0x90/0xd8
 [<00000000101b7558>] sys_close+0xd8/0x110
 [<0000000010107fa8>] syscall_exit+0x0/0x14


Kernel Fault: Code=3D15 regs=3D00000000fd560880 (Addr=3D000000000000b000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  0000000000000000 00000000000000aa 0000000000001e90 00000000ff9e600c
r04-07  0000000010600d00 0000000000009ed0 0000000000001803 0000000000008028
r08-11  00000000fd766828 00000000000007a4 00000000103b1a64 00000000ff9298e8
r12-15  00000000000007aa 00000000000007aa 000000001053f880 0000000000008028
r16-19  00000000105d5300 0000000000000000 00000000103b1d1c 000000002c64ef76
r20-23  0000000052fad5f8 00000000531540b4 000000003016512d 000000000000b000
r24-27  0000000000000d70 00000000ff9e713c 000000000000001f 0000000010600d00
r28-31  000000000000f480 0000000000009ed0 00000000fd560880 00000000ff9e600c
sr0-3   0000000000291000 0000000000000000 0000000000000000 00000000004c5800
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000000000000000000000000
FPER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
fr04-07  0000000010600d00 00000000fff95000 0000000000000020 fffffffffffffc1=
8
fr08-11  0000000000000000 0000000000000802 0000000000000000 0000000010600d0=
0
fr12-15  00000000fff95000 0000000014a8aac4 ffffffffffffffe8 0000000014a8aac=
0
fr16-19  0000000014a8aad0 0000000010600d00 0000000000000000 0000000010600d0=
0
fr20-23  000f000000000000 0000000000000802 0000000000000000 000000000000002=
0
fr24-27  0000000000000000 0000000000000802 00000000101b6d98 000000001065800=
0
fr28-31  00000000fff95000 0000000000000802 0000000000000000 00000000ff9b2bc=
0

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000102ef238 00000000102e=
f23c
 IIR: 0ee850b6    ISR: 0000000000000000  IOR: 000000000000b000
 CPU:        1   CR30: 00000000fd560000 CR31: 0000000080000000
 ORIG_R28: 0000000010600d00
 IAOQ[0]: pa_memcpy+0x88/0x2b0
 IAOQ[1]: pa_memcpy+0x8c/0x2b0
 RP(r2): 0x1e90
Kernel panic - not syncing: Kernel Fault

Simple testcase:

while :; do mpg123 foo.mp3; done

then hold down ctrl-C. You should be able to take down the box in a
few attempts like that...

--
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
