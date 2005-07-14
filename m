From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] PA 2.0 float conversion to unsigned long long
Date: Thu, 14 Jul 2005 08:29:15 +0200
Message-ID: <42BAE7C300005798@mail-5-bnl.tiscali.it>
References: <200507140356.j6E3uShf022345@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 kyle@mcmartin.ca
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507140356.j6E3uShf022345@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> -- Original Message --
> To: kyle@mcmartin.ca (Kyle McMartin)
> Date: Wed, 13 Jul 2005 23:56:28 -0400 (EDT)
> From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] PA 2.0 float conversion to unsigned long lo=
ng
> 
> 
> > On Wed, Jul 13, 2005 at 10:53:50PM -0400, John David Anglin wrote:
> > > The enclosed testcase derived from GCC PR 22474 aborts under linux
but
> > > not under hpux.  The problem is the following insn:
> > >=3D20
> > > 0x00002930 <f2ull+24>:  fcnv,t,sgl,udw fr22,fr22
> > >=3D20
> > 
> > Might this be an insn that is not implemented in hardware, and
> > correctly being trapped on hpux, but not on Linux? I took a look
> > in arch/parisc/math-emu, but it's quite a bit more than I can handle.=

:)
> 
> That's what I was thinking when I wrote the message.  Under linux,
> both the left and right halves of fr22 end up with 0x80000000.  Under
> hpux, the left result is 0x80000000 and the right 0.  The only other
> explanation is that the c3k fpu has a bug that's not present in an A500=

> (doubtful).
> 
No: here same 
 # ./pr22474 
Aborted

on n4k, b2k and d380 runing respectively: 2.6.12-pa2-n4ksmp, 2.6.11.12-pa=
4-b2k32,
2.6.12-pa1-d32up.

with cpu:
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8600 (PCX-W+)
cpu MHz         : 550.000000
model           : 9000/800/N4000-55
model name      : Unknown machine
hversion        : 0x00005d30
sversion        : 0x00000491
I-cache         : 512 KB
D-cache         : 1024 KB (WB, 0-way associative)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
bogomips        : 1093.63
software id     : 664309341
[x2]

# cat /proc/cpuinfo 
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8600 (PCX-W+)
cpu MHz         : 400.000000
model           : 9000/785/B2000
model name      : Kazoo W+
hversion        : 0x00005d00
sversion        : 0x00000481
I-cache         : 512 KB
D-cache         : 1024 KB (WB, 0-way associative)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
bogomips        : 796.67
software id     : 2011773200

# cat /proc/cpuinfo 
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8000 (PCX-U)
cpu MHz         : 180.000000
model           : 9000/820/D380
model name      : UL proc 2-way U180 1M/1M
hversion        : 0x00005aa0
sversion        : 0x00000491
I-cache         : 1024 KB
D-cache         : 1024 KB (WB, 0-way associative)
ITLB entries    : 96
DTLB entries    : 96 - shared with ITLB
BTLB            : not supported
bogomips        : 359.62
software id     : 2005347373

either compiled with (debian testing) gcc-3.3.5 or new (debian unstable d=
efault)
gcc-4.0.1

(unfortunately I don't have any place where I could install gcc on pa-2.0=

arch :-( )

Hth,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
