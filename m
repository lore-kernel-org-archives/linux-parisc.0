Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 86DC248AF
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 23 Feb 2004 02:50:38 -0700 (MST)
Date: Mon, 23 Feb 2004 09:30:06 +0100
Message-ID: <402A42A100007F17@ocpmta1.freegates.net>
In-Reply-To: <20040222054942.GD30849@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Linux only see 2Gb of ram of N4k
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"Matthew Wilcox" <willy@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


>Beautiful diagram! (I'm saving that one)
Yes, Nice
>And I confirmed it is correct in case anyone had doubts.
(I did)

>> So the RAM is uniformly-accessible from all CPUs, but the IO is not.
>
>I don't think there is much penalty for CPU's to access MMIO space
>on "the other side". MMIO reads are so expensive anyway, I'd doubt
>it would make that much difference.
>
>> If you look at pat_memconfig() in arch/parisc/kernel/inventory.c, you'll
>> see how we try to figure out what memory ranges are in the machine.
>> Want to try debugging that, see what's being reported by firmware?
>
>I'm pretty sure it will look like this:
>RAM      Phys Address
>0-2GB -> 0-2GB
>      -> 2-4GB I/O Space (mostly PCI MMIO)
>2-4GB -> 4-6GB (courtesy of the memory controller)
>
>The N-class was the first box which has an I/O hole from 2-4GB
>physical address range. I hope Joel will be able to confirm this.
>If not, I likely have documentation to confirm this.
>
Awaiting I have a more detail look into code, I already have a cat of /proc/iomem:

palx4000:/Sources/Debian4hppa# cat /proc/iomem 
00000000-7fffffff : System RAM
  00000000-000009ff : PDC data (Page Zero)
  00100000-00451387 : Kernel code
  00451388-00605567 : Kernel data
fffffff004000000-fffffff07fffffff : LBA GMMIO
fffffff084000000-fffffff0ffffffff : LBA GMMIO
fffffff104000000-fffffff17fffffff : LBA GMMIO
fffffff204000000-fffffff27fffffff : LBA GMMIO
fffffff284000000-fffffff2ffffffff : LBA GMMIO
fffffff404000000-fffffff47fffffff : LBA GMMIO
fffffff504000000-fffffff57fffffff : LBA GMMIO
fffffff604000000-fffffff67fffffff : LBA GMMIO
fffffff804000000-fffffff87fffffff : LBA GMMIO
fffffff904000000-fffffff97fffffff : LBA GMMIO
fffffffa04000000-fffffffa7fffffff : LBA GMMIO
fffffffc04000000-fffffffc7fffffff : LBA GMMIO
fffffffd04000000-fffffffd7fffffff : LBA GMMIO
fffffffe04000000-fffffffe7fffffff : LBA GMMIO
ffffffff80000000-ffffffff81ffffff : LBA LMMIO
  ffffffff80000000-ffffffff80000fff : 0000:00:04.1
    ffffffff80000000-ffffffff80000007 : serial
    ffffffff80000008-ffffffff8000000f : serial
    ffffffff80000010-ffffffff80000017 : serial
    ffffffff80000038-ffffffff8000003f : serial
  ffffffff80001000-ffffffff80001fff : 0000:00:02.0
    ffffffff80001000-ffffffff80001fff : sym53c8xx
  ffffffff80002000-ffffffff80002fff : 0000:00:02.1
    ffffffff80002000-ffffffff80002fff : sym53c8xx
  ffffffff80003000-ffffffff800033ff : 0000:00:00.0
    ffffffff80003000-ffffffff800033ff : tulip
  ffffffff80004000-ffffffff800040ff : 0000:00:02.0
    ffffffff80004000-ffffffff800040ff : sym53c8xx
  ffffffff80005000-ffffffff800050ff : 0000:00:02.1
    ffffffff80005000-ffffffff800050ff : sym53c8xx
  ffffffff80040000-ffffffff8007ffff : 0000:00:00.0
  ffffffff80080000-ffffffff800800ff : 0000:00:01.0
    ffffffff80080000-ffffffff800800ff : sym53c8xx
  ffffffff80100000-ffffffff80100fff : 0000:00:01.0
    ffffffff80100000-ffffffff80100fff : sym53c8xx
ffffffff82000000-ffffffff83ffffff : LBA LMMIO
ffffffff84000000-ffffffff85ffffff : LBA LMMIO
ffffffff88000000-ffffffff89ffffff : LBA LMMIO
  ffffffff88000000-ffffffff8801ffff : 0000:20:00.0
  ffffffff88020000-ffffffff8803ffff : 0000:20:00.0
  ffffffff88040000-ffffffff880401ff : 0000:20:00.0
ffffffff8a000000-ffffffff8bffffff : LBA LMMIO
  ffffffff8a000000-ffffffff8a0003ff : 0000:28:00.0
    ffffffff8a000000-ffffffff8a0003ff : tulip
ffffffff90000000-ffffffff91ffffff : LBA LMMIO
ffffffff94000000-ffffffff95ffffff : LBA LMMIO
ffffffff98000000-ffffffff99ffffff : LBA LMMIO
ffffffffbffe0000-ffffffffbffe0fff : lba
ffffffffbffe2000-ffffffffbffe2fff : lba
ffffffffbffe4000-ffffffffbffe4fff : lba
ffffffffbffe8000-ffffffffbffe8fff : lba
ffffffffbffea000-ffffffffbffeafff : lba
ffffffffbfff0000-ffffffffbfff0fff : lba
ffffffffbfff4000-ffffffffbfff4fff : lba
ffffffffbfff8000-ffffffffbfff8fff : lba
ffffffffc0000000-ffffffffc1ffffff : LBA LMMIO
ffffffffc4000000-ffffffffc5ffffff : LBA LMMIO
ffffffffc8000000-ffffffffc9ffffff : LBA LMMIO
ffffffffd0000000-ffffffffd1ffffff : LBA LMMIO
ffffffffd4000000-ffffffffd5ffffff : LBA LMMIO
  ffffffffd4000000-ffffffffd401ffff : 0000:d0:00.0
  ffffffffd4020000-ffffffffd403ffff : 0000:d0:00.0
  ffffffffd4040000-ffffffffd40401ff : 0000:d0:00.0
ffffffffd8000000-ffffffffd9ffffff : LBA LMMIO
  ffffffffd8000000-ffffffffd801ffff : 0000:e0:00.0
  ffffffffd8020000-ffffffffd803ffff : 0000:e0:00.0
  ffffffffd8040000-ffffffffd80401ff : 0000:e0:00.0
fffffffffece0000-fffffffffece0fff : lba
fffffffffece4000-fffffffffece4fff : lba
fffffffffece8000-fffffffffece8fff : lba
fffffffffecf0000-fffffffffecf0fff : lba
fffffffffecf4000-fffffffffecf4fff : lba
fffffffffecf8000-fffffffffecf8fff : lba
fffffffffed00000-fffffffffed00fff : SBA
fffffffffed25000-fffffffffed25fff : CPU
fffffffffed40000-fffffffffed40fff : SBA
fffffffffff80000-fffffffffffaffff : Central Bus
fffffffffffb0000-fffffffffffdffff : Local Broadcast
fffffffffffe0000-ffffffffffffffff : Global Broadcast

Does it help?

Joel

----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
