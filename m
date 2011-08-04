From: Jeroen Roovers <jer@gentoo.org>
Subject: RFC: lsparisc without libsysfs
Date: Thu, 4 Aug 2011 17:32:25 +0200
Message-ID: <20110804173225.6082676c@epia.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

     Hello there,


lsparisc currently uses libsysfs to find PARISC specific devices in
the sysfs tree.

The Gentoo Linux Project wants to drop sysfsutils[1], including
libsysfs, since it was last updated in 2006 and is purportedly broken
(even though lsparisc still works fine).

Similar utilities, like lsscsi[2] and cpufrequtils[3], stopped using
libsysfs a long time ago and search the sysfs tree in other ways.


Regards,
     jer


[1] https://bugs.gentoo.org/show_bug.cgi?id=377695
[2] http://sg.danny.cz/scsi/lsscsi.html
[3] http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils.html
