From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fixes for v4.13-rc6
Date: Thu, 17 Aug 2017 20:28:13 +0200
Message-ID: <20170817182813.GA1426@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull two small patches from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.13-5

Changelog:

- Fix PCI memory bar assignments with 64-bit kernels on machines with Dino/Cujo
  PCI chipsets. This makes PCI graphic cards work on such machines (from Thomas
  Bogendoerfer).

- Fix documentation to be more clear about the difference between %pF and %pS
  printk format usage. There are still many places in the kernel which have it
  wrong (from Petr Mladek, Sergey Senozhatsky & me).

Thanks,
Helge

----------------------------------------------------------------
Helge Deller (1):
      printk-formats.txt: Better describe the difference between %pS and %pF

Thomas Bogendoerfer (1):
      parisc: pci memory bar assignment fails with 64bit kernels on dino/cujo

 Documentation/printk-formats.txt | 19 +++++++++++--------
 drivers/parisc/dino.c            |  2 +-
 2 files changed, 12 insertions(+), 9 deletions(-)
