From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Cannot access '/dev/pts/143862': Value too large for
	defined data type
Date: Tue, 13 Jul 2004 20:35:08 +0200
Message-ID: <200407132035.08844.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
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

I'm using the "screen" command regulary on HPPA with a 2.6 kernel, but sometimes I get the error message:

d036493@hw1306:~ > screen
Cannot access '/dev/pts/143862': Value too large for defined data type

What's the problem ?
Can screen not cope with the "high" (>16bit) pid/uid values ?
If yes, does screen needs to rebuild and could someone ask to rebuild it ?

Thanks,
Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
