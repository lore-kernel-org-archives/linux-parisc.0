From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Thu, 4 Nov 2010 09:35:08 -0600
Message-ID: <20101104153507.GA7198@lackof.org>
References: <20101031174018.GA26539@hiauly1.hia.nrc.ca> <20101102062623.GC14166@lackof.org> <20101103031919.GA20990@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101103031919.GA20990@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Nov 02, 2010 at 11:19:20PM -0400, John David Anglin wrote:
> On Tue, 02 Nov 2010, Grant Grundler wrote:
> 
> > > IIA Offset (back entry)      = 0x0000000040329438
> > 
> > Is this a kernel address...can you tell me what it matches?
> 
> The kernel address was shown in the analysis at the end of of the dump..

Dave,
Sorry...I had written the questions while going through the email
and then forgot to delete them when I finished reading everything.

In short, I'm skeptical this is a problem in lba_pci code.
Much more likely to be a driver issue or possibly HW issue.
I was pointing at the configs that booted on ion/ioz only to
help rule out driver or HW issues. Feel free to use ion for
testing this.

Also, if there are any add-on PCI cards in the machine, consider
removing them.

thanks,
grant
