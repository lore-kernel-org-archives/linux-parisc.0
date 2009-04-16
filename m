From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc/superio: fix build breakage
Date: Thu, 16 Apr 2009 12:14:35 -0400
Message-ID: <20090416161435.GB21359@bombadil.infradead.org>
References: <1239893159-18112-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: alan@lxorguk.ukuu.org.uk, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1239893159-18112-1-git-send-email-a.beregalov@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Apr 16, 2009 at 06:45:59PM +0400, Alexander Beregalov wrote:
> Usage of parport_pc_probe_port was changed in 28783eb52
> (parport: Fix various uses of parport_pc).
> 
> It introduced this build error:
> drivers/parisc/superio.c: In function 'superio_parport_init':
> drivers/parisc/superio.c:437: error: too few arguments to function
> 				'parport_pc_probe_port'
> 
> Fix it.
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

Hi Alexander,

Wei Yongjun sent this patch in a few days ago, and I've applied it, but
it appears I forgot to update patchwork or push out the fixes branch.

Cheers, Kyle
