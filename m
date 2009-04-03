From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] stifb: should depend on STI_CONSOLE
Date: Fri, 3 Apr 2009 13:59:24 -0400
Message-ID: <20090403175924.GL14159@bombadil.infradead.org>
References: <20090403133332.GA29437@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090403133332.GA29437@orion>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Apr 03, 2009 at 05:33:32PM +0400, Alexander Beregalov wrote:
> Fix this build error when CONFIG_STI_CONSOLE is not set
> drivers/video/stifb.c:1337: undefined reference to `sti_get_rom'
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

Applied to fixes branch.

Thanks, Kyle
