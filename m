Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1FB3D4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jun 2003 12:21:17 -0600 (MDT)
Date: Mon, 16 Jun 2003 18:09:57 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5.71-pa1 do_sigaction problem
In-Reply-To: <200306160314.h5G3E2SF003545@hiauly1.hia.nrc.ca>
Message-ID: <Pine.BSF.4.53.0306161754180.10327@e0-0.zab2.int.zabbadoz.net>
References: <200306160314.h5G3E2SF003545@hiauly1.hia.nrc.ca>
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

On Sun, 15 Jun 2003, John David Anglin wrote:

Hi,

> >  IAOQ[0]: __canonicalize_funcptr_for_compare+0x38/0x134
> >  IAOQ[1]: __canonicalize_funcptr_for_compare+0x3c/0x134
> >  RP(r2): do_sigaction+0xe0/0x290
>
> Fixes for this have been discussed on the list several times before.

thanks. I was right saying I had this before. fixed my .69 with one of
the suggestions from may I guess and forgot to add the patch to my
patchlist.

Anyway there is still no solution to this from what I can see. People
always compile kernels and bump -paX but from what I can see the
kernel won't boot up. So how can they test it ? How do they get a
bootable kernel ?

If I remember on solution was adding (void *) casts to all those
function pointer compares but that was not take a solution as Linus
wouldn't accept s.th. like this.
Then there was the solution with the EXPORT_SYMBOL (I think that one
worked for me).

Are you all patching your kernels ? Why not commit one of the fixes
- at least temporary - to p-l.o cvs ?

What didn't I get now ?

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
