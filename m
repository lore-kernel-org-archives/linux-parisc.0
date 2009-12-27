From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc: test off by one in sgl_frem() and dbl_frem()
Date: Sun, 27 Dec 2009 10:10:45 -0500 (EST)
Message-ID: <20091227151047.15BE74EB5@hiauly1.hia.nrc.ca>
References: <4B375F68.80301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org,
	linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
To: roel.kluin@gmail.com (Roel Kluin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B375F68.80301@gmail.com> from "Roel Kluin" at Dec 27, 2009 02:21:44 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> With `while (stepcount-- > 0)' stepcount reaches -1 after the loop.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
>  arch/parisc/math-emu/dfrem.c |    2 +-
>  arch/parisc/math-emu/sfrem.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Unless I am missing something?

Are you sure the correct fix isn't to move the decrement of stepcount
into the loop?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
