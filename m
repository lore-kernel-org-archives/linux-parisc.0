Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 428074829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 04:05:28 -0600 (MDT)
Date: Wed, 25 Sep 2002 12:05:19 +0200
Message-ID: <3D8F01140000099E@ocpmta2.be.tiscali.com>
In-Reply-To: <3D8E3A0B.5090008@earthlink.net>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Mouse stops working when exiting KDE
To: "Bryan W. Headley" <bwheadley@earthlink.net>,
	"Joel Soete" <joel.soete@freebel.net>
Cc: "Derek Engelhaupt" <derekengelhaupt@rocketmail.com>,
	parisc-linux@lists.parisc-linux.org
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

Hi Brian,

>-- Original Message --
>Date: Sun, 22 Sep 2002 16:45:47 -0500
>From: "Bryan W. Headley" <bwheadley@earthlink.net>
>To: Joel Soete <joel.soete@freebel.net>
>CC: Derek Engelhaupt <derekengelhaupt@rocketmail.com>, 
> parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] Mouse stops working when exiting KDE
>
>
>Joel Soete wrote:
>
>>> I assume you are running the gpm mouse daemon as well. If you tell X

>>> to use the gpm mouse (/dev/gpmdata), you should be okay.
>> 
>> 
>> Hmm, long time ago I test this (because that was like this I configure
>
>> my i386 boxe) but it did not work. Does it work now on parisc?
>
>Last time I checked, it did.

Sorry, the last test I do on my b180 and gpmdata as mouse driver does not
work :)
(xfree86-4.1)

Hmm I just notice this funny behaviour:
I start gdm, I login -> the cursor work normaly :)
I quit my X session -> the cursor doesn't work any more ...
I would like to see at the console if I can see some error messages, so I
swich to sti mode (CTRL+ALT f1)... ok that works. No error messages, so I
can come back to gdm login screen (CTRL+ALT f7), oh the cursor move again
normaly ?

Any idea?

Thanks in advance,
    Joel

PS: kernel 2.4.18-pa61 + apt-get dist_upgrade this 2002-09-24
