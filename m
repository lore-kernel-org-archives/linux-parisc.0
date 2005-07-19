From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: [parisc-linux] Machine hanging during high-traffic NFS
Date: Tue, 19 Jul 2005 15:02:55 -0600
Message-ID: <42DD6A7F.8090706@excelcia.org>
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

I've been using nfs to try and save backup images from my B132L
(2.6.12-pa2) with a simple:
  dd if=/dev/sda of=/mnt/bulk/sda-image bs=512

Every time the machine hangs solid - the heartbeat LED even stops.
Usually it hangs after around 1 to 2 gigs have been transferred.  There
are no log entries at the time of the hang.  IT just... stops.

I'm using a 3c905 PCI ethernet card rather than the stock 10 megabit
LASI on board.

I'm wondering if this might be an issue with the ethernet driver when
compiled for PARISC.  I've tried very large ftp transfers and can't
reproduce the problem that way.

I've also tried NFS over TCP and  tried reducing the rsize/wsize below
1500 bytes to prevent IP fragmentation.  Neither of which seem to help.

Are there any known NFS issues right now?  Any ideas?  Suggestions?

	Kurt.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
