From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] 2.6.15-rc1 freeing a reserved page from uart_shutdown
Date: Fri, 11 Nov 2005 23:39:14 -0700
Message-ID: <20051112063914.GH1658__9232.93254240907$1416624566$gmane$org@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org,
 parisc-linux@parisc-linux.org
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


I'm having some trouble with 2.6.15-rc1:

VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 640k freed
Bad page state at free_hot_cold_page (in process 'init', page 108a24a0)
flags:0x00000400 mapping:00000000 mapcount:0 count:0
Backtrace:
Backtrace:
 [<101481cc>] bad_page+0x70/0xc4
 [<10148920>] free_hot_cold_page+0x74/0x124
 [<10275e68>] uart_shutdown+0xf0/0xf8
 [<102775f8>] uart_close+0xc8/0x214
 [<1025c710>] release_dev+0x72c/0x734
 [<1025cddc>] tty_release+0x10/0x20
 [<101680f0>] __fput+0x15c/0x170
 [<10166520>] filp_close+0x58/0x94
 [<1010d114>] syscall_exit+0x0/0x14

This is on a parisc system, though a very similar tree boots fine on a
different machine.  The machine which produces this message is a K460
which uses the Mux serial driver.  As far as I can tell, the only call
to free_hot_cold_page() in uart_shutdown() is to free info->xmit.buf
which seems to be always filled by a call to get_zeroed_page().

This problem doesn't show with 2.6.14.  I can give access to this
machine to anyone who wants to do some debugging.  It has remote power
capabilities ;-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
