From: =?ISO-8859-1?Q?Corn=E9_Beerse?= <cbeerse@lycos.nl>
Subject: Re: [parisc-linux] ext2 vs ext3 on hppa
Date: Fri, 11 Feb 2005 14:08:12 +0100
Message-ID: <420CAE3C.7090004@lycos.nl>
References: <20050211071629.GA32318@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20050211071629.GA32318@colo.lackof.org>
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

> Hi all,
> ext3 perf isn't so good on parisc.

Well, From what I know on the linux filesystem types, I can imagine that ext3 is 
not the fastest among them.

ext2 is a (the?) linux normal filesystem: data storage is straigt-forward and such.
ext3 is basically ext2 with added journalling. For reading, it should be just as 
fast as ext2. For writing it is definitly slower than ext2 since it does ext2 
and journalling. As far as I know, the journalling is added to get additional 
data-safety; the filesystem-check is definitly faster/better than for ext2. I 
expect this is at the cost of writing performance.

I don't know xfs, I expect it to be comparable with reiserfs in that it is a 
journalling filesystem, designed from scratch. For these filesystems, I expect 
better performance than ext3 and, depending on several parameters, even better 
performance than ext2.

Between ext2 and xfs/reiser I expect ext2 to be better for large files and the 
others better for lots of small files.

> I've posted profile data for kernel builds:
> 
> http://lists.parisc-linux.org/pipermail/parisc-linux/2004-November/025196.html
> 
> But not for "tar". I can't find the data I collect before. :^(
> ISTR the culprit in ext3 was the bitmap search using atomic ops.
> On parisc, atomic ops are terrible since it requires a spinlock/op/unlock
> sequence.
> 
> I was asked about tar perf again and decided to post some results.
> If someone tells me which wiki page to add this, I'll pound parts
> of the data below into it.
> 
> In a nut shell, I timed unpacking the linux source tree:
> 
> FS 	real		user		sys
> ext2	2m10.814s	0m53.424s	0m6.084s
> ext3	3m46.577s	0m54.619s	1m34.553s
> xfs	1m22.205s	0m53.952s	0m9.739s
> md0+xfs	1m27.740s	0m54.550s	0m12.885s

This clearly shows, that the filesystems do have some differences in performance 
and all are in system-time, the user-time is comparable.

It would be nice if you can give similar stats for different architectures, 
either within pa-risc or even on other platforms.

> 
> User time is predominantly bzip2 running.

There are several things in comparing filesystems. Some (ext2 I expect) 
filesystems are good in hanldling large files. Some (I expect the journaling 
ones) are good in handling many small files.

With bzip2 running, I expect you use packing or unpacking the kernel-source for 
a test. To get raw figures, better use `tar`, `cp -R` or `dd`. And be sure to 
work from one disk to an other.

> 
> I didn't realize xfs can schedule work better than ext2 on a single disk.
> Adding md striping adds ~6% overhead...that's not so good.
> It's possible I need bigger chunks and that would go away.

I don't know what you mean by mdstripping, If it is something like raid-0 or 
raid-1 (or the combination) then striping is only faster on reading, not on writing.

> 
> I don't know if defaults are comparable between xfs and ext3.
> Is one implementing more or better features by default than the other?

As above: ext3 is ext2 with added journalling. xfs is designed from the ground 
up. I'm surprised to see that ext3 takes 15 times more system-time!

> 
> I'll be looking at mdadm+xfs for future file systems to see
> if I can break it. Or I'll have to live without journaling on
> "stable" build machines. The ext3 "tar" performance is just
> unacceptable.

You'd definitly also peek at reiserfs, Its the default fs used in SuSE linux.

If you intend to re-do your tests, think about the next: To test read speed, `cp 
-r` to /dev/null. To test write speed of small files, tar from the fastest 
read-system. (for large files, just copy from /dev/zero).

> 
> BTW, I get segfaults on the ext3 G

Thats a bad sign...



my 2 cents

CBee
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
