Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5340448A2
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Mar 2004 00:39:35 -0700 (MST)
Date: Mon, 15 Mar 2004 02:37:40 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Spinlock patch, take 2
Message-ID: <20040315073740.GA660@baldric.uwo.ca>
References: <20040315063318.GC2384@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040315063318.GC2384@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Mar 14, 2004 at 10:33:18PM -0800, Randolph Chung wrote:
> Here's another version of my spinlock patch against 2.6.4. It optimizes
> spinlocks used for atomic operations by putting the atomic locks into a
> special section that is guaranteed to be 16-byte aligned, so no runtime
> alignment is needed. Build-tested against 2.6.4. Comments?

Looks beautiful. Is it measurably faster, or just semantically more
correct than the existing implementation? :)

c.
