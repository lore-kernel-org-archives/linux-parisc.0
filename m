Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 785504829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 03:52:09 -0700 (MST)
Date: Fri, 10 Jan 2003 11:51:41 +0100
Message-ID: <3E1AA8D500000902@ocpmta8.freegates.net>
In-Reply-To: <20030110073659.GC31470@tausq.org>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] unaligned accesses
To: "Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>-- Original Message --
>Date: Thu, 9 Jan 2003 23:36:59 -0800
>From: Randolph Chung <randolph@tausq.org>
>To: jsoe0708@tiscali.be
>Cc: parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] unaligned accesses
>Reply-To: Randolph Chung <randolph@tausq.org>
>
>
...
>
>> hmmm buggy: not always, the triky case is when you have to access to
those
>> kind of data encapsulated into a structure. I do not yet find any work=
around
>> or how to fix this kind of pb. Any idea (gcc-3.3?)?
>
>eh? what do you mean? 

Sorry, I met well a problem of unaligne access problem with fsck.jfs (wit=
h
kernel 2.4.19-pa24+jfs 1.0.23 support):
...
fsck.jfs(6995): unaligned access to 0xfaf00757 at ip=3D0x0002ee1b
fsck.jfs(6995): unaligned access to 0xfaf00757 at ip=3D0x0002ee37
fsck.jfs(6995): unaligned access to 0xfaf00757 at ip=3D0x0002ed3f
...

which occurs in fsckmsgs.c for ip=3D0x0002ee1b (for exapmple) at:

        strncpy(prlimit, msgprms[prmidx], prmval[prmidx]);
with 
...
extern char *msgprms[];
...
   int prmidx;
...    
   int16_t *prmval;

So it is not related with the struct problem I encounter.

I will try to find back this example.

Joel

PS:  with ext3 (which I use) problem I hesitate to install 2.4.20 and wai=
ting
for 2.4.21 and evms, jfs, xfs support for this system)

********************************************
Promo Tiscali ADSL: 35 Euros/mois, 1er mois et activation =3D 0 Euro http=
://adsl.tiscali.be
