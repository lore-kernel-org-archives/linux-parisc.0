From: Christopher Strong <strong@cs.utah.edu>
Subject: HPPA autofs broken?
Date: Thu, 24 Feb 2005 18:39:51 -0700 (MST)
Message-ID: <Pine.LNX.4.43L0.0502241828350.14272-100000__36061.0135518529$1416623678$gmane$org@charity.cs.utah.edu>
References: <FHEGKPBPFFGIFBGOANOKCENEEPAA.h.cochran@comcast.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org,
 <debian-hppa@lists.debian.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <FHEGKPBPFFGIFBGOANOKCENEEPAA.h.cochran@comcast.net>
Resent-Message-ID: <2T0RYB.A.ZEB.uHoHCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>


I just upgraded my autofs (using apt-get upgrade) and autofs will no longer
start.  I beat my head against it for a while, upgraded to the newest modutils,
even tried the beta autofs packages but to no avail.

It *used* to work before the "upgrade" and I don't know if I have some errors
in my config file (under the new version) or if there is a problem with the
autofs package.

Here are the errors I am getting:

==> daemon.log <==
Feb 24 18:25:15 trinsic automount[1152]: failed to load map, exiting
Feb 24 18:25:15 trinsic automount[1215]: failed to load map, exiting

I get the same errors in syslog and daemon.log, one error per entry in the
autofs.master file.

My auto.master file:

----------------------------------------

trinsic:~# cat /etc/auto.master
/home                    yp     auto_home       nfsvers=2
/uusoc/facility          yp     auto_facility   nfsvers=2
/uusoc/scratch           yp     auto_scratch

----------------------------------------

Seems fairly simple to me.  It's the one we run on all of our other Linux
boxes.

Any ideas?  I've spent a couple hours on it...found several issues and fixed
them, but nothing seems to help this problem.

I found debian bug 292981 on a similar topic:

http://lists.debian.org/debian-qa-packages/2004/12/msg00123.html

So I upgraded to the newest unstable package
(autofs_4.1.3+4.1.4beta2-3_hppa.deb), but it did not help.

-Chris




-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
