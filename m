From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Fri, 04 May 2007 01:54:54 +0200
Message-ID: <463A764E.4030606__20518.3060760193$1416624350$gmane$org@aurel32.net>
References: <119aab440705021021i35132820we4338ae3ca1862cd@mail.gmail.com>	
	<200705021815.l42IFqYS018776@hiauly1.hia.nrc.ca>	
	<5b2e36650705030552l100c7ecayfc848248aac679c9@mail.gmail.com>	
	<4639DE38.3000108@aurel32.net>
	<7d01f9f00705031039v20fafffcyf701f8a50cede9e0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8
Cc: parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00705031039v20fafffcyf701f8a50cede9e0@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Thibaut VARENE a écrit :
> On 5/3/07, Aurelien Jarno <aurelien@aurel32.net> wrote:
> 
>> My machine is too slow to build a glibc (I am doing my gcc tests on
>> paer.d.o). Would it be possible to do the same tests with my patch?
> 
> Hi Aurelien
> 
> If you need access to fast hppa machines, I can fix that ;)
> 

Actually I need a fast hppa machine where I can install packages that I
have just built (like a new gcc). But that case is very rare, and
paer.d.o is enough in most cases. Thanks anyway.

Bye,
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
