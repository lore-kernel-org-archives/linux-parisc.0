From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] Re: ioctl32 cleanup -- rest of architectures
Date: Mon, 10 Mar 2003 19:56:10 +0000
Message-ID: <20030310195610.GJ5278__22822.1715231941$1416622270$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <20030310172832.GG5278@parcelfarce.linux.theplanet.co.uk> <20030310185647.GA11310@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Matthew Wilcox <willy@debian.org>, linux-kernel@vger.kernel.org,
	parisc-linux@parisc-linux.org
To: Pavel Machek <pavel@ucw.cz>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030310185647.GA11310@atrey.karlin.mff.cuni.cz>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Mar 10, 2003 at 07:56:47PM +0100, Pavel Machek wrote:
> So I should take arch/parisc/kernel/syscall.S and change
> ENTRY_DIFF(ioctl) into ENTRY_COMP(ioctl)? Great, thanx.

Exactly.

> [BTW have you actually tested it or are these just first obvious
> mistakes?]

I haven't tested it... no convenient 64-bit box at present.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
