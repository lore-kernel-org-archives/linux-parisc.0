From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] BUG XFS 2.6.11-rc4-pa1
Date: Tue, 15 Feb 2005 18:12:25 +0100
Message-ID: <4209EEB90000286C@mail-2-bnl.tiscali.it>
References: <20050214044445.GD22633@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Grant Grundler" <grundler@parisc-linux.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050214044445.GD22633@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Grant,

into <http://www.kernel.org/pub/linux/kernel/v2.6/testing/cset/> of today=

I read some bug fix in xfs but not yet in rc4-bk2 patch (most probably in=

bk3)

hth,
    Joel

> -- Original Message --
> Date: Sun, 13 Feb 2005 21:44:45 -0700
> From: Grant Grundler <grundler@parisc-linux.org>
> To: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] BUG XFS 2.6.11-rc4-pa1
> 
> 
> On Sun, Feb 13, 2005 at 09:13:23PM -0700, Grant Grundler wrote:
> > Linux riot 2.6.11-rc4-pa0 #2 SMP Sun Feb 13 19:25:48 PST 2005 parisc6=
4
> GNU/Linux
> ...
> >  IAOQ[0]: xfs_ialloc_read_agi+0x164/0x188 [xfs]
> >  IAOQ[1]: xfs_ialloc_read_agi+0x168/0x188 [xfs]
> 
> I rebooted and tried to resurrect the filesystem but fsck.xfs seems
> to be a NOP and mount refused to mount it:
> 
> riot:/usr/src# mount -t xfs /dev/md0 /mnt
> XFS mounting filesystem md0
> XFS: Log inconsistent (didn't find previous header)
> XFS: failed to find log head
> XFS: log mount/recovery failed: error 5
> XFS: log mount failed
> mount: /dev/md0: can't read superblock
> riot:/usr/src#
> 
> I ran "mkfs -t xfs /dev/md0", mounted md0, and copied the kernel
> source tree back on to /mnt. cvs up -A worked fine. Suggests either
> a rare bug or binary compatibility issue between -rc3 and -rc4.
> 
> I'll let the kernel builds and spew beat on xfs some more tonight.
> 
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
