From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] [RFC][PATCH] use cycle_t instead of u64 in struct time_interpolator
Date: Tue, 2 Jan 2007 14:44:31 -0700
Message-ID: <20070102214431.GA7317__27333.5266313099$1416624246$gmane$org@parisc-linux.org>
References: <200701022233.25697.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <willy@parisc-linux.org>
In-Reply-To: <200701022233.25697.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jan 02, 2007 at 10:33:25PM +0100, Helge Deller wrote:
> Ok, not Ok ?

Um, this is still doing cmpxchg() with insufficient locking.  So, not
OK.
