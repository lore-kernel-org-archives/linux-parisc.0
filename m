Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0226A4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 13:45:55 -0700 (MST)
Date: Sat, 9 Nov 2002 20:45:48 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5.46-pa7 boot prob
In-Reply-To: <20021109201144.GW9563@tausq.org>
Message-ID: <Pine.BSF.4.44.0211092040150.32930-100000@e0-0.zab2.int.zabbadoz.net>
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

On Sat, 9 Nov 2002, Randolph Chung wrote:

> > If you need more information please let me know.
>
> In general, a System.map file that corresponds to your kernel is also
> needed.

you can find it on:

http://www.zabbadoz.net/zabbadoz-network/apollo/linux-testing/

http://www.zabbadoz.net/zabbadoz-network/apollo/linux-testing/System.map-2.5.46-pa7
http://www.zabbadoz.net/zabbadoz-network/apollo/linux-testing/config-2.5.46-pa7

and full startup log from serial console:

http://www.zabbadoz.net/zabbadoz-network/apollo/linux-testing/apollo-2.5.46-pa7.01

> from the reg dump:
>
> > r20-23  00000000 00000000 10029c60 00000001
> >  IIR: 0ea01085    ISR: 00000000  IOR: 00000000
>
> it's a null ptr deref...
> faulting insn is: ldw 0(sr0,r21),r5
> and r21 is 0...
>
> can you either supply a System.map, or look up the
> "iaoq" and "r02" addresses in the register dump and see which function
> they are in?

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
