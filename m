Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35CFF483E
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Jun 2003 04:43:10 -0600 (MDT)
Date: Wed, 4 Jun 2003 10:42:37 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] palo II
In-Reply-To: <Pine.BSF.4.53.0306021858520.1237@e0-0.zab2.int.zabbadoz.net>
Message-ID: <Pine.BSF.4.53.0306041039250.27036@e0-0.zab2.int.zabbadoz.net>
References: <Pine.BSF.4.53.0306011303040.1237@e0-0.zab2.int.zabbadoz.net>
 <200306011543.59335.deller@gmx.de> <Pine.BSF.4.53.0306011402580.1237@e0-0.zab2.int.zabbadoz.net>
 <20030602181451.GB31212@dsl2.external.hp.com>
 <Pine.BSF.4.53.0306021827240.1237@e0-0.zab2.int.zabbadoz.net>
 <Pine.BSF.4.53.0306021858520.1237@e0-0.zab2.int.zabbadoz.net>
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

On Mon, 2 Jun 2003, Bjoern A. Zeeb wrote:

Hi,

> g) here is the patch. Thanks I remember basic for the goto ;-)
> peherhaps ignore the part with the version number ...

well please - before commiting - verifiy ... I think there is a
problem maybe with some pointer ... Will have to verify all possible
paths ... going to re-check and let you know.

--- cut ---
/boot/vmlinux-2.5.69-pa1 74 00L 1X c 1Q root=/dev/sdb3 HOME=/ TERM=linux conso0
 0: 3/boot/vmlinux-2.5.69-pa1
 1: 74
 2: 00L
 3: 1X
 4: c
 5: 1Q
 6: root=/dev/sdb3
 7: HOME=/
 8: TERM=linux
 9: console=ttyS0

Edit which field?
(or 'b' to boot with this command line)?
--- cut ---

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
