From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git patches] bugfixes for parisc for 2.6.35
Date: Sun, 30 May 2010 09:59:19 +0000
Message-ID: <20100530095919.GA30169@hera.kernel.org>
Reply-To: kyle@mcmartin.ca
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: akpm@linux-foundation.org, linux-parisc@vger.kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus, just bug fixes this release, doesn't touch anything outside of
arch/parisc.
 --Kyle

The following changes since commit e40152ee1e1c7a63f4777791863215e3faa37a86:

  Linus 2.6.34 (2010-05-16 14:17:36 -0700)

are available in the git repository at:
  hera.kernel.org:/pub/scm/linux/kernel/git/kyle/parisc-2.6.git fixes

Carlos O'Donell (1):
      parisc: Use of align_frame provides stack frame.

Helge Deller (1):
      parisc: clear floating point exception flag on SIGFPE signal

John David Anglin (5):
      parisc: Avoid interruption in critical region in entry.S
      parisc: Delete unnecessary nop's in entry.S
      parisc: LWS fixes for syscall.S
      parisc: Remove unnecessary macros from entry.S
      parisc: Call pagefault_disable/pagefault_enable in kmap_atomic/kunmap_atomic

Nick Piggin (1):
      parisc: invoke oom-killer from page fault

 arch/parisc/include/asm/cacheflush.h |   16 ++++++++--
 arch/parisc/kernel/asm-offsets.c     |   15 +++++++--
 arch/parisc/kernel/entry.S           |   52 ++++++---------------------------
 arch/parisc/kernel/syscall.S         |   32 ++++++---------------
 arch/parisc/math-emu/decode_exc.c    |    1 +
 arch/parisc/mm/fault.c               |    7 ++--
 6 files changed, 47 insertions(+), 76 deletions(-)
