Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm6.tiscalinet.be [212.35.2.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D0C04834
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Oct 2002 00:05:05 -0600 (MDT)
Date: Fri, 25 Oct 2002 08:04:49 +0200
Message-ID: <3DB5755500000A1B@ocpmta7.be.tiscali.com>
In-Reply-To: <20021024190027.GF5602@tausq.org>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Re: mkfs.xfs (xfsprogs-2.3.5) failled
To: "Randolph Chung" <randolph@tausq.org>,
	"Stefan Pfetzing" <dreamind@dreamind.de>
Cc: parisc-linux@lists.parisc-linux.org
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
>> Hm, maybe, it has been a while since I updated that machine.
>> 
>> 2.4.19-pa9-xfs is running there.
>
>what machine was this on? is this a 32-bit or 64-bit kernel?
>
For my part it is 2.4.19-pa22 [32bits] (on a b180l)

I do think that BLGKETSIZE64 (in put_user and get_user) is well supported
in 64bits kernel but the job still have to do on 32bits kernel (?)

Thanks for attention and help,
    Joel
