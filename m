From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] Support for 2.4.x kernels on hppa
Date: Mon, 24 May 2004 12:40:32 -0700
Message-ID: <20040524194032.GZ7207__35830.0476022579$1416623451$gmane$org@tausq.org>
References: <20040524183227.GW7207@tausq.org> <200405241937.i4OJbX07011585@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200405241937.i4OJbX07011585@hiauly1.hia.nrc.ca>
Resent-Message-ID: <pSylPD.A.2NG.0-ksAB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

> Here is a little background on this issue.  Randolph has done a
> considerable amount of work to port libffi to the PA, and then add
> unwind and other support support to libjava.  This gives us a
> working Java implementation.  Thanks, Randolph!

you are welcome.

it's not just gcc though; gdb has almost the same bits of signal
unwinding code so it has the same issues. there are also other instances
where things are working in 2.6 but not in 2.4 (especially with all the
compat work for 32-bit userspace/64-bit kernel that has gone into 2.6).

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
