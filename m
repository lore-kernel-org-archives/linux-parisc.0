From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 0/8] parisc: Convert to new irq_chip functions
Date: Sun, 06 Feb 2011 20:45:47 -0000
Message-ID: <20110206204411.109238550@linutronix.de>
Cc: Kyle McMartin <kyle@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The following series converts parisc to the new irq_chip functions and
sets GENERIC_HARDIRQS_NO_DEPRECATED. Compile tested only.

Thanks,

	tglx

