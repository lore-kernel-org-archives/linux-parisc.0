Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id F3C78482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 09:37:56 -0700 (MST)
Message-Id: <200111161632.JAA25977@puffin.external.hp.com>
To: "David S. Miller" <davem@redhat.com>
Cc: willy@debian.org, linux-mm@kvack.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: parisc scatterlist doesn't want page/offset 
In-Reply-To: Message from "David S. Miller" <davem@redhat.com>
   of "Fri, 16 Nov 2001 07:33:28 PST." <20011116.073328.129356309.davem@redhat.com>
Date: Fri, 16 Nov 2001 09:32:52 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

"David S. Miller" wrote:
> Part of the criteria to whether we merge back Jens' code is
> if the ports, given reasonable notice (ie. take this as your notice)
> have added in the support for page+offset pairs to their pci_map_sg
> code.

That is what willy was talking about.
You asking folks to muck with what's supposed to be working code.

> I suggest you do this now, it is totally painless.  I would almost
> classify it as a mindless edit.

Adding two members to a struct is not the problem.
The problem is revisiting every usage of ->address in the DMA code
and telling driver writers they should be using page+offset.

grant
