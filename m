Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5D7B3482E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Nov 2002 07:01:47 -0700 (MST)
Date: Fri, 15 Nov 2002 13:58:45 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] My System ate a SPARC! *haha* 8-(
In-Reply-To: <1037146661.32080.128.camel@beavis>
Message-ID: <Pine.BSF.4.44.0211151356530.39295-100000@e0-0.zab2.int.zabbadoz.net>
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

On 12 Nov 2002, Ryan Bradetich wrote:

Hi,

> > this it were kernel starts joking ...
> >
> > --- /etc/init.d/initrd-tools.sh ---
> > [ -f /proc/mounts ] || {
> > echo "still ok"
> >         mount -n /proc || exit
> >         trap 'umount -n /proc' EXIT
> > }
> > echo "never reached"
> > --- ... ---
>
> Interesting ... will dig further and see if I can get this fixed.

any outcomes so far ? else I would spent some minutes this weekend
between compiling kernels (which actually will take most time all of
the debugging) to dig into this ...

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
