Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 614BF4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 May 2003 14:41:25 -0600 (MDT)
Date: Sun, 18 May 2003 20:41:08 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Inconsistency detected by ld.so:.. / do_page_fault()
In-Reply-To: <200305182020.h4IKK5KR017492@hiauly1.hia.nrc.ca>
Message-ID: <Pine.BSF.4.53.0305182038270.86062@e0-0.zab2.int.zabbadoz.net>
References: <200305182020.h4IKK5KR017492@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sun, 18 May 2003, John David Anglin wrote:

> > didn't :((
> >
> > rebuild vim by hand with gcc 3.3 and it again segfaulted on startup :(
> > seems like this is a problem with shared libs ?
>
> Did you rebuild or downgrade glibc as suggested?

missed that point because the point in my first posting also was glibc
related and I thaught of these as two independend problems but both
are glibc related....  *grrml*
Well, going to see where I can get an up-to-date glibc source
(including the patches) from ...

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
