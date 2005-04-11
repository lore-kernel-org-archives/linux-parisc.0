From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] SLAB bug SMP 64bit / XFS mess
Date: Sun, 10 Apr 2005 23:15:17 -0600
Message-ID: <20050411051517.GB30629@colo.lackof.org>
References: <20050404110025.GA6987@tausq.org>
	<4208AA1B000184AE@mail-3-bnl.tiscali.it>
	<20050408205428.GJ1833@baldric.uwo.ca>
	<20050409021049.0d0a851d@Tatooine.r3z0>
	<20050411045747.GA30629@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050411045747.GA30629@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Apr 10, 2005 at 10:57:47PM -0600, Grant Grundler wrote:
> Sorry, though my j6k did not panic with 32-bit kernel, there is
> definitely some XFS bug(s?).  Test output and details follow.

Just for comparison, I ran the same workload on ext3 and it worked fine.
Started with "mke2fs /dev/sdb3; mount /dev/sdb3 /mnt" and then ran
my pet test-of-the-week again:

root@gggj6k:~# time rsync -aWx --stats / /mnt

Number of files: 394228
Number of files transferred: 349626
Total file size: 12845690938 bytes
Total transferred file size: 12845555332 bytes
Literal data: 12845560371 bytes
Matched data: 0 bytes
File list size: 7360607
Total bytes sent: 12869623206
Total bytes received: 6992540

sent 12869623206 bytes  received 6992540 bytes  9908900.15 bytes/sec
total size is 12845690938  speedup is 1.00

real    21m39.937s
user    5m47.908s
sys     5m50.986s
root@gggj6k:~# 


"iostat 10" on another login reported pretty impressive numbers at
times like for this 30 second period (rsync says avg is 1/4th of this):

avg-cpu:  %user   %nice    %sys %iowait   %idle
          27.54    0.00   24.04   28.49   19.94

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             208.60     43289.60       100.80     432896       1008
sdb              46.40        22.40     40007.20        224     400072

avg-cpu:  %user   %nice    %sys %iowait   %idle
          28.96    0.00   24.06   40.77    6.20

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             212.30     45693.60        68.80     456936        688
sdb              48.40         4.00     35515.20         40     355152

avg-cpu:  %user   %nice    %sys %iowait   %idle
          30.70    0.00   23.45   37.30    8.55

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             180.20     48866.40        51.20     488664        512
sdb              55.40        23.20     37864.80        232     378648



hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
