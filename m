Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 19 Aug 2003 22:37:02 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Lev Assinovsky <LAssinovsky@algorithm.aelita.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Help: Need instruction sequence for gdb breakpoint
Message-ID: <20030820043702.GC24884@dsl2.external.hp.com>
References: <3F6F4712B759A34ABD453A8B39C10D62D4DA83@bagman.edm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F6F4712B759A34ABD453A8B39C10D62D4DA83@bagman.edm.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, Aug 19, 2003 at 02:47:47PM +0400, Lev Assinovsky wrote:
> Ok! But what's BREAK instruction for?

To force a trap into the kernel. That's not the same
as HW support since using break requires modifying the code stream
(remembering which instruction belonged there), flushing data-cache,
flush ins-cache, an dtrying to continue. The break's are fully
under SW control.

> Besides gdb works for me on HPUX 11.00

That's because HP has (had?) a team of folks working on the
"open source toolkit". parisc-linux hasn't been so lucky.
Alan Modra, Richard Hirst, Randolph Chung and a few others get gdb
working from time to time. But there is no dedicated maintainer
and that's what is needed.

grant
