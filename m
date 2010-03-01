From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc: use __ratelimit
Date: Mon, 1 Mar 2010 18:54:07 -0500
Message-ID: <20100301235407.GC12443@bombadil.infradead.org>
References: <1267354697-6456-1-git-send-email-akinobu.mita@gmail.com> <1267354697-6456-3-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1267354697-6456-3-git-send-email-akinobu.mita@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Feb 28, 2010 at 07:58:15PM +0900, Akinobu Mita wrote:
> Replace open-coded rate limiting logic with __ratelimit().
> 

Thanks, I'll apply this.

regards, Kyle
