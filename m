From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: [parisc-linux] Infinite error message from SDC driver on install
Date: Fri, 08 Jul 2005 18:16:38 -0600
Message-ID: <42CF1766.8030608@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
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

I have just recently attempted to install Debian 3.1 on an old B132L.  I
have managed to get the install CD to boot, but the kernel is issuing an
infinite stream of error messages from the SDC driver:

"HP SDC: Transaction add failed: transaction already queued?"

At first this was preventing the install CD from booting.  I determined
this was due to syslogd filling the ramdisk by logging the above
message.  I was able to get the install CD to boot into the installation
by making the initial ramdisk size very large (64 meg).  However, even
this fills up withing a few minutes.

I'm not very familliar with the SDC - is there a way to prevent the
above from occuring?

Thanks in advance,

	Kurt Fitzner
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
