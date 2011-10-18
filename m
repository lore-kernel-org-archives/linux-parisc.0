From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Tue, 18 Oct 2011 11:31:28 +0200
Message-ID: <CAGH6_po8U2DXi9x7zQZuU7YAOw-MNhC=kGDC8gJ=rBqtwMPmpA@mail.gmail.com>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
	<20111017152358.GA3518@glitch>
	<CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com>
	<4E9C6F9E.5000605@bell.net>
	<4E9C9643.6030309@systemhalted.org>
	<4E9C9971.5090806@bell.net>
	<20111017215734.GA28681@glitch>
	<BLU0-SMTP3369C2E5C7F1EBE9C97C5B97E40@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=bcaec520e81750d82b04af8f6387
Cc: "Carlos O'Donell" <carlos@systemhalted.org>, debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <BLU0-SMTP3369C2E5C7F1EBE9C97C5B97E40@phx.gbl>
Resent-Message-ID: <XLEMoHKhhpJ.A.pWB.UeUnOB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

--bcaec520e81750d82b04af8f6387
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 18, 2011 at 12:28 AM, John David Anglin <dave.anglin@bell.net>wrote:

>
> On 17-Oct-11, at 5:57 PM, Domenico Andreoli wrote:
>
>  On Mon, Oct 17, 2011 at 05:09:05PM -0400, John David Anglin wrote:
>>
>>> On 10/17/2011 4:55 PM, Carlos O'Donell wrote:
>>>
>>>> On 10/17/2011 2:10 PM, John David Anglin wrote:
>>>>
>>>>> On 10/17/2011 11:47 AM, Carlos O'Donell wrote:
>>>>>>
>>>>>>> The test-fork1 failure is still unexplained and happens
>>>>>>>> intermittently.
>>>>>>>>
>>>>>>> I have built a lot of unstable on my rp3440.  I think this
>>>>>>>
>>>>>> one causes failures in the thread
>>>>>
>>>>>> testsuites of perl, python2.7 and glib2.0.  These are characterized by
>>>>>> tests hanging.
>>>>>>
>>>>>>> There is another class of failures.  They typically cause
>>>>>>>
>>>>>> my rp3440 to crash due
>>>>>
>>>>>> to cache corruption.  The GCC libgomp and libatomic-ops testsuite seem
>>>>>> to trigger
>>>>>> this one.  As I have mentioned, it's the libgomp "for" tests that
>>>>>>
>>>>>>>
>>>>>>>> The cancellation issues happen in tst-cancel*.
>>>>>>>>
>>>>>>>> I believe the cancellation issues are toolchain issues and I need to
>>>>>>>> look into them.
>>>>>>>>
>>>>>>> Possibly, this is related to the following bug that I found last week
>>>>>> building mpfr-3.1.0:
>>>>>> http://gcc.gnu.org/bugzilla/**show_bug.cgi?id=50691<http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50691>
>>>>>> A call to __tls_get_addr clobbers first argument of call to
>>>>>> mpfr_cache.  Don't have a
>>>>>> fix at the moment, but there is a simple testcase.
>>>>>>
>>>>>>> On a different subject, I tried to get udev-172-1 working.
>>>>>>>
>>>>>> However, this breaks bootstrap
>>>>>
>>>>>> due to an invalid argument in a call to inotify_init.  It's somewhat
>>>>>> timing dependent since
>>>>>> some kernels will boot if they build enough of /dev before udev messes
>>>>>> up.  In any case,
>>>>>> I believe that Guy Martin posted a patch a year or so ago to correct
>>>>>> an inconsistency
>>>>>> between the glibc and the kernel for some bit definitions.  I'm
>>>>>> thinking this may fix the
>>>>>> udev problem.
>>>>>>
>>>>> What patch is this? I don't remember it. URL?
>>>>
>>>>  http://www.cygwin.com/ml/libc-**ports/2010-08/msg00001.html<http://www.cygwin.com/ml/libc-ports/2010-08/msg00001.html>
>>>
>>
>> http://bugs.debian.org/cgi-**bin/bugreport.cgi?bug=617973<http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=617973>
>>
>>  dave@mx3210:~$ dpkg -l libc6
> Desired=Unknown/Install/**Remove/Purge/Hold
> | Status=Not/Inst/Conf-files/**Unpacked/halF-conf/Half-inst/**
> trig-aWait/Trig-pend
> |/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
> ||/ Name           Version        Description
> +++-==============-===========**===-==========================**
> ==================
> ii  libc6          2.13-10        Embedded GNU C Library: Shared libraries
>
> Bug was supposed to be fixed in 2.13-0exp4...
>
> This is the console output:
>
> ...
> Loading, please wait...
> mount: mounting udev on /dev failed: No such device
> W: devtmpfs not available, falling back to tmpfs for /dev
> udevd[834]: inotify_init failed: Invalid argument
> udevd[834]: error initializing inotify
> Begin: Loading essential drivers ... SCSI subsystem initialized done.
> Begin: Running /scripts/init-premount ... done.
> Begin: Mounting root file system ...
> Begin: Running /scripts/local-top ... done.
> Begin: Waiting for root file system ... done.
> Gave up waiting for root device. Common problems:
>  - Boot args (cat /proc/cmdline)
>    - Check rootdelay= (did the system wait long enough?)
>    - Check root= (did the system wait for the right device?)
>  - Missing modules (cat /proc/modules; ls /dev)
> chvt: can't open console
> ALERT! /dev/sda5 does not exist. Dropping to a shell!
>
> BusyBox v1.18.4 (Debian 1:1.18.4-1) built-in shell (ash)
> Enter 'help' for a list of built-in commands.
>
> /bin/sh: can't access tty; job control turned off
> (initramfs)
>

Unfortunately I've never been able to build eglibc with the supposed fix,
indeed I'm running an hacked udev on libc 2.11.something.

BTW, how did you successfully build it? you said you build a good part of
unstable, I would like to do the same and maybe upload some key packages...

Regards,
Domenico

--bcaec520e81750d82b04af8f6387
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Oct 18, 2011 at 12:28 AM, John David Ang=
lin <span dir=3D"ltr">&lt;<a href=3D"mailto:dave.anglin@bell.net">dave.angl=
in@bell.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div><div></div><div class=3D"h5"><br>
On 17-Oct-11, at 5:57 PM, Domenico Andreoli wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Mon, Oct 17, 2011 at 05:09:05PM -0400, John David Anglin wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 10/17/2011 4:55 PM, Carlos O&#39;Donell wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 10/17/2011 2:10 PM, John David Anglin wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On 10/17/2011 11:47 AM, Carlos O&#39;Donell wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
The test-fork1 failure is still unexplained and happens intermittently.<br>
</blockquote>
I have built a lot of unstable on my rp3440. =A0I think this<br>
</blockquote></blockquote>
one causes failures in the thread<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
testsuites of perl, python2.7 and glib2.0. =A0These are characterized by te=
sts hanging.<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
There is another class of failures. =A0They typically cause<br>
</blockquote></blockquote>
my rp3440 to crash due<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
to cache corruption. =A0The GCC libgomp and libatomic-ops testsuite seem to=
 trigger<br>
this one. =A0As I have mentioned, it&#39;s the libgomp &quot;for&quot; test=
s that<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
The cancellation issues happen in tst-cancel*.<br>
<br>
I believe the cancellation issues are toolchain issues and I need to<br>
look into them.<br>
</blockquote></blockquote>
Possibly, this is related to the following bug that I found last week build=
ing mpfr-3.1.0:<br>
<a href=3D"http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D50691" target=3D"_=
blank">http://gcc.gnu.org/bugzilla/<u></u>show_bug.cgi?id=3D50691</a><br>
A call to __tls_get_addr clobbers first argument of call to mpfr_cache. =A0=
Don&#39;t have a<br>
fix at the moment, but there is a simple testcase.<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On a different subject, I tried to get udev-172-1 working.<br>
</blockquote></blockquote>
However, this breaks bootstrap<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
due to an invalid argument in a call to inotify_init. =A0It&#39;s somewhat =
timing dependent since<br>
some kernels will boot if they build enough of /dev before udev messes up. =
=A0In any case,<br>
I believe that Guy Martin posted a patch a year or so ago to correct an inc=
onsistency<br>
between the glibc and the kernel for some bit definitions. =A0I&#39;m think=
ing this may fix the<br>
udev problem.<br>
</blockquote></blockquote>
What patch is this? I don&#39;t remember it. URL?<br>
<br>
</blockquote>
<a href=3D"http://www.cygwin.com/ml/libc-ports/2010-08/msg00001.html" targe=
t=3D"_blank">http://www.cygwin.com/ml/libc-<u></u>ports/2010-08/msg00001.ht=
ml</a><br>
</blockquote>
<br>
<a href=3D"http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D617973" targe=
t=3D"_blank">http://bugs.debian.org/cgi-<u></u>bin/bugreport.cgi?bug=3D6179=
73</a><br>
<br>
</blockquote></div></div>
dave@mx3210:~$ dpkg -l libc6<br>
Desired=3DUnknown/Install/<u></u>Remove/Purge/Hold<br>
| Status=3DNot/Inst/Conf-files/<u></u>Unpacked/halF-conf/Half-inst/<u></u>t=
rig-aWait/Trig-pend<br>
|/ Err?=3D(none)/Reinst-required (Status,Err: uppercase=3Dbad)<br>
||/ Name =A0 =A0 =A0 =A0 =A0 Version =A0 =A0 =A0 =A0Description<br>
+++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<u></u>=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
ii =A0libc6 =A0 =A0 =A0 =A0 =A02.13-10 =A0 =A0 =A0 =A0Embedded GNU C Librar=
y: Shared libraries<br>
<br>
Bug was supposed to be fixed in 2.13-0exp4...<br>
<br>
This is the console output:<br>
<br>
...<br>
Loading, please wait...<br>
mount: mounting udev on /dev failed: No such device<br>
W: devtmpfs not available, falling back to tmpfs for /dev<br>
udevd[834]: inotify_init failed: Invalid argument<br>
udevd[834]: error initializing inotify<br>
Begin: Loading essential drivers ... SCSI subsystem initialized done.<br>
Begin: Running /scripts/init-premount ... done.<br>
Begin: Mounting root file system ...<br>
Begin: Running /scripts/local-top ... done.<br>
Begin: Waiting for root file system ... done.<br>
Gave up waiting for root device. Common problems:<br>
=A0- Boot args (cat /proc/cmdline)<br>
 =A0 =A0- Check rootdelay=3D (did the system wait long enough?)<br>
 =A0 =A0- Check root=3D (did the system wait for the right device?)<br>
=A0- Missing modules (cat /proc/modules; ls /dev)<br>
chvt: can&#39;t open console<br>
ALERT! /dev/sda5 does not exist. Dropping to a shell!<br>
<br>
BusyBox v1.18.4 (Debian 1:1.18.4-1) built-in shell (ash)<br>
Enter &#39;help&#39; for a list of built-in commands.<br>
<br>
/bin/sh: can&#39;t access tty; job control turned off<br>
(initramfs)<br></blockquote><div><br>Unfortunately I&#39;ve never been able=
 to build eglibc with the supposed fix, indeed I&#39;m running an hacked ud=
ev on libc 2.11.something. <br><br>BTW, how did you successfully build it? =
you said you build a good part of unstable, I would like to do the same and=
 maybe upload some key packages... <br>
<br>Regards,<br>Domenico<br></div></div><br>

--bcaec520e81750d82b04af8f6387--
