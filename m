From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] NICs on EISA bus...
Date: Wed, 11 Oct 2006 12:04:35 -0500
Message-ID: <1160586275.3447.38.camel@mulgrave.il.steeleye.com>
References: <452CE20A020000C500004F88@mail.scires.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: James Love <jlove@scires.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <452CE20A020000C500004F88@mail.scires.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, 2006-10-11 at 12:22 -0400, James Love wrote:
> Writing a simple EISA driver allows me to read the board id and MAC off
> the card, but I'm not sure if the IO or interrupts are working
> correctly.  Is there some reason (eg kernel/eisa bus issues) that I
> shouldn't expect to get this to work?  I spend all my time in userspace,
> so I may very well have driver issues, but I'd like to know whether this
> is even possible.

It's possible, but I'm not sure it can be done without programming the
WAX interface (that's a thing the person who last read the WAX documents
can tell us ... unfortunately we no longer seem to have a copy of the
docs).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
