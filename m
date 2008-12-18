From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when compiling
Date: Thu, 18 Dec 2008 11:09:24 -0500
Message-ID: <119aab440812180809s414e4bb9k8a7196ab55020b88@mail.gmail.com>
References: <20081218131357.260160@gmx.net>
	 <20081218152841.E85E74F28@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Helge Deller" <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218152841.E85E74F28@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 18, 2008 at 10:28 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> From the documentation, it appears to me that a protection id trap should
> be treated differently from a data TLB miss/data page fault.  The latter can
> potentially be fixed with TLB insertion.  I don't think a protection ID trap
> can be fixed...

Yes, I think that is also true.

What if, after a context switch we have stale TLB entry with an access
ID from another process? When the kernel tries to write to the user
address the current protection ids don't match the page's access id
and we generate a protection id trap.

Cheers,
Carlos.
