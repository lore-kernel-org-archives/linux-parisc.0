From: Jean-Pierre HOFER <jph@stephenson.dhis.org>
Subject: [parisc-linux] Missing audio driver with 2.6.17-2 on B180L.
Date: Tue, 5 Dec 2006 03:11:12 +0100 (CET)
Message-ID: <200612050211.kB52BEgE022612__34930.8871118867$1416624226$gmane$org@stephenson.dhis.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
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

Hello,


After installing Debian-parisc 2.6.17-2 on a B180L, there is no sound driver.
/dev/dsp is missing.
But the on board audio hardware was detected at boot time :

8. Merlin+ 180 Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x03f, 0x0007b }


What can be wrong and what is the best workaround to get audio working ?


Thanks in advance for all hints.

Jean-Pierre
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
