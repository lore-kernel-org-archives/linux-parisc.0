From: David Rientjes <rientjes@google.com>
Subject: Re: [Resend with ACK][PATCH] mm/arch: use NUMA_NODE
Date: Tue, 24 Sep 2013 19:35:29 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1309241935190.26187@chino.kir.corp.google.com>
References: <524019D0.9070706@huawei.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Andrew Morton <akpm@linux-foundation.org>,
    Ralf Baechle <ralf@linux-mips.org>, linux-mm@kvack.org,
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
    linux-mips@linux-mips.org, linux-parisc@vger.kernel.org,
    linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
To: Jianguo Wu <wujianguo@huawei.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <524019D0.9070706@huawei.com>
List-ID: <linux-mm.kvack.org>

On Mon, 23 Sep 2013, Jianguo Wu wrote:

> Use more appropriate NUMA_NO_NODE instead of -1 in all archs' module_alloc()
> 
> Signed-off-by: Jianguo Wu <wujianguo@huawei.com>
> Acked-by: Ralf Baechle <ralf@linux-mips.org>

Acked-by: David Rientjes <rientjes@google.com>

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
