From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Thu, 03 May 2007 15:06:00 +0200
Message-ID: <4639DE38.3000108__40671.6959587813$1416624348$gmane$org@aurel32.net>
References: <119aab440705021021i35132820we4338ae3ca1862cd@mail.gmail.com>	<200705021815.l42IFqYS018776@hiauly1.hia.nrc.ca>
	<5b2e36650705030552l100c7ecayfc848248aac679c9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Jeff Bailey <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5b2e36650705030552l100c7ecayfc848248aac679c9@mail.gmail.com>
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
> To work around the gcc pic/tls bug, I'm using this patch:
> http://people.ubuntu.com/~jbailey/hppa-caller-save-pic-tls.dpatch
> 

I have also made a patch to fix the problem that seems to work
correctly. I have posted it to gcc-patches, you can also find it as a
dpatch on http://temp.aurel32.net/hppa-caller-save-pic-tls.dpatch

My machine is too slow to build a glibc (I am doing my gcc tests on
paer.d.o). Would it be possible to do the same tests with my patch?

Thanks,
Aurelien

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
