From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: [parisc-linux] Results from NFS hang tests
Date: Sat, 23 Jul 2005 11:23:47 -0600
Message-ID: <42E27D23.4050601@excelcia.org>
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

I've finished the kernel testing and identified two different "hanging"
types of behavior in later 2.6.x kernels under high NFS traffic load.

The tests were universally carried out by mounting a remote NFS share on
my B132L running Debian 3.1 (stable) and inside the mount performing:
# dd if=/dev/sda of=sda-image bs=512 &

Beginning with 2.6.11-rc1-pa0, the machine will hang, however the
heartbeat does not stop and some functionality remains in the system.
The machine will respond to network ICMP pings.  No other network
services respong (ftp, ssh, etc), and the keyboard is non-responsive
(caps lock light does not work).  Additionally, the machine would not
respond to the power button.  There are no console messages when the
hang occurs, and nothing diagnostic in the logs.

The second behavior began with 2.6.12-rc1-pa1 (pa0 issued a kernel panic
during boot and could not be tested).  Kernels after this would freeze
completely including the heartbeat LED.  Most kernels tested also issued
a kernel panic to the console (the only exceptiong being 2.6.12-pa2
where the machine hang completely but there was no kernel panic).  The
machine would respond to the power button.  I assume that this is a
hardware behavior that kicks in when the heartbeat stops. Data from the
ToC or panic is as follows:

2.6.12-pa2     - hang, no heartbeat, no panic
 ToC: GR02 0x101e3910 nfs_mark_request_dirty + 0x24
      IOAQ 0x1010c1b0 intr_restore + 0x11c

2.6.12-rc3-pa3 - hang, no heartbeat, kernel panic
      GR02 alloc_skb+0x6c/0xf8
      IAOQ alloc_skb+0x9c/0xf8

**2.6.12-rc1-pa1 - hang, no heartbeat, kernel panic
      GR02 cache_grow+0xd4/0x1a8
      IAOQ alloc_slabmgmt+0x30/0x6c

The complete ToC or panic output is available for the above kernels if
needed.

The list of all kernels testes is as follows:

2.6.12-pa2     - hang, no heartbeat, no panic
2.6.12-rc3-pa3 - hang, no heartbeat, kernel panic
2.6.12-rc1-pa1 - hang, no heartbeat, kernel panic       **
2.6.12-rc1-pa0 - not tested - kernel panic during boot
2.6.11-pa4     - hang, heartbeat present, can ping
2.6.11-rc3-pa5 - hang, heartbeat present, can ping
2.6.11-rc1-pa0 - hang, heartbeat present, can ping      **
2.6.10-pa11    - Tests OK
2.6.8.1-pa11   - Tests OK

** First kernel where a hanging behavior was observed.

Tha additional diagnostic (ToC or panic output) for the applicable tests
is available from:
  http://www.excelcia.org/~kfitzner/hang_diagnostics.tar.gz

I have kept all the debian packages for the above kernels so if there is
additional testing that would be helpful, or if I have missed some data,
please let me know.

	Kurt.

--
HP 9000 B132L, 128MB RAM, Seagate ST34371W 4GB hdd on Zalon NCR53c720
(0,0,6), Panasonic CR-8005A cdrom on LASI 53c700 (1,0,3), 3COM 3c905 PCI
ethernet card, Debian Sarge 3.1 Stable
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
