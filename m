From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: [parisc-linux] Debian etch rc1 & daily build install fail on C160
Date: Tue, 21 Nov 2006 02:36:24 -0700
Message-ID: <4562C898.2090605@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@parisc-linux.org
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

I've tried installing Debian Etch rc1 and yesterday's daily build on my
C160, and both fail.  The installation itself seems to work fine, but
when it boots after, it can't find the root partition.

I don't know if it's because the kernel doesn't have the SCSI driver I
need, or if I'm running into the issue listed on the errata:

Disk devices may change on reboot
  On systems with multiple diskcontrollers, the kernel/udev may assign
  a different device node on reboot of the system than was used during
  installation due to difference in load order of drivers.
  This can lead to failure to boot the system. In most cases this can be
  rectified changing the bootloader configuration and /etc/fstab,
  possibly using the rescue mode of the installer.

  Note however that this problem may occur again on subsequent boots.
  Fixing this issue has priority for the next release of Debian
  installer.

Is this something I should be reporting here, or to Debian?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
