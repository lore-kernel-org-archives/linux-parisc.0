From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: linux32 personality & config.guess
Date: Tue, 4 Sep 2007 22:37:12 +0200
Message-ID: <18141.49656.228645.911768__48279.1645489216$1416624431$gmane$org@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <zS1aX.A.fMC.0ec3GB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

With recent 64bit kernels linux32 seems to work,

$ linux32 uname -m
parisc

but

$ linux32 /usr/share/misc/config.guess
hppa2.0-unknown-linux-gnu

which seems to break some configury only knowing about hppa and
hppa64. Is config.guess correct, and should configure scripts be
changed?

  Matthias


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
