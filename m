Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C443483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 07:14:19 -0600 (MDT)
Date: Fri, 26 Sep 2003 05:56:52 -0700
From: "David S. Miller" <davem@redhat.com>
To: SANTOSH ABRAHAM <santosha@india.hp.com>
Cc: willy@debian.org, sct@redhat.com, santosh.abraham@hp.com,
	randolph@tausq.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-Id: <20030926055652.32ddbbc2.davem@redhat.com>
In-Reply-To: <200309261311.SAA27414@redsea.india.hp.com>
References: <20030926053805.63bda07a.davem@redhat.com>
	<200309261311.SAA27414@redsea.india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, 26 Sep 2003 18:41:41 +0530 (IST)
SANTOSH ABRAHAM <santosha@india.hp.com> wrote:

> The problem in this case is page->mapping is NULL. 

When page->mapping is NULL, flush_dcache_page() should purge the page
(by physical addres) from it's caches.  This is what sparc64 does.

Flushing just the current address space is incorrect, so don't get the
fancy idea to pass the 'mm' and 'va' into flush_dcache_page().
