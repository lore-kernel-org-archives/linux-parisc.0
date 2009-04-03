From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc: ccio-dma: fix build failure without procfs
Date: Fri, 3 Apr 2009 13:59:02 -0400
Message-ID: <20090403175902.GK14159@bombadil.infradead.org>
References: <20090403120854.GA29187@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090403120854.GA29187@orion>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Apr 03, 2009 at 04:08:54PM +0400, Alexander Beregalov wrote:
> Fix this build error when CONFIG_PROC_FS is not set:
> drivers/parisc/ccio-dma.c:1574: error: 'ccio_proc_info_fops' undeclared
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

Applied to the fixes branch.

cheers, Kyle
