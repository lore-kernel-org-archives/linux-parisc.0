Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 057484829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Sep 2002 00:23:21 -0600 (MDT)
Date: Thu, 26 Sep 2002 08:22:47 +0200
Message-ID: <3D8F011400000D7C@ocpmta2.be.tiscali.com>
In-Reply-To: <200209251847.30715.deller@gmx.de>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Failure when compile 2.4.19-pa20
To: "Helge Deller" <deller@gmx.de>,
	"Matthew Wilcox" <willy@debian.org>
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

>-- Original Message --
>From: Helge Deller <deller@gmx.de>
>To: Matthew Wilcox <willy@debian.org>,
> jsoe0708@tiscali.be
>Subject: Re: [parisc-linux] Failure when compile 2.4.19-pa20
>Date: Wed, 25 Sep 2002 18:47:30 +0200
>Cc: parisc-linux@lists.parisc-linux.org
>
>
>On Wednesday 25 September 2002 18:02, Matthew Wilcox wrote:
>> On Wed, Sep 25, 2002 at 05:56:08PM +0200, jsoe0708@tiscali.be wrote:
>> > I got USB part of .config from debian-configs/32 (I work on a b180)
and
>> > try to compile 2.4.19-pa20 but it failled:
>>
>> i'd guess you didn't select CONFIG_INPUT
>
>CONFIG_INPUT=y
>CONFIG_INPUT_EVDEV=y
>
>helge
>

That is may mistake (just take out off context a part of the .config file
:( )

Thanks a lot for attention and help,
    Joel
