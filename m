From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: [parisc-linux] Ctrl-C bug again
Date: Sat, 22 Oct 2005 01:09:02 +0200
Message-ID: <7d01f9f00510211609g3cf6f223i52c0f10a20f442c3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Pa,

I hit the damned "Ctrl-C" bug again on my j6k SMP today with mpg123,
running CVS HEAD 64bit smp: Linux version 2.6.14-rc5-pa1
(varenet@Esperanza) (gcc version 3.4.5 200508215

Backtrace:
 [<00000000102ef6cc>] copy_from_user+0x34/0x40
 [<00000000000ac8dc>] snd_pcm_lib_write_transfer+0x144/0x178 [snd_pcm]
 [<00000000000acd7c>] snd_pcm_lib_write1+0x46c/0x688 [snd_pcm]
 [<00000000000ad034>] snd_pcm_lib_write+0x9c/0x158 [snd_pcm]
 [<0000000000101414>] snd_pcm_oss_sync+0x32c/0x348 [snd_pcm_oss]
 [<0000000000102624>] snd_pcm_oss_release+0x3c/0x240 [snd_pcm_oss]
 [<00000000101b93bc>] __fput+0xe4/0x310
 [<00000000101b966c>] fput+0x84/0x90
 [<00000000101b7438>] filp_close+0x90/0xd8
 [<00000000101b7558>] sys_close+0xd8/0x110
 [<0000000010107fa8>] syscall_exit+0x0/0x14


Kernel Fault: Code=3D15 regs=3D00000000f9400880 (Addr=3D0000000000024000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  0000000000000000 00000000102ef698 0000000000001e90 00000000fe16600c
r04-07  0000000000093000 0000000000022ed0 0000000000001803 0000000000021028
r08-11  00000000fc092c28 00000000000007a4 00000000000acd7c 00000000fe955ae8
r12-15  00000000000007aa 00000000000007aa 00000000000bad90 0000000000021028
r16-19  00000000000981a0 0000000000000000 00000000000ad034 0000000000000000
r20-23  0000000000000000 0000000000000000 0000000000000000 0000000000024000
r24-27  0000000000000d70 00000000fe16713c 000000000000001f 0000000010575000
r28-31  000000000000f480 0000000000022ed0 00000000f9400880 00000000fe16600c
sr0-3   00000000002f2000 0000000000000000 0000000000000000 0000000000412800
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000000000000000000000000
FPER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
fr04-07  0000000010575000 00000000ff8fb000 0000000000000020 fffffffffffffc1=
8
fr08-11  0000000000000000 0000000000000802 0000000000000000 000000001057500=
0
fr12-15  00000000ff8fb000 0000000014a23ac4 ffffffffffffffe8 0000000014a23ac=
0
fr16-19  0000000014a23ad0 0000000010575000 0000000000000000 000000001057500=
0
fr20-23  000f000000000000 0000000000000802 0000000000000000 000000000000002=
0
fr24-27  0000000000000000 0000000000000802 00000000101b6d98 00000000105c500=
0
fr28-31  00000000ff8fb000 0000000000000802 0000000000000000 00000000ff8fcbc=
0

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000102ef238 00000000102e=
f23c
 IIR: 0ee850b6    ISR: 0000000000000000  IOR: 0000000000024000
 CPU:        1   CR30: 00000000f9400000 CR31: 0000000080000000
 ORIG_R28: 0000000000093000
 IAOQ[0]: pa_memcpy+0x88/0x2b0
 IAOQ[1]: pa_memcpy+0x8c/0x2b0
 RP(r2): 0x1e90
Kernel panic - not syncing: Kernel Fault

HTH

T-Bone

--
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
