From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 2.6.10-rc1-pa11 profile data
Date: Thu, 11 Nov 2004 22:29:10 -0700
Message-ID: <20041112052910.GA29900@colo.lackof.org>
References: <20041111075431.GB9768@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041111075431.GB9768@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Nov 11, 2004 at 12:54:31AM -0700, Grant Grundler wrote:
> I've collect two profiles for -64SMP and will collect
> some UP profiles tomorrow.

"tomorrow" finally arrived. :^)

> 	http://www.parisc-linux.org/~grundler/prof-j6700/

I've added the 64-bit UP profile numbers as promised.
And some of the top consumers look familiar:
root@gggj6k:~# sort -rnk 3 prof-2.6.10-rc1-pa11-64-01.txt
 40150 flush_kernel_icache_page                 401.5000
  6798 fdsync                                   339.9000
 10645 flush_user_dcache_range_asm              295.6944
 10353 flush_user_icache_range_asm              287.5833
 13871 machine_restart                          216.7344
 20839 __clear_user_page_asm                    186.0625
 10478 cpu_idle                                 145.5278
  1380 fisync                                    86.2500
   365 $lclu_done                                45.6250
  3794 purge_kernel_dcache_page                  37.9400
  3535 flush_kernel_dcache_page                  35.3500
  3279 copy_user_page_asm                        21.5724
  1358 find_get_page                             18.8611
   185 $lslen_loop                               15.4167
  1228 find_vma_prev                             12.7917
   101 $lslen_done                               12.6250
   128 $lsfu_loop                                 8.0000
   162 file_ra_state_init                         6.7500
...


enjoy!
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
