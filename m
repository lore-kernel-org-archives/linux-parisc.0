Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 513714829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Sep 2002 09:03:04 -0600 (MDT)
Date: Mon, 2 Sep 2002 16:56:11 +0200
Message-ID: <3D3815BD0000A825@ocpmta5.be.tiscali.com>
In-Reply-To: <3D3815BD0000A54B@ocpmta5.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] Gcc-3.2 beside gcc-3.0: HOWTO?
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

>
>Hi all,
>
>I install gcc-3.2 beside default gcc-3.0.
>
>I would like to use gcc-3.2 to compile the latest cvs kernel. HOWTO do this?
>
>Thanks in advance,
>    Joel
>
>PS: with gcc-3.1.1 snapshot I reach to obtain a bootable 32bit kernel but
>presenting a problem with network connection. Was I alone to observe this?
>
I also forget to mentionned that I also applied recommendation in /usr/share/doc/gcc-3.2-base/README.Debian.gz
(ie: CC="gcc-3.2" ; export CC but in the kernel special case there is no
./configure step so may be there is another teaps. And with snapshot gcc
was build in another tree so the problem didn't exists)

Many thanks again for all help,
    Joel
