From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: 2.6.35-rc1 and RCU
Date: Fri, 4 Jun 2010 11:50:33 -0400
Message-ID: <20100604155033.GC20317@bombadil.infradead.org>
References: <20100604094405.GM28492@bombadil.infradead.org> <4C08E5FE.80905@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4C08E5FE.80905@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 04, 2010 at 01:39:42PM +0200, Helge Deller wrote:
> On 06/04/2010 11:44 AM, Kyle McMartin wrote:
> > Did anyone else see a hang on 2.6.35-rc1 just after RCU initializes?
> 
> Yes, I did see this as well.
> 

Cool, next time I reboot I'll see if initcall_debug helps.
