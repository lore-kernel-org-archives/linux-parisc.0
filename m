From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] statfs() problem with glibc-2.5
Date: Mon, 12 Feb 2007 09:48:06 -0700
Message-ID: <20070212164806.GT13101__30408.7384058677$1416624288$gmane$org@parisc-linux.org>
References: <20070212102844.f045d760.gmsoft@gentoo.org>
	<20070212153731.846e2ad3.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Guy Martin <gmsoft@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070212153731.846e2ad3.gmsoft@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Feb 12, 2007 at 03:37:31PM +0100, Guy Martin wrote:
> After some more troubleshooting, I've found out that parisc doesn't hook up the statfs64 syscall.

I thought we didn't need a statfs64 syscall since it returns the same
struct as statfs on parisc (due to the struct definitions already being
big enough).  However, now that I review the definitions, I think you're
right and we should hook it up.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
