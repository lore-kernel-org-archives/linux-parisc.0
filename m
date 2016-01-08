From: Anton Wuerfel <anton.wuerfel@fau.de>
Subject: [PATCH v4 00/13] tty: serial: 8250: Fix checkpatch warnings
Date: Fri,  8 Jan 2016 18:43:46 +0100
Message-ID: <1452275039-18787-1-git-send-email-anton.wuerfel@fau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Jiri Slaby <jslaby@suse.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	Peter Hurley <peter@hurleysoftware.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Qipeng Zha <qipeng.zha@intel.com>,
	Desmond Liu <desmondl@broadcom.com>,
	Wang Long <long.wanglong@huawei.com>,
	Matt Redfearn <matt.redfearn@imgtec.com>,
	Paul Burton <paul.burton@imgtec.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Peter Hung <hpeter@gmail.com>,
	Soeren Grunewald <soeren.grunewald@desy.de>,
	Adam Lee <adam.lee@canonical.com>,
	"Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
	Mans Rullgard <mans@mansr.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-kernel@i4.cs.fau.de,
	phillip.raffeck@fau.de, Anton Wuerfel <anton.wuerfel@fau.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Peter and Andy,

sorry for the long delay - we were very busy during christmas holidays.
We tried to incorporate your suggestions.

We apologize for syntax errors in v3-patchset. While fixing these issues
we added another patch to the series, so we decided to send in a new patchset
instead of fixing the damaged patch files in v3.

Regards,
Anton Wuerfel
Phillip Raffeck

This patch set fixes several checkpatch warnings in tty/serial/8250.

Patch 1/13:  Adds missing spaces (mainly to function/macro headers)
Patch 2/13:  Replace spaces with tabs wherever possible
Patch 3/13:  Slight patch which moves an opening curly brace
Patch 4/13:  Fixes multiline comment style
Patch 5/13:  Removes else blocks after return statements
Patch 6/13:  Slight patch which moves EXPORT_SYMBOL macro to correct position
Patch 7/13:  Slight patch which removes an unneccessary line continuation
Patch 8/13:  Slight patch which adds parentheses to a macro definition
Patch 9/13:  Merges user-visible multiline strings to a single line
Patch 10/13: Replace printk by dev_* or pr_* where appropriate
Patch 11/13: Remove orphaned debug macro
Patch 12/13: Fix warnings in dev_dbg by adding two casts
Patch 13/13: Fixes code indentation

Remaining checkpatch warnings after applying this patch series:

-line over 80 characters
	This error mostly occurs in serial_cs.c, which contains long-lined
	macro calls. However, splitting these calls into multiple lines would
	not increase readability.

-externs should be avoided in .c files
	This occurs in 8250_hp300.c. There is no corresponding header file
	the extern statement could be moved to. It could be moved to 8250.h
	but this would affect other .c files.

-Use #include <linux/*.h> instead of <asm/*.h>
	This warning has been left open for more experienced kernel hackers.
	This patch series is about style issues. We do not intend to alter
	the code behavior.
-struct uart_ops should normally be const
	This warning only occurs in 8250_core.c. The corresponding struct
	cannot be declared as const because it is altered in
	serial8250_isa_init_ports(). Maybe a checkpatch exception should
	be added for this particular warning.

-quoted string split across lines
	These strings were ignored because they otherwise would exceed
	80 characters in a single line. These particular strings use
	format specifiers, which break the ability to grep for them anyway.

Anton Wuerfel (13):
Phillip Raffeck (13):
  tty: serial: 8250: Fix whitespace errors
  tty: serial: 8250: Replace spaces with tabs
  tty: serial: 8250: Fix braces after struct
  tty: serial: 8250: Fix multiline comment style
  tty: serial: 8250: Remove else after return
  tty: serial: 8250: Move EXPORT_SYMBOL to function
  tty: serial: 8250: Fix line continuation warning
  tty: serial: 8250: Add parentheses to macro
  tty: serial: 8250: Fix multi-line strings
  tty: serial: 8250: Removed warning in debug output
  tty: serial: 8250: Fix indentation warnings
  tty: serial: 8250: Suitably replace printk
  tty: serial: 8250: Remove SERIAL_DEBUG_PNP macro

 drivers/tty/serial/8250/8250_accent.c        |  2 +-
 drivers/tty/serial/8250/8250_acorn.c         |  2 +-
 drivers/tty/serial/8250/8250_boca.c          |  2 +-
 drivers/tty/serial/8250/8250_core.c          | 15 ++---
 drivers/tty/serial/8250/8250_exar_st16c554.c |  2 +-
 drivers/tty/serial/8250/8250_fourport.c      |  2 +-
 drivers/tty/serial/8250/8250_gsc.c           |  7 ++-
 drivers/tty/serial/8250/8250_hp300.c         | 26 ++++----
 drivers/tty/serial/8250/8250_hub6.c          |  2 +-
 drivers/tty/serial/8250/8250_ingenic.c       | 12 ++--
 drivers/tty/serial/8250/8250_pci.c           | 49 +++++++--------
 drivers/tty/serial/8250/8250_pnp.c           | 20 ++++---
 drivers/tty/serial/8250/8250_port.c          | 46 +++++++-------
 drivers/tty/serial/8250/serial_cs.c          | 89 +++++++++++++++-------------
 14 files changed, 145 insertions(+), 131 deletions(-)

-- 
1.9.1

