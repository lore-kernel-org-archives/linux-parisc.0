From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ext3 perf patch#4
Date: Sun, 27 Mar 2005 20:48:38 -0700
Message-ID: <20050328034838.GI30963@colo.lackof.org>
References: <20050326103540.GA31557@colo.lackof.org>
	<20050327011849.GD9287@colo.lackof.org>
	<4246B9D2.7070906@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4246B9D2.7070906@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Mar 27, 2005 at 01:49:06PM +0000, Joel Soete wrote:
...
> # time rsync -a /Debian-apt/SRC/linux-2.6.12-rc1-pa4-050327 /Sources/CVS-tst
> 
> real    3m34.512s
> user    1m0.730s
> sys     1m6.440s

Joel,
thanks for the data!

But I don't know what it means.
Was the performance bad for that box before?

> I prefer simply tar and so:
> # cd /Debian-apt/SRC
> # time tar -cslpf /chroot/Develop/linux-2.6.12-rc1-pa4.tar2 
> linux-2.6.12-rc1-pa4-050327
> 
> real    0m38.487s
> user    0m3.690s
> sys     0m18.650s
> 
> a sample iostat too :-)
> avg-cpu:  %user   %nice    %sys %iowait   %idle
>           15.70    0.00   47.00   37.30    0.00
> 
> Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
> sda               2.50         0.00        19.60          0        196
> sdb             297.30      5906.40        89.20      59064        892
> sdc              15.10         0.00      7712.80          0      77128
...

That looks fine.

> still have to test on a quicker system as the b2k if that could solve the 
> bug I reproduce on 32bit kernel
> (cf patch log message:"... I suspect the real problem is ffz() wants
> 	an unsigned long and was getting garbage in the top half of the
> 	unsigned int. Not confirmed but that's what I suspect.)

I probably should have posted that speculation to the mailing list
instead of in the commit log...I was quite tired at that point.

That could only be true if ext3 perf issue only shows up in 64-bit kernels.
I don't recall if anyone posted perf results for 32-bit kernels.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
