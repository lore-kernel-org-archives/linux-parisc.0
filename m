Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC369483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Sep 2002 09:21:00 -0600 (MDT)
Message-ID: <3D8DEF0E.3070601@freebel.net>
Date: Sun, 22 Sep 2002 16:25:50 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Joel Soete <joel.soete@freebel.net>
Cc: "Bryan W. Headley" <bwheadley@earthlink.net>,
	Derek Engelhaupt <derekengelhaupt@rocketmail.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mouse stops working when exiting KDE
References: <20020921220317.3256.qmail@web12502.mail.yahoo.com> <3D8D0454.40706@earthlink.net> <3D8DCD8D.8070300@freebel.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Oops so old: 
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-October/014145.html 


Well IIRC, at this time I encounter a problem with Xfree86 config (a 
change in stifb (kernel 2.4.9-pa57) required that the screen mode match 
exactly the hw definition) but it was also the first time that I test 
xdm (previously I only used startx).

Joel

Joel Soete wrote:
> 
> 
> Bryan W. Headley wrote:
> 
>> Derek Engelhaupt wrote:
>>
>>> Hey all,
>>>
>>> Currently when my system boots up the X11 login window starts up
>>> automatically and I can log in and use it normally, but when I log out
>>> the mouse quits working.  The X11 login window appears again, but the
>>> mouse won't move anymore.  I'm just using a standard PS/2 HP 3 button
>>> mouse - nothing fancy on my C180.  Also, why is it that Konqueror won't
>>> do https sites?  And if it will what could possibly be the problem with
>>> that?  Thanks.
>>
>>
>>
>> I assume you are running the gpm mouse daemon as well. If you tell X 
>> to use the gpm mouse (/dev/gpmdata), you should be okay.
> 
> 
> Hmm, long time ago I test this (because that was like this I configure 
> my i386 boxe) but it did not work. Does it work now on parisc?
> 
>> Personally, I just turn off the gpm daemon, because I don't need a 
>> mouse in console mode.
>>
>> (It's not a parisc-only bug: I see this on virtually every Debian 
>> platform)
>>
> with kde ?
> 
> Because with the same software config (gdm + xfce + xfree86-4.1) the 
> same problem occurs on my parisc (b180) and not on my i386 (on which I 
> also use /dev/psaux as mouse device)?
> 
> (sorry (I would be of better help) I never have time to investigate in 
> more details this problem. And I do not remember exactly if it was 
> always there or if it appears with a new release of xfree86 or with a 
> new kernel release? Is some one can refresh my memory?)
> 
> Joel
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
