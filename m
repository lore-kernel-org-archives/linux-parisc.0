From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [PATCH] printk-formats.txt: Add examples for %pS and %pF
Date: Thu, 24 Aug 2017 09:41:03 +0900
Message-ID: <20170824004103.GA3569@jagdpanzerIV.localdomain>
References: <20170810173533.GA11600@ls3530.fritz.box>
 <20170811001521.GA520@jagdpanzerIV.localdomain>
 <47718712-9eb2-8ad7-965e-d0971d07e985@gmx.de>
 <20170815113625.GA2738@pathway.suse.cz>
 <d5fda170-e95b-024e-59ad-650b4db78ba6@gmx.de>
 <20170823144824.GE27895@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170823144824.GE27895@pathway.suse.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On (08/23/17 16:48), Petr Mladek wrote:
[..]
> Sometimes people seems unclear when to use the %pS or %pF printk format.
> For example, see commit 51d96dc2e2dc ("random: fix warning message on ia64
> and parisc") which fixed such a wrong format string.
> 
> The documentation should be more clear about the difference.
> Also examples might help to avoid some typical mistakes.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> [pmladek@suse.com: Restructure the entire section]
> Signed-off-by: Petr Mladek <pmladek@suse.com>

looks great.

FWIW,
Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss
