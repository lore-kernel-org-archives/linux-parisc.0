From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Tue, 10 Jul 2007 06:08:21 +0200
Message-ID: <46930635.7040208__45338.1202686161$1416624410$gmane$org@aurel32.net>
References: <20070705142222.GA26105@frankengul.org>	<200707051518.l65FI56n006476@hiauly1.hia.nrc.ca> <5b2e36650707050824ud041452reb3c017d85b155dc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Jeff Bailey <jbailey@raspberryginger.com>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <5b2e36650707050824ud041452reb3c017d85b155dc@mail.gmail.com>
Resent-Message-ID: <m-Cr2D.A.3_G.CawkGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Jeff Bailey a écrit :
> On 05/07/07, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
>>>> Could you do glibc builds with the gcc trunk before and after the change?
>>>> It's best to base the PR on an unmodified version of gcc.
>>> The test with the gcc-trunk (Main 4.3.0 head) shows the same error at the same place.
>> Ok, it would be useful to file a gcc PR to start.  However, it's not
>> clear that gcc is a fault.
>>
>> It may be that glibc isn't using the visibility attribute correctly
>> for this symbol (i.e., hiding a symbol that is externally referenced).
>> You could try building glibc with the attribute removed.  This might
>> be somewhat hppa specific because of the nptl issue.
> 
> As long as LinuxThreads isn't built, this problem doesn't come up.  It
> seems very likely that it's a glibc problem, then.  The Ubuntu builds
> are NPTL-only and don't show this problem.

NPTL does not use this symbol at all, that's why the problem does not
appear.

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
