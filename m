From: "SteX" <stefano.melchior@fastwebnet.it>
Subject: RE: no login with 2.6 kernel and Mozilla probs on 712/60
Date: Wed, 26 May 2004 11:39:32 +0200
Message-ID: <4096D40D000224BF__3991.81378675184$1416623460$gmane$org@ms001msg.mail.fw>
References: <BAY1-F109SYgkkpNnPd0002f227@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <BAY1-F109SYgkkpNnPd0002f227@hotmail.com>
Resent-Message-ID: <EDI0I.A.uoE.bXGtAB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

Hi Kenneth,

>>have a look in the /boot/config-xxx to find the HIL support whether you=

>>use an HIL kbd and mouse. As far as I know HIL is supported from the 2.=
4x
>>kernel for about 2 years, so it sounds strange.
>>If you use a common PS2 kbd have a look in the /etc/X11/XF86Config-4 to=

>>see if the kbd is correctly set.
>Nono. A 712 doesn't have any HIL, simple PS/2. And I'm not using XDM to

>login. Plain console.

It happened to me, when I launced PALO with the STI support. Not whether
I connected my laptop with a serial cable. The login didn't appear and th=
e
system seemed to hang. Verify the same situation by connecting another sy=
stem
via console cable and minicom.


>Is there ongoing parisc support/development for the 2.4.x series, or are=

>you guys only focussing on the 2.6?

The development is in both way, why un-support a still valid kernel, as
2.4. Why neither support a new 2.6 kernel. It is not a fork!

Regards

SteX
