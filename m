From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Thu, 05 Jul 2007 18:57:14 +0200
Message-ID: <468D22EA.7000405__2301.90168736062$1416624403$gmane$org@aurel32.net>
References: <20070705142222.GA26105@frankengul.org>	
	<200707051518.l65FI56n006476@hiauly1.hia.nrc.ca>
	<5b2e36650707050824ud041452reb3c017d85b155dc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Jeff Bailey <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5b2e36650707050824ud041452reb3c017d85b155dc@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

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
> 

On the other hand, the LinuxThreads build on other architectures are
still fine even with the latest gcc in Debian.

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
