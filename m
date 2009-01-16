From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [rtc-linux] [PATCH 0/9] rtc-parisc cleanup
Date: Thu, 15 Jan 2009 19:36:06 -0500
Message-ID: <20090116003606.GD7488@bombadil.infradead.org>
References: <cover.1231983598.git.dannf@hp.com> <20090116010633.60c3b87d@i1501.lan.towertech.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: rtc-linux@googlegroups.com, dannf@hp.com,
	linux-parisc@vger.kernel.org, lkml@vger.kernel.org,
	kyle@mcmartin.ca, akpm@linux-foundation.org, lethal@linux-sh.org
To: Alessandro Zummo <alessandro.zummo@towertech.it>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090116010633.60c3b87d@i1501.lan.towertech.it>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 16, 2009 at 01:06:33AM +0100, Alessandro Zummo wrote:
> On Thu, 15 Jan 2009 16:46:47 -0700
> dann frazier <dannf@hp.com> wrote:
> 
> > I recently submitted an rtc-efi driver having used rtc-parisc as a
> > template. I received several suggestions from Alessandro Zummo and
> > Andrew Morton that also apply to rtc-parisc. This series merges the
> > relevant changes back into the rtc-parisc driver.
> 
>  Acked-by: Alessandro Zummo <a.zummo@towertech.it>
> 
>  on the whole series. Thank you Dann!
> 

How does this jive with Paul Mundt's work that kills a bunch of these
rtc- drivers? (added Paul to CC)

These patches are cool with me. (I noticed you kept the same comment in
the ia64 time.c code. ;-)

Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
