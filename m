From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] Glibc maintainers sought for m68k, hppa
Date: Tue, 11 Apr 2006 07:12:46 +0200
Message-ID: <443B3ACE.7040009__48435.2102074355$1416624051$gmane$org@aurel32.net>
References: <20060410131631.GA21246@nevyn.them.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org,
 debian-glibc@lists.debian.org
To: Daniel Jacobowitz <dan@debian.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20060410131631.GA21246@nevyn.them.org>
Resent-Message-ID: <FFEfmD.A.Yf.nrzOEB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

[Cc:ing parisc-linux as interested people are there]

Hi!

Daniel Jacobowitz wrote:
> In the upstream glibc repository, both M68K and HPPA ports have been
> moved into the separate "ports" repository.  This means two things:
> 
>   - The core glibc maintainers will not update them when sweeping
>     changes are made.  This was already the case; they're just making
>     it clearer.
> 
>   - ACLs can be set up to allow a port maintainer to directly modify
>     ports files.
> 
> I'm already covering two other ports, so I refuse to pick up two more
> "orphans".  If you want continuing glibc support for these
> architectures, I think we need to find developers interested in
> maintaining them in the upstream trees.  I can point interested folks
> at some of the recent changes which need to be synched to their ports,
> but I'm not going to continue keeping a list much longer.
> 
> M68k in particular needs some loving.  New versions of glibc will not
> build without TLS support; whether or not you go to full NPTL support
> (which I highly recommend), you need to implement TLS.  It's not too
> hard, really.  And it's long overdue.
> 
> Any takers?
> 

For the HPPA port, guys from parisc-linux are doing very good job for 
both the kernel and the glibc. If I am right some of them (at least 
Carlos) have commit access to the CVS for HPPA.

Having write access to the Debian SVN, having an HPPA machine and 
reading debian-hppa, parisc-linux and libc-ports mailing-lists, I think 
I can work on merging the necessary patches to support HPPA in the 
Debian glibc.

Bye,
Aurelien

-- 
   .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
  : :' :  Debian developer           | Electrical Engineer
  `. `'   aurel32@debian.org         | aurelien@aurel32.net
    `-    people.debian.org/~aurel32 | www.aurel32.net


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
