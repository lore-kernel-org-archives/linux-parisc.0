From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] SLAB bug SMP 64bit / XFS mess
Date: Sun, 10 Apr 2005 23:49:56 -0600
Message-ID: <20050411054956.GC30629@colo.lackof.org>
References: <20050404110025.GA6987@tausq.org>
	<4208AA1B000184AE@mail-3-bnl.tiscali.it>
	<20050408205428.GJ1833@baldric.uwo.ca>
	<20050409021049.0d0a851d@Tatooine.r3z0>
	<20050411045747.GA30629@colo.lackof.org>
	<20050411051517.GB30629@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050411051517.GB30629@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Apr 10, 2005 at 11:15:17PM -0600, Grant Grundler wrote:
> Just for comparison, I ran the same workload on ext3 and it worked fine.

Sorry, I meant ext2.


Here is the correct rsync output for ext3 on /dev/sdb3:

root@gggj6k:~# time rsync -aWx --stats / /mnt

Number of files: 394228
Number of files transferred: 349626
Total file size: 12845701275 bytes
Total transferred file size: 12845565669 bytes
Literal data: 12845570528 bytes
Matched data: 0 bytes
File list size: 7360229
Total bytes sent: 12869632989
Total bytes received: 6992540

sent 12869632989 bytes  received 6992540 bytes  8178231.52 bytes/sec
total size is 12845701275  speedup is 1.00

real    26m14.078s
user    5m47.767s
sys     7m11.995s
root@gggj6k:~# 


grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
