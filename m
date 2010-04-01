From: NIIBE Yutaka <gniibe@fsij.org>
Subject: Re: CAS (lws_compare_and_swap32)
Date: Thu, 01 Apr 2010 10:16:58 +0900
Message-ID: <4BB3F40A.7020401@fsij.org>
References: <4BB0B2C8.8000302@fsij.org>	 <119aab441003290913x6cb925b9v66b44a14c31393cb@mail.gmail.com>	 <119aab441003291231j320e6637g87c201f75ee61faf@mail.gmail.com>	 <20100329200705.GE20286@bombadil.infradead.org> <119aab441003301338o1d0582f3wdbf82681f88ed671@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kyle McMartin <kyle@mcmartin.ca>, debian-hppa@lists.debian.org,
 linux-parisc <linux-parisc@vger.kernel.org>,
 Helge Deller <deller@gmx.de>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <119aab441003301338o1d0582f3wdbf82681f88ed671@mail.gmail.com>
Resent-Message-ID: <ysV0iHBiNpM.A.aQF.Uf_sLB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Hi all, thanks for your attention.

Carlos O'Donell wrote:
> On UP you have a problem:
> * Thread A enters LWS CAS (no lock on UP)
> * Thread A writes to CAS address causing COW
> * Thread A sleeps.
> * Thread A completes COW, but finishes time slice before the write is restarted.
> * Thread B enters LWS CAS (no lock on UP)
> * Thread B writes to CAS address, and finishes time slice.
> * Thread A writes to CAS address and clobbers B's value.

I thought like that:
(condition like a young process, or a process after fork
which occurs COW)
* Thread A enters LWS CAS (no lock on UP)
* Thread A writes to CAS address causing COW
* Thread A sleeps for new memory.
  Kernel process scheduling:
    Thread A sleeps
    -> swapper wakes up and got new memory, then sleep
    -> Thread B wakes up
* Thread B enters LWS CAS (no lock on UP)
* Thread B writes to CAS address, causing COW, this time we have memory.
  Writes completes, and finishes time slice.
  Kernel process scheduling like that:
    Thread B sleeps -> Thread A wakes up
* Thread A writes to CAS address and clobbers B's value.

Today, I have a next question.  Is there any cache alias problem here?
Should we invalidate the cache line before "load" and flush the cache
line after "store"?

I am testing on paer.debian.org.  It says D-cache is wribe back,
and that's my concern.

--------------------------
Welcome to paer.debian.org, the Debian hppa porterbox

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Last login: Wed Mar 31 02:31:27 2010 from 150.82.175.29
gniibe@paer:~$ cat /proc/cpuinfo
processor	: 0
cpu family	: PA-RISC 2.0
cpu		: PA8700 (PCX-W2)
cpu MHz		: 750.000000
capabilities	: os64
model		: 9000/800/A500-7X
model name	: Crescendo 750 W2
hversion	: 0x00005e30
sversion	: 0x00000491
I-cache		: 768 KB
D-cache		: 1536 KB (WB, direct mapped)
ITLB entries	: 240
DTLB entries	: 240 - shared with ITLB
bogomips	: 1495.04
software id	: 822930640

--------------------------
-- 
