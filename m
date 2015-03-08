From: Geoff Matthews <g.j.matthews@gmail.com>
Subject: Re: Pre-DEBIAN 8.0 install images for HPPA architecture (debian-ports
 unstable release)
Date: Mon, 9 Mar 2015 09:21:40 +1100
Message-ID: <CAJHT4_S3UNiXC5xqAgcAcGTP5xsQ4kanbQq-Oso=kB5+3DtAvA@mail.gmail.com>
References: <54ECB150.80907@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a1147a4507c0b080510ce5798
Cc: HPPA porters <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <54ECB150.80907@gmx.de>
Resent-Message-ID: <NjQw1L4F61.A.UHE.R-M_UB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <http://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

--001a1147a4507c0b080510ce5798
Content-Type: text/plain; charset=UTF-8

Hi Helge et al,

I have tried this Debian 8.0 installation on a spare HD in my C3700. The
installer is painless & "runs like a Swiss watch". I had no trouble
installing a KDE desktop environment and booting it. The software
repository and the packages downloaded gave no trouble at all. The base OS
has been rock solid. I have installed boinc/seti@home and that has had the
box at 100% CPU load all night without trouble. Some packages have been a
bit slow/clunky but given the age of the C3700 that is no surprise.

The only package to consistently crash was "system settings" any time I
tried to change display settings. The base OS has not crashed AT ALL.

Cheers, Geoff.

On Wed, Feb 25, 2015 at 4:13 AM, Helge Deller <deller@gmx.de> wrote:

> Hello everyone,
>
> I've prepared some initial netboot installation medias for
>         DEBIAN 8.0 on HPPA
>
> which are available at:
>         http://ftp.debian-ports.org/debian-cd/hppa/debian-8.0/
>
> You can find the instructions on how to install Debian 8.0 on hppa in our
> wiki at
>         https://parisc.wiki.kernel.org/index.php/Debian_Ports_Installation
>
> The install images will install binaries from debian-ports (Debian
> "unstable").
>
> Major changes include:
> - Based on Debian 8.0 code base
> - Full systemd support
> - Linux kernel modules for SATA included
> - Lots of bug fixes
> - Should support all common PA-RISC hardware (on C8000 installation needs
> to be done via serial port)
>
> I'm happy to get your feedback (either as bug report or successful
> installation report).
>
> Helge
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a1147a4507c0b080510ce5798
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Helge et al,<br><br></div>I have tried this D=
ebian 8.0 installation on a spare HD in my C3700. The installer is painless=
 &amp; &quot;runs like a Swiss watch&quot;. I had no trouble installing a K=
DE desktop environment and booting it. The software repository and the pack=
ages downloaded gave no trouble at all. The base OS has been rock solid. I =
have installed boinc/seti@home and that has had the box at 100% CPU load al=
l night without trouble. Some packages have been a bit slow/clunky but give=
n the age of the C3700 that is no surprise.<br><br></div><div>The only pack=
age to consistently crash was &quot;system settings&quot; any time I tried =
to change display settings. The base OS has not crashed AT ALL.<br></div><d=
iv><br></div>Cheers, Geoff.<br></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Wed, Feb 25, 2015 at 4:13 AM, Helge Deller <span dir=
=3D"ltr">&lt;<a href=3D"mailto:deller@gmx.de" target=3D"_blank">deller@gmx.=
de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello everyone,<=
br>
<br>
I&#39;ve prepared some initial netboot installation medias for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEBIAN 8.0 on HPPA<br>
<br>
which are available at:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://ftp.debian-ports.org/debian-c=
d/hppa/debian-8.0/" target=3D"_blank">http://ftp.debian-ports.org/<u></u>de=
bian-cd/hppa/debian-8.0/</a><br>
<br>
You can find the instructions on how to install Debian 8.0 on hppa in our w=
iki at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://parisc.wiki.kernel.org/index=
.php/Debian_Ports_Installation" target=3D"_blank">https://parisc.wiki.kerne=
l.<u></u>org/index.php/Debian_Ports_<u></u>Installation</a><br>
<br>
The install images will install binaries from debian-ports (Debian &quot;un=
stable&quot;).<br>
<br>
Major changes include:<br>
- Based on Debian 8.0 code base<br>
- Full systemd support<br>
- Linux kernel modules for SATA included<br>
- Lots of bug fixes<br>
- Should support all common PA-RISC hardware (on C8000 installation needs t=
o be done via serial port)<br>
<br>
I&#39;m happy to get your feedback (either as bug report or successful inst=
allation report).<br>
<br>
Helge<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-parisc=
&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org" targe=
t=3D"_blank">majordomo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" target=3D"_blank">http://vger.kernel.org/<u></u>majordomo-info.htm=
l</a><br>
</blockquote></div><br></div>

--001a1147a4507c0b080510ce5798--
