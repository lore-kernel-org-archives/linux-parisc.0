From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PARISC] input: queued patches from parisc-linux
Date: Sat, 17 Feb 2007 15:55:21 -0500
Message-ID: <11717457251848-git-send-email-kyle__40310.5937330567$1416624295$gmane$org@parisc-linux.org>
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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


Hi Dmitry,

The following are some patches committed to the input subsystem
>from parisc-linux.

Apologies if this turns out badly, this is my first time using
git-send-email...

 keyboard/hil_kbd.c |    8 +--
 keyboard/hilkbd.c  |  113 +++++++++++++++++++++++++++++++----------------------
 serio/hil_mlc.c    |   19 ++++----
 serio/hp_sdc.c     |   16 +++----
 serio/hp_sdc_mlc.c |    3 -
 5 files changed, 90 insertions(+), 69 deletions(-)

Cyrill V. Gorcunov (1):
      [PARISC] add error-checking in hil_keyb_init

Helge Deller (3):
      [PARISC] fix uninitialized spinlock in HIL keyboard driver
      [PARISC] hp_sdc: fix request_irq()/free_irq() parameters
      [PARISC] input: various cleanups

Cheers,
	Kyle M.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
