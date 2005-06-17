From: Max Grabert <parisc@gmail.com>
Subject: [parisc-linux] List of things that are known no to work on Linux/PA
Date: Fri, 17 Jun 2005 17:18:49 +0100
Message-ID: <e6eae02905061709187feef001__38820.4669151039$1416624548$gmane$org@mail.gmail.com>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org
To: Linux/PA <parisc-linux@parisc-linux.org>
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

Perhaps this should be put into a Wiki or a FAQ:
(however it could be a pain to maintain it I guess).

Anyway, for whom it might be of interest here it is:


Things that are known to be broken or not yet supported
in the latest (2.6.12-rc6-pa1) linux/PA kernel:

- NTPL is not yet supported (being worked on)
- kernel low-latency/preempt is not yet supported
- 64bit userland is not yet supported
- SMP, expecially on 64bit kernels seems to be rather unstable
- on some machines heavy I/O can cause problems
- XFS used to/is still broken
- ide-cd causes HPMC on cd-rom access; use ide-scsi instead
- Using native XFree86 drivers may cause HPMC, try to use fbdev instead
- Using fbdev with XFree86 causes HPMC on 64bit kernels
- To use onboard sound on B/C/Jxxxx use the snd_ad1889 ALSA driver,
   with OSS Emulation (native ALSA interface seems to have problems)


Please correct me if something has changed recently; I guess some of the PA
kernel hackers (and also users) might want to add a few things to this list=
 ;)

   Max


PS: sorry for cross-posting
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
