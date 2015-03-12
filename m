From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH 14/22] parisc: %pF is only for function pointers
Date: Thu, 12 Mar 2015 08:11:22 -0400
Message-ID: <1426162282.2146.77.camel@HansenPartnership.com>
References: <1426130037-17956-1-git-send-email-scottwood@freescale.com>
	 <1426130037-17956-14-git-send-email-scottwood@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: Scott Wood <scottwood@freescale.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1426130037-17956-14-git-send-email-scottwood@freescale.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2015-03-11 at 22:13 -0500, Scott Wood wrote:
> Use %pS for actual addresses, otherwise you'll get bad output
> on arches like ppc64 where %pF expects a function descriptor.  Even on
> other architectures, refrain from setting a bad example that people
> copy.

Are you sure about this?  Parisc64 is a function description
architecture.  There may be a misunderstanding about what
__builtin_return_address(0) is supposed to return, but I'm certain the
person who added the code thought it returned a function pointer, which
on parisc64 would be a descriptor.

James


