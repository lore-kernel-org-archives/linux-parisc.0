Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D31B4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 15:28:30 -0700 (MST)
Date: Tue, 12 Nov 2002 22:24:36 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Ryan Bradetich <rbrad@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] My System ate a SPARC! *haha* 8-(
In-Reply-To: <20021112205942.GA7777@beavis.ybsoft.com>
Message-ID: <Pine.BSF.4.44.0211122148260.39295-100000@e0-0.zab2.int.zabbadoz.net>
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

On Tue, 12 Nov 2002, Ryan Bradetich wrote:

> Bjeorn,

nice try; second shot please ;-))


> What type of system is this.  I am currently tracking down this problem
> on the K460.  I know where the problem is caused, just not why yet.

model 9000/715


this it were kernel starts joking ...

--- /etc/init.d/initrd-tools.sh ---
[ -f /proc/mounts ] || {
echo "still ok"
        mount -n /proc || exit
        trap 'umount -n /proc' EXIT
}
echo "never reached"
--- ... ---

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
