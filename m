Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 14 Aug 2003 23:41:21 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: caslivkoff@speakeasy.net
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: Re: xchat colors (Was Re:  [parisc-linux] xfree86 4.2.1-9 build problem)
Message-ID: <20030815054121.GC2989@dsl2.external.hp.com>
References: <W9958529574305441060899998@webmail4>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <W9958529574305441060899998@webmail4>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, Aug 14, 2003 at 10:26:38PM +0000, caslivkoff@speakeasy.net wrote:
> Just to be sure this is indeed a colormap issue, start an X session
> using twm, then only launch xchat. If the colors are "OK",
> then it's a pretty good bet that the default colormap is max-ed out.
> 
> Also, I've attached is short Xlib program. This will report the
> number of private color cells remaining in the default colormap.

The attachement didn't make it through.
I got the copy at another email address and put the hppa binary,
source, and "README" in a tarball:
	http://iou.parisc-linux.org/hppa/xcmap.tgz

When running twm on c3k (1280x1024x8), xcmap reports:
| Default visual is 256-color PseudoColor
| 10 private color cells available

Things are worse with fvwm:
| Default visual is 256-color PseudoColor
| 0 private color cells available

It didn't matter which window mangler I used.
Both failed to provide the text color.

xchat2 wants 23 colors - but they don't need to be private though.
Will add some more printks to xchat so I know what/how it's failing.

thanks again for xcmap....handy in this case.

grant
