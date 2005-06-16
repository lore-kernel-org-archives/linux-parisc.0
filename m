From: "J. L. Lee" <jllee@singnet.com.sg>
Subject: UPDATE ON "Problems in getting X-Windows to run on HP
  Visualize 785/B2000 with rebuilt 2.6.12-rc6-pa1 kernel and Matrox
  Millennum II"
Date: Fri, 17 Jun 2005 02:47:14 +0800
Message-ID: <5.1.1.6.1.20050617024214.02edb990__13051.9232167446$1416623804$gmane$org@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii";
  format=flowed
To: <debian-hppa@lists.debian.org>,
 <parisc-linux@lists.parisc-linux.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <OWeeZD.A.pwH.0lcsCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

Hi All,

I got X Windows running on my B2000 now.

Thanks to the info provided by Max Grabert, all I needed to do was changing 
the video driver from "mga" to "fbdev" in the XFConfig-4.

Rgds,
Lee




-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
