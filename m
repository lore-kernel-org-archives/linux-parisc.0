From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH 6/8] parisc irq: update parisc for new irq_desc
Date: Tue, 13 Jan 2009 01:04:40 -0500
Message-ID: <20090113060440.GA12487@bombadil.infradead.org>
References: <20090112220519.566749000@polaris-admin.engr.sgi.com> <20090112220520.435553000@polaris-admin.engr.sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Ingo Molnar <mingo@redhat.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jack Steiner <steiner@sgi.com>, linux-kernel@vger.kernel.org,
	Kyle McMartin <kyle@mcmartin.ca>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Mike Travis <travis@sgi.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090112220520.435553000@polaris-admin.engr.sgi.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jan 12, 2009 at 02:05:25PM -0800, Mike Travis wrote:
> Impact: cleanup, update to new cpumask API
> 
> Irq_desc.affinity and irq_desc.pending_mask are now cpumask_var_t's
> so access to them should be using the new cpumask API.
>

ok. 
