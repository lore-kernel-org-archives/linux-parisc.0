Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id E1E404829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 00:52:40 -0600 (MDT)
Date: Wed, 4 Sep 2002 08:45:39 +0200
Message-ID: <3D3815BD0000B3C0@ocpmta5.be.tiscali.com>
In-Reply-To: <200209032044.g83KiS0d008279@hiauly1.hia.nrc.ca>
From: jsoe0708@tiscali.be
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@dsl2.external.hp.com, joel.soete@freebel.net,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] Re: Unaligne access [was: Back to evms-1.0.1 && unaligne access && gdb ]
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

Dave,
>
>
>> >then I'll wager there is padding between the char and int fields
>> >of that struct.
>> 
>> That is also what I believe to understand.
>
>Unlikely.  The unaligned trap handler in the kernel is probably
>fixing the unaligned access.  You need to look in the kernel log
>to see if this is happening.
>
Nothing to notice about unalign access kernel trap in any /var/log files
(with checks.c.new) Is there some "debug" #define to set to increase verbosity
of this trap?

Thanks a lot,
    Joel
