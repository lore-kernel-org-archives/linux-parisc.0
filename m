Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mtvmime01.veritas.com (bay-bridge.veritas.com [143.127.3.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F2334913
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Aug 2003 01:20:42 -0600 (MDT)
Received: from [192.168.184.26]([192.168.184.26]) (1238 bytes) by megami
	via sendmail with P:esmtp/R:smart_host/T:smtp
	(sender: <hugh@veritas.com>)
	id <m19qShU-000090C@megami>
	for <linux-kernel@vger.kernel.org>; Sat, 23 Aug 2003 00:20:40 -0700 (PDT)
	(Smail-3.2.0.101 1997-Dec-17 #15 built 2001-Aug-30)
Date: Sat, 23 Aug 2003 08:22:19 +0100 (BST)
From: Hugh Dickins <hugh@veritas.com>
To: James Bottomley <James.Bottomley@SteelEye.com>
Cc: "David S. Miller" <davem@redhat.com>, <willy@debian.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>,
	<drepper@redhat.com>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing tst-mmap-eofsync
 in glibc on parisc)
In-Reply-To: <1061600974.2090.809.camel@mulgrave>
Message-ID: <Pine.LNX.4.44.0308230820020.3590-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

On 22 Aug 2003, James Bottomley wrote:
> 
> I suppose if we had a way of telling if any of the i_mmap list members
> were really MAP_SHARED semantics mappings, then we could alter our
> flush_dcache_page() implementation to work.

Good idea.  It's VM_MAYSHARE you need to check for.

Hugh
