From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] installation-reports - hppa c3600 graphical/usb
Date: Thu, 6 May 2004 11:23:44 -0600
Message-ID: <20040506172344.GA12232__43051.1502353058$1416623440$gmane$org@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: submit@bugs.debian.org
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

Package: installation-reports

Debian-installer-version: Beta4 5/6/2004
uname -a: Linux debian 2.4.25-32 #1 Mon Apr 19 18:11:19 UTC 2004 parisc unknown
Date: 5/6/2004
Method: booted CD from sarge-hppa-netinst.iso
	http://cdimage.debian.org/pub/cdimage-testing/sarge_d-i/hppa/beta4/sarge-hppa-netinst.iso

Machine: HP C3600 workstation with PCI VIs-EG/USB console
Processor: PA8600
Memory: 4GB
Root Device: fwscsi.5.0
Root Size/partition table: n/a
Output of lspci: n/a

Base System Installation Checklist:

Initial boot worked:    [O]
Configure network HW:   [O]
Config network:         [O]
Detect CD:              [O]
Load installer modules: [?]
Detect hard drives:     [O]
Partition hard drives:  [ ]
Create file systems:    [ ]
Mount partitions:       [ ]
Install base system:    [ ]
Install boot loader:    [ ]
Reboot:                 [ ]
[O] = OK, [E] = Error (please elaborate below), [ ] = didn't try it
[?] = No clue if that was done or worked

Comments/Problems:

Using the HP USB keyboard (Model SK-2502U, P/N A4983-60401) on an HP C3600,
the regular 4 arrow keys (seperate from the numeric keypad) do NOT work.
They "select" instead of moving the highlight up/down.

Use the numeric keypad instead - it has "arrow keys" on it as well.

It's more "natural" to use the regular arrow keys and it should be
trivial for the right person to fix.  I gather the numeric pad sends
out a different scan code than the four "arrow" keys.

I only needed to boot the system to recover a palo (v1.4 built with gcc
3.3.3) which fails to boot.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
