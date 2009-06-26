From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: 2.6.31-rc1: parisc: multiple PCI BAR collisions
Date: Fri, 26 Jun 2009 16:16:02 -0400
Message-ID: <20090626201602.GA9862@bombadil.infradead.org>
References: <a4423d670906260158q15080049ue516c3d454f4afbf@mail.gmail.com> <20090626170304.GA20871@lackof.org> <20090626174418.GX19977@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Alexander Beregalov <a.beregalov@gmail.com>,
	linux-parisc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090626174418.GX19977@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 26, 2009 at 11:44:18AM -0600, Matthew Wilcox wrote:
> > > Hardware is HP j6000.
> > > It cannot initialize many PCI devices (sym53c8xx, tulip, STI,
> > > usb(onci)) and cannot boot (no root device).
> > > Messages like this:
> > > sym53c8xx 0:0:0f.0: device not available because of BAR 1 [0xf4005000
> > > - 0xf40053ff] collisions.
> > 
> > I'm pretty sure this is a problem of the root bus resources not getting
> > setup correctly. I'm not clear on what's wrong. jejb and willy are looking
> > at it now as well.
> 
> This patch fixes it for me.
> 

obviously correct, applied and pushed out.

thanks, kyle
