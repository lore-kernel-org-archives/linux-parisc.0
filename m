From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] drop superfluous .align 16
Date: Tue, 26 Aug 2008 08:42:10 -0400
Message-ID: <119aab440808260542i28772da4x89c1f98d8a28d710@mail.gmail.com>
References: <200808242026.06295.deller@gmx.de>
	 <200808242051.12202.deller@gmx.de>
	 <1219604258.4550.3.camel@localhost.localdomain>
	 <48B2A62C.2060001@gmx.de> <20080826042619.GB30449@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Helge Deller" <deller@gmx.de>,
	"James Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	"Kyle McMartin" <kyle@mcmartin.ca>
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080826042619.GB30449@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Aug 26, 2008 at 12:26 AM, Grant Grundler
<grundler@parisc-linux.org> wrote:
> Thanks for tracking and resubmitting this...Carlos already ACK'd and I think
> it would be good if kyle added it to his patch queue.
>
> But I liked two other things proposed in this thread.
> 1) jejb's preference to document the alignement requirement
> 2) jda's proposal for ENTRY_ALIGN() (which accomplishes (1))
>
> So I've hacked your patch to include those two things.
>
> I've only build-tested this for 64-bit builds.
>
> thanks,
> grant
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Grant Grundler <grundler@parisc-linux.org>
Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

I agree with both Helge's original patch and this one. Thanks for
making an ENTRY_ALIGN macro. The macro keeps the symbol and alignment
together. Well done.

Cheers,
Carlos.
