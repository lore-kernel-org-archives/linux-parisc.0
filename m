From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] liquidio: Use %pad printk format for dma_addr_t values
Date: Mon, 16 Jul 2018 13:37:49 -0700 (PDT)
Message-ID: <20180716.133749.971124184265899837.davem@davemloft.net>
References: <20180712203629.GA32537@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: derek.chickles@caviumnetworks.com,
        satananda.burla@caviumnetworks.com,
        felix.manlunas@caviumnetworks.com,
        raghu.vatsavayi@caviumnetworks.com, netdev@vger.kernel.org,
        linux-parisc@vger.kernel.org
To: deller@gmx.de
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180712203629.GA32537@ls3530.fritz.box>
List-ID: <linux-parisc.vger.kernel.org>

From: Helge Deller <deller@gmx.de>
Date: Thu, 12 Jul 2018 22:36:29 +0200

> Use the existing %pad printk format to print dma_addr_t values.
> This avoids the following warnings when compiling on the parisc platform:
> 
> warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

Applied.
