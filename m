Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id E69014829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 07:50:07 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id BE3491FFEC5
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 15:50:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id 572EA22E1A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 14:49:27 +0000 (UTC)
Date: Sat, 9 Nov 2002 14:49:27 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel build: make palo
In-Reply-To: <Pine.BSF.4.44.0211091415060.32930-100000@e0-0.zab2.int.zabbadoz.net>
Message-ID: <Pine.BSF.4.44.0211091447120.32930-100000@e0-0.zab2.int.zabbadoz.net>
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

On Sat, 9 Nov 2002, Bjoern A. Zeeb wrote:

Hi,

sorry for replying to my own posting. ran out of cafe ;-)


> I usually build all my kernels as user and not as 0. With parisc this
> doesn't work because you try to run
> 	palo -f ./palo.conf
> and that needs to be done as superuser.
>
> --- ... ---
> nm vmlinux | grep -v '\(compiled\)\|\(\.o$\)\|\( [aUw] \)\|\(\.\.ng$\)\|\(LASH[RL]DI\)' | sort > System.map
> A generic palo config file (./palo.conf) has been created for you.
> You should check it and re-run "make palo".
> WARNING: the "lifimage" file is now placed in this directory by default!
> make: *** [palo] Error 1
> --- ... ---

ok had the wrong window.

--- ... ---
palo -f ./palo.conf
/dev/sda: Permission denied
palo version 1.1 bame@c3k Tue Aug  6 09:40:01 MDT 2002
ELF32 executable
make: *** [palo] Error 2
--- ... ---

this would be the correct error message but it's the same target
and problem anyway...

> Suggestion: can we factor this out to be an own target like
> modules_install, etc ?
>
> Then one could do
> 	make dep && make bzImage && make modules
> as user, the switch to su and do a
> 	make modules_install && make palo
> or even run palo by hand...
>
>

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
