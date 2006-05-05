From: Aurelien Jarno <aurel32@debian.org>
Subject: Re: Bug#364231: [parisc-linux] Re: Bug#364231: exception catching
Date: Fri, 05 May 2006 05:48:12 +0200
Message-ID: <445ACAFC.2060307__4599.89350424639$1416624081$gmane$org@debian.org>
References: <20060501025703.GL18891@mauritius.dodds.net>	<200605011356.k41DugMD023580@hiauly1.hia.nrc.ca>
	<17495.20549.807070.229385@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 364231@bugs.debian.org,
 Steve Langasek <vorlon@debian.org>,
 steven.robbins@videotron.ca,
 debian-hppa@lists.debian.org,
 debian-glibc@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Matthias Klose <doko@cs.tu-berlin.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <17495.20549.807070.229385@gargle.gargle.HOWL>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Matthias Klose wrote:
> [should we drop parisc-linux?]
> 
> John David Anglin writes:
>>> Er, no; we're talking about official Debian packages here, and the
>>> libstdc++.so.6 in Debian is now from gcc-4.1.  The problem is precisely that
>>> GMP *is* being built using gcc-4.0, but libstdc++ is from gcc-4.1, resulting
>>> in the double libgcc_s problem.
>> Then, you must build *eveything* for hppa with gcc-4.1 or later.
>>
>> Unfortunately, there's an ABI break.  Mixing libraries compiled with
>> 4.0 or earlier with libraries compiled with 4.1 or later is just going
>> to cause unnecessary problems.   3.3 uses libstdc++.so.5, so you
>> avoid the double libgcc_s problem building GMP.  However, you still
>> have the ABI change affecting the passing and return of complex types.
>>
>> At a fundamental level, libstdc++.so.6, libgfortran.so.1.0.0 and any
>> other gcc libraries built with 4.1 or later need glibc built with 4.1
>> to function correctly because of the various complex functions in
>> the math library.
>>
>> I think there's a dynamic loader bug here as well.  I'm just
>> guessing but I think the double libgcc_s problem causes a problem
>> with the handling of .eh_frame data.
> 
> 
> Ok, coming back to the question of the system compiler on hppa for
> etch. Assuming that hppa does want to do that:
> 
> - is glibc buildable with gcc-4.1 on hppa?

Yes, and it seems to works nicely. People who want to try can fetch .deb 
from http://people.debian.org/~aurel32/hppa/

-- 
   .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
  : :' :  Debian developer           | Electrical Engineer
  `. `'   aurel32@debian.org         | aurelien@aurel32.net
    `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
