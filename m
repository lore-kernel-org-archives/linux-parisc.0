From: "rubisher" <rubisher@scarlet.be>
Subject: Re: [PATCH -mm 0/3] fix iommu segment boundary problems (parisc)
Date: Mon,  3 Mar 2008 11:36:21 +0100
Message-ID: <JX5HGL$BEF7E287D07253279B235998ACF88988@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "fujita\.tomonori" <fujita.tomonori@lab.ntt.co.jp>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	"tomof" <tomof@acm.org>, "kyle" <kyle@parisc-linux.org>,
	"matthew" <matthew@wil.cx>, "grundler" <grundler@parisc-linux.org>,
	"akpm" <akpm@linux-foundation.org>,
	"rubisher" <rubisher@scarlet.be>
To: "kyle" <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Sun, Mar 02, 2008 at 03:10:25PM +0900, FUJITA Tomonori wrote:
> > This patchset is another sequel to my patchset to fix iommu segment
> > boundary problems, IOMMUs allocate memory areas without considering a
> > low level driver's segment boundary limits:
> > 
> > http://www.mail-archive.com/linux-scsi@vger.kernel.org/msg11919.html
> > 
> 
> This looks fine. Are you able to test this? If not, we can set you up
> with an account on a machine with remote console and all that jazz, if
> you'd like to.
> 
> cheers, Kyle
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
Dear *,

I have access to 3 kind of boxes which needed one of those drivers: a b2k and
mainly a c110 and a d380 for which I hope a lot of this patch ;-)

I will so try the patch asap and let you know the results.

hth,
    r.

---
Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
http://www.scarlet.be/

