Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 306B24829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 13 Jan 2003 03:19:54 -0700 (MST)
Date: Mon, 13 Jan 2003 11:19:40 +0100
Message-ID: <3E1AA7C100000EF1@ocpmta7.freegates.net>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Issues with seteuid()?
To: "Randolph Chung" <tausq@debian.org>,
	"Matthew Wilcox" <willy@debian.org>
Cc: "Luigi Gangitano" <luigi@debian.org>,
	parisc-linux@lists.parisc-linux.org
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

Hi Randolph,

Being the author of bug report (and some other request on this ml about
subject), unfortunately I do not have test case. But what I can do is to
explain all what I did. I just grab squid-2.4.7-1 (hope still exist) and
rebuild as it is (check in rules that ac_cv_func_setresuid=3Dno).

Installed it and disabled the startup script (in case of reboot, it risks=

to make boot very slow).

I already noticed that the install procedure failled to create the spool
dir; dmesg would have to confirm you that squid do a segv. [ and there wa=
s
no squid process ]

What failled? In fact, the install script launched 'squid -z'.
It was interesting to launch it manually; the reason of the SEGV was more=

complete: fork failled because not enough memory available??

Well fork() failed... Searching in sources (MANY THANKS to RMS for FSF sp=
irit)
I find the place where fork() is used and what happened just before: acco=
rding
to configure param, it do first a setgroups(), setgid() then (in this cas=
e)
a seteuid() (function leave_suid() in src/tools.c).

So the problem seems to came from a kind of su. And I re-read Bach UNIX
bible to remember that one of the first think that do a su is to verify
that user memory is enough. In this case it considered that it was not th=
e
case?

So I tried to check if a real su presents the same problem. I let first
read access to the world for /etc/squid.conf (just for the test) and as
in the startup script 'ulimit -n 5120' (for example) then 'su - proxy'.

'ulimit -a' seems Ok.
Now, always as proxy user, relaunch 'squid -z' and ... it works.

I could be now quiet sure that the problem came from the setgroups(), set=
gid(),
seteuid(), fork() sequence used to switch user. Agree?

I first checked the value of the paramters transmitted to the seteuid()
which seem ok.

As I saw that the developper of squid foreseen other procedure to su, I
did so first investigate to use setreuid() (which seems to me also more
secure but I should be wrong?). As it was available, I test it and solved=

all the squid problem encounter since the begining: the creation of the
spool dir was now ok and the server worked fine. That is this final concl=
usion
that I transmitted as bug report near squid maintainer.

On this mailing list my question (<http://lists.parisc-linux.org/pipermai=
l/parisc-linux/2003-January/018801.html>)
was a bit wilder (I thought but wrongly):
is it a seteuid() [glic ?] or a fork() [kernel ?] problem?

Well that is only a summary a many other investigation and I hope this he=
lp
but if something is not clear or some other test would help you do not he=
sitate
to let me know,

Cheers,
    Joel


->> I wonder how it can be a problem at all.  The kernel ilements only
>> sys_setresuid() and i would imagine that glibc implements both
>> seteuid() and setresuid() in terms of this system call.
>>
>> Perhaps someone who's willing to touch glibc would care to comment?
>
>seteuid() works fine in simple tests. i don't think it's seteuid...
>something else is broken. can someone provide a simple test case for the=

>segfault?
>
>randolph
>--
>Randolph Chung
>Debian GNU/Linux Developer, hppa/ia64 ports
>http://www.tausq.org/
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
