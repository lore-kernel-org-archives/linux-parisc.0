From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc: fix the parameters of call to
	parport_pc_probe_port()
Date: Tue, 14 Apr 2009 10:13:20 -0400
Message-ID: <20090414141320.GB30359@bombadil.infradead.org>
References: <aea82416ed6c6805412a2631fe8a8be6420c5c9d.1239687192.git.tony@bakeyournoodle.com> <49E426C1.50706@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Wei Yongjun <yjwei@cn.fujitsu.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49E426C1.50706@cn.fujitsu.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Apr 14, 2009 at 02:01:37PM +0800, Wei Yongjun wrote:
> commit 51dcdfec6a274afc1c6fce180d582add9ff512c0 (parport: Use the PCI
> IRQ if offered) parport_pc_probe_port() gained an irqflags arg. This
> break parisc. This patch make parisc fallback to the old behaviour,
> that is using "0" for irqflags.
> 
> No test.
> 

Looks good, thanks, applied.
