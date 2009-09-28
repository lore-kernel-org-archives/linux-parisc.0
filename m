From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH 06/10] parisc: Convert BUG() to use unreachable()
Date: Sun, 27 Sep 2009 23:20:19 -0400
Message-ID: <20090928032019.GJ11961@bombadil.infradead.org>
References: <4AA991C1.1050800@caviumnetworks.com> <1252627011-2933-6-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752873AbZI1DUW@vger.kernel.org>
In-Reply-To: <1252627011-2933-6-git-send-email-ddaney@caviumnetworks.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Sep 10, 2009 at 04:56:47PM -0700, David Daney wrote:
> Use the new unreachable() macro instead of for(;;);
> 
> Signed-off-by: David Daney <ddaney@caviumnetworks.com>
> CC: Kyle McMartin <kyle@mcmartin.ca>
> CC: Helge Deller <deller@gmx.de>
> CC: linux-parisc@vger.kernel.org

Since the dependent part of this patch seems to have missed the merge
window, I guess we'll sit on this until next round?

--Kyle
