Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.itp.bg (itp.solo.bg [212.72.196.10])
	by dsl2.external.hp.com (Postfix) with SMTP id B1E35483A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Jul 2002 03:16:19 -0600 (MDT)
Date: Sun, 14 Jul 2002 12:17:46 +0300
From: "Stephan Trajkoff" <stephan@itp.bg>
To: Ralf.Hildebrandt@charite.de
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: Re: [parisc-linux] STI framebuffer and PINE
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <20020714091619.B1E35483A@dsl2.external.hp.com>
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

I don't know if my STI can run more colours. I have no documentation=20
for my server
./build slx and ./build lnx is commands for compiling pine
before compiling PINE i did apt-get dist-upgrade
but again PINE package can't compile, only pico and pilot works, not=20
pine=20
PINE in hppa dist is only avalailable as source, not binary
my clients want pine, not mutt



-------- Original Message --------

=3D=3D> From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
=3D=3D> Date: Sun, 14 Jul 2002 10:12:41  0200

On Sun, Jul 14, 2002 at 09:52:30AM  0300, Stephan Trajkoff wrote:

> STI GSC/PCI graphics driver version 0.9 > STI word mode ROM at=20
f0060000, hpa at f4000000 > STI id 2b4ded6d-40a00499, conforms to
spec=20
rev. 8.04 > STI device: HPA208LC1280 > Console: switching to colour=20
frame buffer device 160x64 > fb0: stifb 1280x1024-8 frame buffer=20
device, id: 2b4ded6d, mmio: > 0xf4100000 > I have this shit, can=20
anyone help me to run XFREE in 15,16,24 or 32 > bit color? > my HP is=20
819/K210

Are you sure the framebuffer can run at more colors? I don't find
this=20
on http://docs.hp.com/hpux/hw/ !

> Another problem how I can run PINE? > I have downloaded with apt-get=20
pine 4.44

apt-get install pine

but pine is junk anyway. Try mutt.

> ./build lnx and ./build slx don't work

What is this?

> there is an error in PINE

Then report it using

reportbug pine

> before compiling pine, I did apt-get dist-upgrade

You compiled pine? I though you used apt-get?!

-- Ralf Hildebrandt (Im Auftrag des Referat V A)=20=20=20
Ralf.Hildebrandt@charite.de Charite Campus Virchow-Klinikum=20=20=20=20=20=
=20=20=20=20=20=20
      Tel.   49 (0)30-450 570-155 Referat V A - Kommunikationsnetze -=20
            Fax.   49 (0)30-450 570-916 If JavaScript is walking
alone=20
late at night through a bad part of town with a pocket full of $20=20
bills, ActiveX is dropping your trousers in the middle of the yard of=20
a maximum-security prison, bending over, and yelling 'Come and get
it,=20
boys!'=20

_______________________________________________ parisc-linux mailing=20
list parisc-linux@lists.parisc-linux.org=20
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux=20

-------------------------------------------------------------------
-->> Add WEB ACCESS to your POP email accounts with
-->> FREE Perl CGI scripts! Download today! http://www.adjeweb.com
-------------------------------------------------------------------
