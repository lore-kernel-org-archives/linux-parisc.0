From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ext3 perf patch#4
Date: Sun, 27 Mar 2005 13:49:06 +0000
Message-ID: <4246B9D2.7070906@tiscali.be>
References: <20050326103540.GA31557@colo.lackof.org>
	<20050327011849.GD9287@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050327011849.GD9287@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Grant Grundler wrote:
> On Sat, Mar 26, 2005 at 03:35:40AM -0700, Grant Grundler wrote:
> 
>>James Bottomley in a private conversation suggested our
>>ext2_test_bit() and ext2_find_next_zero_bit() might not
>>be counting bits the same way in the bitmap.
> 
> 
> James, kudos and thank you.
> 
> With appended patch, I'm getting reasonable ext3 performance.
> Can someone please test this patch in a 32-bit kernel?
> 
Obviously ;-)

> I'm comfortable this patch works for 64-bit since I've been building
> kernels and running rsync across 3 disks with no problems.
> I *think* the code is 32-bit clean as well, but haven't tested it.
> 
on my c110 no pb to boot :-)
some rsync test (on non mirored slices on 2 different disk but on the same scsi ctrlr ncr53c720):
# time rsync -a /Debian-apt/SRC/linux-2.6.12-rc1-pa4-050327 /Sources/CVS-tst

real    3m34.512s
user    1m0.730s
sys     1m6.440s

# du -sk /Debian-apt/SRC/linux-2.6.12-rc1-pa4-050327
256616  /Debian-apt/SRC/linux-2.6.12-rc1-pa4-050327

...

> Simple test results follow and then the patch.
> 
# bdf
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/md2               1692128   1194620    411552  75% /
tmpfs                   256300         0    256300   0% /dev/shm
/dev/md0                123699    112645      4667  97% /boot
/dev/md3                247407     82537    152096  36% /var
/dev/md4                123635      4129    113122   4% /tmp
/dev/md5                123635     15749    101502  14% /home
/dev/sdb9              1513656    968940    529340  65% /Debian-apt
/dev/sda9              1513656   1011696    425068  71% /Sources
/dev/sdc5              1692220    913028    693232  57% /chroot
/dev/sdc3               123767      8728    108649   8% /chroot/boot
/dev/sdc6               247511    107636    127096  46% /chroot/var
/dev/sdc7               123735      4130    113216   4% /chroot/tmp
/dev/sdc8               123735      4144    113202   4% /chroot/home
/dev/sdc9              1513656    473444   1024836  32% /chroot/Develop

...

> grundler@riot:/$ lsscsi
Not yet lsscsi

> 
> riot:/mnt# time tar xjf linux-2.6.12-rc1-pa3.tar.bz2 
> 
I prefer simply tar and so:
# cd /Debian-apt/SRC
# time tar -cslpf /chroot/Develop/linux-2.6.12-rc1-pa4.tar2 linux-2.6.12-rc1-pa4-050327

real    0m38.487s
user    0m3.690s
sys     0m18.650s

a sample iostat too :-)
avg-cpu:  %user   %nice    %sys %iowait   %idle
           15.70    0.00   47.00   37.30    0.00

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda               2.50         0.00        19.60          0        196
sdb             297.30      5906.40        89.20      59064        892
sdc              15.10         0.00      7712.80          0      77128
md0               0.00         0.00         0.00          0          0
md5               0.00         0.00         0.00          0          0
md4               0.00         0.00         0.00          0          0
md3               0.20         0.00         0.40          0          4
md2               2.00         0.00        16.00          0        160
md1               0.00         0.00         0.00          0          0


# cd /chroot/Develop

# time tar -xslpf linux-2.6.12-rc1-pa4.tar2

real    1m32.901s
user    0m4.880s
sys     0m30.000s

another iostat sample:
avg-cpu:  %user   %nice    %sys %iowait   %idle
           13.19    0.00   39.66   47.15    0.00

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda               0.00         0.00         0.00          0          0
sdb               0.00         0.00         0.00          0          0
sdc             173.33      4542.66      6186.61      45472      61928
md0               0.00         0.00         0.00          0          0
md5               0.00         0.00         0.00          0          0
md4               0.00         0.00         0.00          0          0
md3               0.00         0.00         0.00          0          0
md2               0.00         0.00         0.00          0          0
md1               0.00         0.00         0.00          0          0


still have to test on a quicker system as the b2k if that could solve the bug I reproduce on 32bit kernel
(cf patch log message:"... I suspect the real problem is ffz() wants
	an unsigned long and was getting garbage in the top half of the
	unsigned int. Not confirmed but that's what I suspect.)

Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
