From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] revisit copy_user_page_asm microbenchmarks
Date: Sun, 20 Feb 2005 16:44:15 -0700
Message-ID: <20050220234415.GC30361@colo.lackof.org>
References: <20050105055412.68E06495698@palinux.hppa>
	<20050107095143.GN18497@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050107095143.GN18497@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jan 07, 2005 at 01:51:43AM -0800, Randolph Chung wrote:
> Grant, do you have any results of a somewhat more macrobenchmark that
> shows what happens with this patch installed?

I don't. I wanted to run the ones that you suggested but just
didn't have time. Before this gets totally lost, here are the results
I did collect for 64-bit kernel using ldd/std in copy_user_page_asm.
Can someone collect a comparable set using the original copy_user_page_asm?

This is on J6700 (750Mhz PA8700) w/4GB RAM.

>  e.g. what does it do to "dd if=/dev/zero of=foo bs=1k count=500000"?

Linux gggj6k 2.6.10-pa6-64SMP #1 SMP Thu Jan 6 22:18:36 PST 2005 parisc64 GNU/Linux

root@gggj6k:/home# time dd if=/dev/zero of=foo bs=1k count=500000

"dd" time	"dd" B/s	"time" real	user		sys
17.018413	30085062	0m17.034s	0m0.136s	0m11.153s
15.877587	32246713	0m21.932s	0m0.145s	0m11.866s
11.948184	42851700	0m12.642s	0m0.149s	0m11.785s
14.944728	34259573	0m27.936s	0m0.129s	0m11.861s
12.329126	41527680	0m13.035s	0m0.156s	0m11.896s
11.369272	45033666	0m22.073s	0m0.134s	0m11.605s


> what does it do to a kernel compile?

2.6.10-rc3-pa8 kernel:
real    47m42.656s
user    20m15.723s
sys     66m52.259s


> what does it do to a bonnie run?

Linux gggj6k 2.6.10-pa6-64SMP #1 SMP Thu Jan 6 22:18:36 PST 2005 parisc64 GNU/Linux

root@gggj6k:/mnt# bonnie -u grundler -f -x 3 -m 64SMP -d /mnt
Using uid:1001, gid:1001.
name,file_size,putc,putc_cpu,put_block,put_block_cpu,rewrite,rewrite_cpu,getc,getc_cpu,get_block,get_block_cpu,seeks,seeks_cpu,num_files,seq_create,seq_create_cpu,seq_stat,seq_stat_cpu,seq_del,seq_del_cpu,ran_create,ran_create_cpu,ran_stat,ran_stat_cpu,ran_del,ran_del_cpu
Writing intelligently...done
Rewriting...done
Reading intelligently...done
start 'em...done...done...done...
Create files in sequential order...done.
Stat files in sequential order...done.
Delete files in sequential order...done.
Create files in random order...done.
Stat files in random order...done.
Delete files in random order...done.
64SMP,16G,,,57333,25,15918,12,,,25829,10,166.8,1,16,2368,98,+++++,+++,+++++,+++,2589,99,+++++,+++,7093,99
...
64SMP,16G,,,58014,26,15895,12,,,25461,10,181.7,1,16,2416,98,+++++,+++,+++++,+++,2598,99,+++++,+++,7361,99
...
64SMP,16G,,,57416,25,16201,13,,,25841,10,186.1,1,16,2452,96,+++++,+++,+++++,+++,2621,99,+++++,+++,7544,100



And one more test that I'm not sure is relevant:

	time sgp_dd if=/dev/sda of=/dev/sdc bpt=16k count=17781520

2.6.10-rc3-pa8 kernel:
real    15m13.011s
user    0m0.042s
sys     4m6.301s


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
