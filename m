From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc : KittyHawk LCD fix
Date: Thu, 25 Nov 2010 13:17:57 -0500
Message-ID: <20101125181757.GJ22651@bombadil.infradead.org>
References: <20101106172429.5c3d1568@borg.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101106172429.5c3d1568@borg.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Nov 06, 2010 at 05:24:29PM +0100, Guy Martin wrote:
> 
> K class aka KittyHawk don't have LED support on their LCD. Installing
> HP-UX confirmed this. The current led_wq fills the LCD with black
> characters each time it runs.
> 
> The patch prevents the led_wq workqueue and its proc entry to be
> created for KittyHawk machines.
> 
> It also increase min_cmd_delay as currently, one character out of two
> is lost when a string is sent to the LCD.
> 
> Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>

Applied, thanks Guy.
