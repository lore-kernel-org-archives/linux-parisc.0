From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: [parisc-linux] [BUG] XFS broken (again) on parisc
Date: Sun, 10 Jun 2007 14:51:53 +0200
Message-ID: <7d01f9f00706100551r57e240a2u510709668f146c03__13824.584746226$1416624395$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

What I initially believed to be related to the SCSI offlining problems
we had seems to be more complex than that: I can reliably kill any XFS
filesystem with current GIT TOB by just unmouting and remounting, no
matter if there's any activity on the fs.

The remount attempt will yield:

XFS mounting filesystem sdb1
XFS: Log inconsistent (didn't find previous header)
XFS: failed to find log head
XFS: log mount/recovery failed: error 5
XFS: log mount failed
mount: /dev/sdb1: can't read superblock

At this point, the fileystem is totally corrupted (I'm still running
xfs_repair, but have very little hope given the incredible amount of
errors detected on a fs that's been mounted for about 10s without any
activity on it before I tried to unmount/remount it)...

That happens on 64bit SMP. I'll investigate more later on. According
to Guy Martin, this doesn't  happen on UP kernels.

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
