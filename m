From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ext2 vs ext3 on hppa
Date: Fri, 11 Feb 2005 10:47:52 -0700
Message-ID: <20050211174752.GC8835@colo.lackof.org>
References: <20050211071629.GA32318@colo.lackof.org>
	<420CAE3C.7090004@lycos.nl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Corn? Beerse <cbeerse@lycos.nl>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <420CAE3C.7090004@lycos.nl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Feb 11, 2005 at 02:08:12PM +0100, Corn? Beerse wrote:
...
> >In a nut shell, I timed unpacking the linux source tree:
> >
> >FS 	real		user		sys
> >ext2	2m10.814s	0m53.424s	0m6.084s
> >ext3	3m46.577s	0m54.619s	1m34.553s
> >xfs	1m22.205s	0m53.952s	0m9.739s
> >md0+xfs	1m27.740s	0m54.550s	0m12.885s
...
> It would be nice if you can give similar stats for different architectures, 
> either within pa-risc or even on other platforms.

Sorry, who ever is interested in that comparison can provide that data. :^)

> I don't know what you mean by mdstripping, If it is something like raid-0 
> or raid-1 (or the combination) then striping is only faster on reading, not 
> on writing.

Yes, I meant raid0.

> You'd definitly also peek at reiserfs, Its the default fs used in SuSE 
> linux.

That sounds like an excercise for someone else.

> If you intend to re-do your tests, think about the next: To test read 
> speed, `cp -r` to /dev/null. To test write speed of small files, tar from 
> the fastest read-system. (for large files, just copy from /dev/zero).

ok. My guess was with 4GB of RAM, I was mostly operating from buffer cache.
Maybe next time I'll use ram disks instead.

> >BTW, I get segfaults on the ext3.
> 
> Thats a bad sign...

My bad. I was running two instances of "make" in the same source tree.
I had forgotten about the "while :" loop that was doing builds.
/me hides

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
