From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [GIT PULL] parisc updates for v3.12-rc5
Date: Mon, 14 Oct 2013 04:26:21 -0700
Message-ID: <20131014112621.GA9705@infradead.org>
References: <20131013161130.GA19534@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131013161130.GA19534@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Geert Uytterhoeven (1):
>       parisc: Export flush_cache_page() (needed by lustre)

This one shouldn't go in - Geert sent it a bit prematurely, as Lustre
shouldn't use it just to reimplement core VM functionality (which it
shouldn't use either, but that's a separate story).

