From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [git patches] parisc build fixes for 2.6.21
Date: Mon, 26 Feb 2007 22:32:01 -0500
Message-ID: <20070227033201.GA13669__43007.6698809446$1416624313$gmane$org@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org
To: torvalds@osdl.org
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

Build fixes for 2.6.21, should be nothing objectionable here.

The following changes since commit c68644d3304d217d50b8f0a179d4aa7e5a85a5bc:
  Ralf Baechle (1):
        [MIPS] Make SMTC_IDLE_HOOK_DEBUG a proper option in Kconfig.debug.

are found in the git repository at:

  /pub/scm/linux/kernel/git/kyle/parisc-2.6.git

Kyle McMartin (6):
      [PARISC] Remove __read_mostly annotation from command_line
      [PARISC] clocksource_cr16: Use clocksource_change_rating()
      [PARISC] time: Convert clocksource is_continuous to flag
      [PARISC] time: clocksource lost update_callback
      [PARISC] parisc-agp: Fix thinko const-ifying
      [PARISC] clocksource: Move update_cr16_clocksource later in boot

 arch/parisc/kernel/processor.c |    8 ++++++++
 arch/parisc/kernel/setup.c     |    2 +-
 arch/parisc/kernel/time.c      |   18 ++++++++++--------
 drivers/char/agp/parisc-agp.c  |    2 +-
 4 files changed, 20 insertions(+), 10 deletions(-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
