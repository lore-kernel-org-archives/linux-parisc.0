Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id A730A482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 17:17:45 -0700 (MST)
Subject: Re: [parisc-linux] [2.5] My System ate a SPARC! *haha* 8-(
From: Ryan Bradetich <rbradetich@uswest.net>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: 
	<Pine.BSF.4.44.0211122148260.39295-100000@e0-0.zab2.int.zabbadoz.net>
References: 
	<Pine.BSF.4.44.0211122148260.39295-100000@e0-0.zab2.int.zabbadoz.net>
Content-Type: text/plain
Date: 12 Nov 2002 17:17:41 -0700
Message-Id: <1037146661.32080.128.camel@beavis>
Mime-Version: 1.0
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

On Tue, 2002-11-12 at 15:24, Bjoern A. Zeeb wrote:
> On Tue, 12 Nov 2002, Ryan Bradetich wrote:
> 
> > Bjeorn,
> 
> nice try; second shot please ;-))

Oops... very sorry :(

> 
> > What type of system is this.  I am currently tracking down this problem
> > on the K460.  I know where the problem is caused, just not why yet.
> 
> model 9000/715

Cool.
> 
> this it were kernel starts joking ...
> 
> --- /etc/init.d/initrd-tools.sh ---
> [ -f /proc/mounts ] || {
> echo "still ok"
>         mount -n /proc || exit
>         trap 'umount -n /proc' EXIT
> }
> echo "never reached"
> --- ... ---

Interesting ... will dig further and see if I can get this fixed.

Thanks for the feedback.

- Ryan


> -- 
> Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
> 56 69 73 69 74				http://www.zabbadoz.net/
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
