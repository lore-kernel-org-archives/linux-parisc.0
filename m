Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 349CC4890
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 09:33:31 -0700 (MST)
Date: Fri, 6 Feb 2004 17:12:29 +0100
Message-ID: <40218AE200001791@ocpmta2.freegates.net>
In-Reply-To: <00a901c3ecc8$50ef9a00$8100a8c0@punk>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Additions - Install GNOME on 712/80
To: "Jens Simmoleit" <simmel@anymotion.de>, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Jens,

>1. My mouse won't work too *argh*

2. that is why you couldn't login with your user (i presume not root) :)

X absolutely need a mouse pointer :(

iirc you should have this entry in your XF86config-4 file:
Section "InputDevice"
        Identifier      "Configured Mouse"
        Driver          "mouse"
        Option          "CorePointer"
        Option          "Device"                "/dev/psaux"
        Option          "Protocol"              "PS/2"
EndSection

Check that /dev/psaux was well created, should look like:
# ll /dev/psaux
crw-------    1 root     root      10,   1 Mar 15  2002 /dev/psaux

(if you build your own kernel check that its support is in the kernel)


 and that gpm is not running (would not disable X to start but well trouble
the behaviour of cursor).

Hth,
    Joel

PS: can you also mentioned which kernel are you using 

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
