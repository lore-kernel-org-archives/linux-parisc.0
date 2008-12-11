From: Helge Deller <deller@gmx.de>
Subject: Re: Fwd: [PATCH] fix mapping_writably_mapped()
Date: Thu, 11 Dec 2008 22:31:05 +0100
Message-ID: <49418699.8070900@gmx.de>
References: <20081210214638.GA28696@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081210214638.GA28696@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle McMartin wrote:
> This may explain some of the userspace issues we've been seeing.

It sadly does not fix the kernel panic I reported in
http://marc.info/?l=linux-parisc&m=122877889304862&w=2
("2.6.28: BUG: soft lockup - CPU#0 stuck for 61s!")

Helge
