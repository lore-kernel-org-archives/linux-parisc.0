From: Thibaut VARENE <varenet@parisc-linux.org>
Subject: Re: [PATCH] parisc: remove CVS keywords
Date: Sat, 4 Apr 2009 17:38:34 +0200
Message-ID: <7d01f9f00904040838q12533d0r772ef22b10a35b23@mail.gmail.com>
References: <20090403014922.GA28891@orion>
	 <20090403175849.GJ14159@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Alexander Beregalov <a.beregalov@gmail.com>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090403175849.GJ14159@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Apr 3, 2009 at 7:58 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> On Fri, Apr 03, 2009 at 05:49:22AM +0400, Alexander Beregalov wrote:
>>
>> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
>
> I don't feel comfortable removing these for hysterical raisins, unless
> people on the list ack this.

Well I clearly have no say regarding those specific files, but it
seems to me like these CVS Id tags are completely meaningless, anyway
you want to look at them. They barely refer to the last person having
touched these files in our *CVS* tree, which hasn't been touched in
ice ages...

Copyright information is stored elsewhere, and historical trivia can
still be found in said CVS tree.

Plus, I may be wrong but ISTR back in the days when we were still
using CVS that these very tags were frowned upon as they were the
source of merge conflicts (I'm pretty sure there were some emails
about that years ago, though I can't seem to find them online).

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
