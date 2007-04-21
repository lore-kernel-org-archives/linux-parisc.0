From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] hanging linuxthread processes
Date: Sat, 21 Apr 2007 15:12:32 +0200
Message-ID: <200704211512.32234.deller__41280.2416984507$1416624336$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
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

Do we still see pthread/linuxthread-"hangs" on HPPA ?

On Alpha they had similiar problems with "hanging" threads:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=325600

Their trivial solution seems to be:
http://permalink.gmane.org/gmane.linux.debian.ports.alpha/7114

Could this be a solution on HPPA (with #ifdef __hppa__ added) as well ?
Mabye someone who compiles glibc on regular basis want to try ?

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
