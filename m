From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: ccio-dma q about io pdir: is there a kernel mem space never
	paged?
Date: Mon, 21 Jul 2008 10:58:45 -0400
Message-ID: <20080721145845.GB13751@phobos.i.cabal.ca>
References: <48848108.5000805@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <48848108.5000805@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jul 21, 2008 at 12:28:56PM +0000, Joel Soete wrote:
>

The kernel is never paged out. Just think, if you page out the swapper,
how could you page anything back in?
