From: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: [PATCH v2 2/5] parisc: cleanup console handling
Date: Thu, 04 Nov 2010 23:02:51 +0100
Message-ID: <4CD32D8B.2080709@gmail.com>
References: <1288884024-23873-1-git-send-email-jslaby@suse.cz> <1288884024-23873-2-git-send-email-jslaby@suse.cz> <20101104172613.GK8332@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Jiri Slaby <jslaby@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>, werner@suse.de,
	alan@lxorguk.ukuu.org.uk, gregkh@suse.de,
	linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101104172613.GK8332@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/04/2010 06:26 PM, Kyle McMartin wrote:
> On Thu, Nov 04, 2010 at 04:20:21PM +0100, Jiri Slaby wrote:
>> * use newly added for_each_console for iterating consoles
>> * add proper console locking
>> * do not initialize tmp twice
>> * no need to declare console_drivers, it's already done in console.h
>>
>> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
>> Cc: Kyle McMartin <kyle@mcmartin.ca>
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
>> Cc: linux-parisc@vger.kernel.org
> 
> This looks fine...
> Acked-by: Kyle McMartin <kyle@mcmartin.ca>
> 
> I assume that since it depends on 1/5 you'd prefer to merge it with the
> rest?

Yeah, I would like to, with ACKs from relevant people.

thanks,
-- 
js
