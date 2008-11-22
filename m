From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [PATCH] parisc: fix kernel crash when unwinding a userspace process (v2)
Date: Sat, 22 Nov 2008 05:22:09 -0700
Message-ID: <20081122122208.GE5707@parisc-linux.org>
References: <200811202258.56561.deller@gmx.de> <200811211516.50750.deller@gmx.de> <20081121111705.dc03a465.akpm@linux-foundation.org> <49272F66.1010702@gmx.de> <20081121142013.f8d59b3f.akpm@linux-foundation.org> <20081122055301.GA12724@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	kyle@hera.kernel.org, randolph@tausq.org, stable@kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081122055301.GA12724@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Nov 21, 2008 at 10:53:01PM -0700, Grant Grundler wrote:
> And Helge has been great about fixing stuff - much better than the three
> listed maintainers lately.
> Kyle, willy, any objection to adding Helge to the MAINTAINERS list
> for PARISC port?
> I'd rather allow Helge to make a few small mistakes occasionally rather
> than watch his parisc specific patches fall on the floor.

No objection from me.  I think it's time to remove me from MAINTAINERS
as it's probably been six months since I last turned on any of my parisc
machines.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
