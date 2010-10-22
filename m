From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH 1/1] PARISC: unwind - optimise linked-list searches for
 modules
Date: Thu, 21 Oct 2010 21:12:47 -0400
Message-ID: <20101022011247.GM8332@bombadil.infradead.org>
References: <1284115679-23928-1-git-send-email-ext-phil.2.carmody@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Phil Carmody <ext-phil.2.carmody@nokia.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1284115679-23928-1-git-send-email-ext-phil.2.carmody@nokia.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Sep 10, 2010 at 01:47:59PM +0300, Phil Carmody wrote:
> Having many dozens of modules, the searches down the linked
> list of sections would dominate the lookup time, dwarfing
> any savings from the binary search within the section.
> 
> A simple move-to-front optimisation exploits the commonality
> of the code paths taken, and in simple real-world tests
> on other architectures reduced the number of steps in the
> search to barely more than 1.
> 

Applied, thanks.

--kyle
