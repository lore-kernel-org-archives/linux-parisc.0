From: Tom Rini <trini@kernel.crashing.org>
Subject: [parisc-linux] Re: Generic RTC driver in 2.4.x
Date: Thu, 30 Jan 2003 11:03:15 -0700
Message-ID: <20030130180315.GA14768__21693.7153636993$1416622168$gmane$org@ip68-0-152-218.tc.ph.cox.net>
References: <Pine.GSO.4.21.0301051535430.10519-100000@vervain.sonytel.be> <Pine.GSO.4.21.0301102104190.18440-100000@vervain.sonytel.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	parisc-linux@parisc-linux.org,
	Linux/PPC Development <linuxppc-dev@lists.linuxppc.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <Pine.GSO.4.21.0301102104190.18440-100000@vervain.sonytel.be>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Jan 10, 2003 at 09:05:55PM +0100, Geert Uytterhoeven wrote:
 
> Unfortunately I didn't receive any feedback from the pa-risc and ppc people
> after my previous posting last Sunday.
[snip]
> Pa-risc and ppc people (any other users?), please send me your enhancements (or
> just ack if none are necessary), so I can send genrtc to Marcelo.

Sorry I haven't spoken up before this, A simple cp of
include/asm-ppc/rtc.h (and then throwing the question
someplace) compiles a kernel correctly, and from what I recall of
getting it to work in 2.5, at that point it was all good anyhow.  So
this is fine for PPC32 as is.

-- 
Tom Rini (TR1265)
http://gate.crashing.org/~trini/
