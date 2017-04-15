From: Helge Deller <deller@gmx.de>
Subject: [GIT PULL] parisc architecture fix for v4.11-rc7
Date: Sat, 15 Apr 2017 17:48:46 +0200
Message-ID: <20170415154846.GA8384@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mikulas Patocka <mpatocka@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Linus,

please pull one important fix for the parisc architecture for kernel 4.11-rc7 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.11-4

Mikulas Patocka fixed a few bugs in our new pa_memcpy() assembler function,
e.g. one bug made the kernel unbootable if source and destination address are
the same.

Thanks,
Helge

----------------------------------------------------------------
Mikulas Patocka (1):
      parisc: fix bugs in pa_memcpy

 arch/parisc/lib/lusercopy.S | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)
