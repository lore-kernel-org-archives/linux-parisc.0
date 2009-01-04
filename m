From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: bad code with gcc-4.3 and lzma-utils ?
Date: Mon, 5 Jan 2009 00:21:25 +0100
Message-ID: <20090105002125.648016d0@tuxicoman.be>
References: <20090104130812.69c81ed6@bleh.bxl.tuxicoman.be>
	<20090104201641.B52B94EDD@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: vapier@gentoo.org, linux-parisc@vger.kernel.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090104201641.B52B94EDD@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 4 Jan 2009 15:16:40 -0500 (EST)
"John David Anglin" <dave@hiauly1.hia.nrc.ca> wrote:


> The problem was introduced in revision 68677 on June 29, 2003 when
> a change was made to allow ble to be used for local calls.  So, the
> problem is present in all versions back to at least 3.4.
> 
> The following change should fix the bug.  I'm currently doing a full
> build to test.

I just tested this patch with 4.2.4 and it worked fine !

Thanks for the fix.

Cheers,
  Guy
