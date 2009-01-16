From: Alessandro Zummo <alessandro.zummo@towertech.it>
Subject: Re: [rtc-linux] [PATCH 0/9] rtc-parisc cleanup
Date: Fri, 16 Jan 2009 02:48:18 +0100
Message-ID: <20090116024818.1c7c0fba@i1501.lan.towertech.it>
References: <cover.1231983598.git.dannf@hp.com>
	<20090116010633.60c3b87d@i1501.lan.towertech.it>
	<20090116003606.GD7488@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: rtc-linux@googlegroups.com, dannf@hp.com,
	linux-parisc@vger.kernel.org, lkml@vger.kernel.org,
	kyle@mcmartin.ca, akpm@linux-foundation.org, lethal@linux-sh.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090116003606.GD7488@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 15 Jan 2009 19:36:06 -0500
Kyle McMartin <kyle@infradead.org> wrote:

> How does this jive with Paul Mundt's work that kills a bunch of these
> rtc- drivers? (added Paul to CC)

 You mean rtc-firmware? I'm not comfortable in having another legacy
 bridge. archs need to move to the rtc subsystem as a whole.

 I saw a lot of improvements in this direction in the last few kernels,
 and I don't want to have something that will have to be removed in a couple
 of months.

-- 

 Best regards,

 Alessandro Zummo,
  Tower Technologies - Torino, Italy

  http://www.towertech.it

