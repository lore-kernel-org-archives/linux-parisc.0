From: Kyle McMartin <kyle@debian.org>
Subject: [parisc-linux] [git patches] parisc bugfixes for 2.6.22-rc5
Date: Thu, 21 Jun 2007 17:39:30 -0400
Message-ID: <20070621213930.GA11721__21635.4077951566$1416624400$gmane$org@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@linux-foundation.org,
 parisc-linux@lists.parisc-linux.org
To: torvalds@linux-foundation.org
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

Hi Linus,

Just a few last minute critical bugfixes for parisc for 2.6.22.

Cheers,
	Kyle M.

The following changes since commit 188e1f81ba31af1b65a2f3611df4c670b092bbac:
  Linus Torvalds (1):
        Linux 2.6.22-rc5

are available in the git repository at:

  /pub/scm/linux/kernel/git/kyle/parisc-2.6.git master

Helge Deller (1):
      [PARISC] Handle wrapping in expand_upwards()

Julian Stecklina (1):
      [PARISC] stop lcd driver from stripping initial whitespace

Randolph Chung (2):
      [PARISC] Fix unwinder on 64-bit kernels
      [PARISC] unwinder improvements

 arch/parisc/kernel/unwind.c |   43 ++++++++++++++++++++++++++++++++++++-------
 drivers/parisc/led.c        |    6 ------
 include/asm-parisc/system.h |    1 -
 mm/mmap.c                   |    9 +++++++--
 4 files changed, 43 insertions(+), 16 deletions(-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
