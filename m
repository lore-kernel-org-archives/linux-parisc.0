Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id C34074829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 00:16:02 -0600 (MDT)
Date: Mon, 23 Sep 2002 08:18:38 +0200
Message-ID: <3D89CCF000000449@ocpmta6.be.tiscali.com>
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
>Last time I checked, it did. Debconf and I have a difference of opinion

>about it's overwriting XF86Config-4 after I hand-edit it. So and X 
>upgrade arrives, and the config file gets overwritten. :-)
>
>>>
>> with kde ?
>
>No, I've seen it with Gnome also, on: alpha, ppc, sparc, and i386.
>
>> 
>> Because with the same software config (gdm + xfce + xfree86-4.1) the 
>> same problem occurs on my parisc (b180) and not on my i386 (on which I
>
>> also use /dev/psaux as mouse device)?
>> 
>
>But, IS gpm running? 

Yes on both machine

>Both it and the X server are trying to grab events 
>from /dev/psaux...
>
>> (sorry (I would be of better help) I never have time to investigate in
>
>> more details this problem. And I do not remember exactly if it was 
>> always there or if it appears with a new release of xfree86 or with a

>> new kernel release? Is some one can refresh my memory?)
>
>Seen it on X 4.0, 4.1 and 4.2. So I'd say it's not kernel-related.
>
Ha Ok

Thanks for info, (I will try to fond time for additional test)
    Joel
