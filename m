From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Weird sys readings during ghc run
Date: Thu, 6 May 2010 21:40:39 -0400
Message-ID: <20100507014038.GA21776@hiauly1.hia.nrc.ca>
References: <w2p7d01f9f01005060541jca558889j5e9ef1e4eccf675a@mail.gmail.com> <00E6F5C7-BD87-4BD0-8E6F-C80D8E427DAA@parisc-linux.org>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-parisc@vger.kernel.org
To: Thibaut =?iso-8859-1?Q?VAR=C8NE?= <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <00E6F5C7-BD87-4BD0-8E6F-C80D8E427DAA@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 06 May 2010, Thibaut VAR=C8NE wrote:

> Lafayette is running 2.6.32-3-parisc64-smp, and this apparently
> happened during the build of haskell-src-exts_1.8.2-3

Besides, the minifail cache aliasing problem, I'm absolutely convinced
that there are race conditions in the updating of ptes on smp kernels.
Until that is fixed, all manner of wierd things can happen.  However,
as I'm finding, fixing this is tricky and it will have a performance
impact.

Dave
--=20
J. David Anglin                                  dave.anglin@nrc-cnrc.g=
c.ca
National Research Council of Canada              (613) 990-0752 (FAX: 9=
52-6602)
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
