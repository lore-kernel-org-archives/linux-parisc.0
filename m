From: David Howells <dhowells@redhat.com>
Subject: [GIT PULL] Disintegrate UAPI for parisc [ver #3]
Date: Tue, 16 Oct 2012 21:40:04 +0100
Message-ID: <5423.1350420004@warthog.procyon.org.uk>
Cc: dhowells@redhat.com, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: jejb@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi James,

I've regenerated the parisc bits on top of your misc branch merged onto
Linus's master branch.  Below is the revised pull request.

David
---
Can you merge the following branch into the parisc tree please?

This is to complete part of the UAPI disintegration for which the preparatory
patches were pulled recently.

Now that the fixups and the asm-generic chunk have been merged, I've
regenerated the patches to get rid of those dependencies and to take account of
any changes made so far in the merge window.  If you have already pulled the
older version of the branch aimed at you, then please feel free to ignore this
request.

The following changes since commit dd8e8c4a2c902d8350b702e7bc7c2799e5e7e331:

  thermal, cpufreq: Fix build when CPU_FREQ_TABLE isn't configured (2012-10-15 14:00:07 -0700)

are available in the git repository at:

  git://git.infradead.org/users/dhowells/linux-headers.git tags/disintegrate-parisc-20121016

for you to fetch changes up to 70c1674f62026e455c0c821fb7f4baf24d2d1139:

  UAPI: (Scripted) Disintegrate arch/parisc/include/asm (2012-10-16 21:28:05 +0100)

----------------------------------------------------------------
UAPI Disintegration 2012-10-16

----------------------------------------------------------------
David Howells (2):
      Merge branch 'misc' of git://git.kernel.org/.../jejb/parisc-2.6.git/
      UAPI: (Scripted) Disintegrate arch/parisc/include/asm

James Bottomley (1):
      [PARISC] asm: redo generic includes

 arch/parisc/include/asm/Kbuild                   |   9 +-
 arch/parisc/include/asm/auxvec.h                 |   4 -
 arch/parisc/include/asm/compat_signal.h          |   2 -
 arch/parisc/include/asm/cputime.h                |   6 -
 arch/parisc/include/asm/device.h                 |   7 -
 arch/parisc/include/asm/div64.h                  |   1 -
 arch/parisc/include/asm/emergency-restart.h      |   6 -
 arch/parisc/include/asm/hw_irq.h                 |   8 -
 arch/parisc/include/asm/irq_regs.h               |   1 -
 arch/parisc/include/asm/kdebug.h                 |   1 -
 arch/parisc/include/asm/kvm_para.h               |   1 -
 arch/parisc/include/asm/local.h                  |   1 -
 arch/parisc/include/asm/local64.h                |   1 -
 arch/parisc/include/asm/mutex.h                  |   9 -
 arch/parisc/include/asm/param.h                  |   1 -
 arch/parisc/include/asm/pdc.h                    | 423 +-----------
 arch/parisc/include/asm/percpu.h                 |   7 -
 arch/parisc/include/asm/poll.h                   |   1 -
 arch/parisc/include/asm/ptrace.h                 |  46 +-
 arch/parisc/include/asm/real.h                   |   5 -
 arch/parisc/include/asm/segment.h                |   6 -
 arch/parisc/include/asm/signal.h                 | 113 +--
 arch/parisc/include/asm/termios.h                |  41 +-
 arch/parisc/include/asm/topology.h               |   6 -
 arch/parisc/include/asm/unistd.h                 | 835 +---------------------
 arch/parisc/include/asm/user.h                   |   5 -
 arch/parisc/include/asm/vga.h                    |   6 -
 arch/parisc/include/asm/xor.h                    |   1 -
 arch/parisc/include/uapi/asm/Kbuild              |  28 +
 arch/parisc/include/{ => uapi}/asm/bitsperlong.h |   0
 arch/parisc/include/{ => uapi}/asm/byteorder.h   |   0
 arch/parisc/include/{ => uapi}/asm/errno.h       |   0
 arch/parisc/include/{ => uapi}/asm/fcntl.h       |   0
 arch/parisc/include/{ => uapi}/asm/ioctl.h       |   0
 arch/parisc/include/{ => uapi}/asm/ioctls.h      |   0
 arch/parisc/include/{ => uapi}/asm/ipcbuf.h      |   0
 arch/parisc/include/{ => uapi}/asm/mman.h        |   0
 arch/parisc/include/{ => uapi}/asm/msgbuf.h      |   0
 arch/parisc/include/uapi/asm/pdc.h               | 427 ++++++++++++
 arch/parisc/include/{ => uapi}/asm/posix_types.h |   0
 arch/parisc/include/uapi/asm/ptrace.h            |  47 ++
 arch/parisc/include/{ => uapi}/asm/resource.h    |   0
 arch/parisc/include/{ => uapi}/asm/sembuf.h      |   0
 arch/parisc/include/{ => uapi}/asm/setup.h       |   0
 arch/parisc/include/{ => uapi}/asm/shmbuf.h      |   0
 arch/parisc/include/{ => uapi}/asm/sigcontext.h  |   0
 arch/parisc/include/{ => uapi}/asm/siginfo.h     |   0
 arch/parisc/include/uapi/asm/signal.h            | 118 ++++
 arch/parisc/include/{ => uapi}/asm/socket.h      |   0
 arch/parisc/include/{ => uapi}/asm/sockios.h     |   0
 arch/parisc/include/{ => uapi}/asm/stat.h        |   0
 arch/parisc/include/{ => uapi}/asm/statfs.h      |   0
 arch/parisc/include/{ => uapi}/asm/swab.h        |   0
 arch/parisc/include/{ => uapi}/asm/termbits.h    |   0
 arch/parisc/include/uapi/asm/termios.h           |  43 ++
 arch/parisc/include/{ => uapi}/asm/types.h       |   0
 arch/parisc/include/uapi/asm/unistd.h            | 837 +++++++++++++++++++++++
 57 files changed, 1511 insertions(+), 1542 deletions(-)
 delete mode 100644 arch/parisc/include/asm/auxvec.h
 delete mode 100644 arch/parisc/include/asm/compat_signal.h
 delete mode 100644 arch/parisc/include/asm/cputime.h
 delete mode 100644 arch/parisc/include/asm/device.h
 delete mode 100644 arch/parisc/include/asm/div64.h
 delete mode 100644 arch/parisc/include/asm/emergency-restart.h
 delete mode 100644 arch/parisc/include/asm/hw_irq.h
 delete mode 100644 arch/parisc/include/asm/irq_regs.h
 delete mode 100644 arch/parisc/include/asm/kdebug.h
 delete mode 100644 arch/parisc/include/asm/kvm_para.h
 delete mode 100644 arch/parisc/include/asm/local.h
 delete mode 100644 arch/parisc/include/asm/local64.h
 delete mode 100644 arch/parisc/include/asm/mutex.h
 delete mode 100644 arch/parisc/include/asm/param.h
 delete mode 100644 arch/parisc/include/asm/percpu.h
 delete mode 100644 arch/parisc/include/asm/poll.h
 delete mode 100644 arch/parisc/include/asm/real.h
 delete mode 100644 arch/parisc/include/asm/segment.h
 delete mode 100644 arch/parisc/include/asm/topology.h
 delete mode 100644 arch/parisc/include/asm/user.h
 delete mode 100644 arch/parisc/include/asm/vga.h
 delete mode 100644 arch/parisc/include/asm/xor.h
 rename arch/parisc/include/{ => uapi}/asm/bitsperlong.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/byteorder.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/errno.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/fcntl.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/ioctl.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/ioctls.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/ipcbuf.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/mman.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/msgbuf.h (100%)
 create mode 100644 arch/parisc/include/uapi/asm/pdc.h
 rename arch/parisc/include/{ => uapi}/asm/posix_types.h (100%)
 create mode 100644 arch/parisc/include/uapi/asm/ptrace.h
 rename arch/parisc/include/{ => uapi}/asm/resource.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/sembuf.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/setup.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/shmbuf.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/sigcontext.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/siginfo.h (100%)
 create mode 100644 arch/parisc/include/uapi/asm/signal.h
 rename arch/parisc/include/{ => uapi}/asm/socket.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/sockios.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/stat.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/statfs.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/swab.h (100%)
 rename arch/parisc/include/{ => uapi}/asm/termbits.h (100%)
 create mode 100644 arch/parisc/include/uapi/asm/termios.h
 rename arch/parisc/include/{ => uapi}/asm/types.h (100%)
 create mode 100644 arch/parisc/include/uapi/asm/unistd.h
