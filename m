Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E791482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 07:52:52 -0700 (MST)
Date: Fri, 16 Nov 2001 06:52:43 -0800 (PST)
Message-Id: <20011116.065243.134136673.davem@redhat.com>
To: grundler@puffin.external.hp.com
Cc: linux-mm@kvack.org, parisc-linux@lists.parisc-linux.org
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <200111160730.AAA18774@puffin.external.hp.com>
References: <200111160730.AAA18774@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Subject: [parisc-linux] Re: parisc scatterlist doesn't want page/offset
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

No, you must have page+offset because in the future the
"address" field of scatterlist is going to disappear
and _ONLY_ page+offset will be used.

Do not hack around it, just fix your scatterlist definition instead.
I'm trying to push a Documentation/DMA-mapping.txt update to Linus
which talks about this explicitly and requires your port to have those
fields. 
