From: Randolph Chung <tausq@debian.org>
Subject: Support for 2.4.x kernels on hppa
Date: Mon, 24 May 2004 11:32:27 -0700
Message-ID: <20040524183227.GW7207__28676.1076808491$1416623450$gmane$org@tausq.org>
Reply-To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <BhLjjC.A.JHC.a_jsAB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

Hi all,

I'd like to take an informal "survey" of what kernel versions people are
using....

For the last year or two, most of the kernel developers have been
focusing on the 2.5/2.6 kernels; as a result many bugs that were
presented in both 2.4 and 2.6 kernels have been only fixed in 2.6. This
is understandable given that there are only a few active parisc-linux
kernel developers.... moving foward it is becoming more difficult to
support the 2.4.x kernels, and we are finding that we need to put in
some not-so-nice workarounds in some userspace tools to cope with bugs
in the 2.4 kernel.

So, the question is, how many of you run parisc-linux on 2.4
"production" systems and "cannot" switch to 2.6? At last count there are
about 1200 registered parisc-linux users on the p-l website, and i know
at least some folks run parisc-linux on decent-sized clusters... so we 
definitely don't want to break things if people are using 2.4 actively 
on these systems and have legitimate reasons not to move to 2.6....

If you are one of those people who really care about 2.4 support, please
speak up now! 

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
