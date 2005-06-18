From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.12-pa0 boot fine on my c110 :-)
Date: Sat, 18 Jun 2005 13:42:12 +0000
Message-ID: <42B424B4.6010201@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
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

Hello *,

As mentioned in title it build and boot fine on my c110 ;-)

No time to test more :-(

But I made a mistake (certainly not 2.6.12 related):
# more /proc/bus/runway/ccio-bitmap

proc_file_read: Apparent buffer overflow!
/Debian-apt/SRC/linux-2.6.12-pa0-050618/mm/memory.c:105: bad pmd 30303020.
/Debian-apt/SRC/linux-2.6.12-pa0-050618/mm/memory.c:105: bad pmd 30303030.
/Debian-apt/SRC/linux-2.6.12-pa0-050618/mm/memory.c:105: bad pmd 30303030.
/Debian-apt/SRC/linux-2.6.12-pa0-050618/mm/memory.c:105: bad pmd 30203030.
/Debian-apt/SRC/linux-2.6.12-pa0-050618/mm/memory.c:105: bad pmd 30302030.
kernel BUG at /Debian-apt/SRC/linux-2.6.12-pa0-050618/mm/mmap.c:1937!
Backtrace:
  [<1015be50>] exit_mmap+0x190/0x1cc
  [<101249c4>] mmput+0x44/0xbc
  [<10129280>] do_exit+0xc0/0x304
  [<10129534>] do_group_exit+0x40/0xcc
  [<10134134>] get_signal_to_deliver+0x4c/0x37c
  [<101113d0>] do_signal+0x5c/0x24c
  [<1010c2b4>] intr_do_signal+0x28/0x30
Kernel panic - not syncing: Kernel Fault

What did I wrong?

Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
