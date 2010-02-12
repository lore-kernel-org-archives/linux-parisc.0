From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: parsic/sh/sparc tracehook breakage when tracing signals
Date: Fri, 12 Feb 2010 10:09:01 -0500
Message-ID: <20100212150901.GH24051@bombadil.infradead.org>
References: <201002111910.50596.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-sh@vger.kernel.org, linux-parisc@vger.kernel.org,
	sparclinux@vger.kernel.org, Roland McGrath <roland@redhat.com>,
	linux-kernel@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <201002111910.50596.vapier@gentoo.org>
List-ID: <linux-sh.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Feb 11, 2010 at 07:10:47PM -0500, Mike Frysinger wrote:
> seems like you guys should just change the last argument to:
> 	test_thread_flag(TIF_SINGLESTEP)

Good catch, I've committed a patch to fix this, will send it upstream
today.

regards, Kyle
