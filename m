From: "Kenneth Westelinck" <kennywest1@hotmail.com>
Subject: RE: no login with 2.6 kernel and Mozilla probs on 712/60
Date: Wed, 26 May 2004 09:08:10 +0000
Message-ID: <BAY1-F109SYgkkpNnPd0002f227__24999.163641087$1416623459$gmane$org@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1;
  format=flowed
To: stefano.melchior@fastwebnet.it,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <6dIOwD.A.b_G.E6FtAB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

>have a look in the /boot/config-xxx to find the HIL support whether you
>use an HIL kbd and mouse. As far as I know HIL is supported from the 2.4x
>kernel for about 2 years, so it sounds strange.
>If you use a common PS2 kbd have a look in the /etc/X11/XF86Config-4 to
>see if the kbd is correctly set.
Nono. A 712 doesn't have any HIL, simple PS/2. And I'm not using XDM to 
login. Plain console.

>There is no need to use unstable instead of testing!
Ok, thanks for that.

> >The reason I was upgrading to 2.6 is because Mozilla (and Galeon) were
>
> >segfaulting on my older 2.4.20 kernel.  Are there any people on the list
> >successfully running Mozilla on Woody?
>
>Why didn't you use a 2.4.24 or 2.4.26 kernel, which is good for almost all
>the *old* or *not pretty recent* ws with supported graphics card?
Ok, I'll try that one, there's nothing broken yet. I successfully rolled 
back to the old situation ;)
Is there ongoing parisc support/development for the 2.4.x series, or are you 
guys only focussing on the 2.6?


regards,

Kenneth

_________________________________________________________________
Plannen om een nieuwe computer te kopen? Kijk eens hier.. 
http://www.msn.be/shopping/dell_bis/


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
