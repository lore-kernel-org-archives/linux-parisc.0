From: aurel32 <aurelien@aurel32.net>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Thu, 26 Jul 2007 23:34:55 +0200
Message-ID: <20070726213455.GE11851__42882.3778908283$1416624418$gmane$org@hall.aurel32.net>
References: <5b2e36650706110615g20d10f79ue2aa5b11b5fcb185@mail.gmail.com>
	<200707262113.l6QLD8ZB017056@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-15
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200707262113.l6QLD8ZB017056@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jul 26, 2007 at 05:13:07PM -0400, John David Anglin wrote:
> > PIE's don't work on NPTL either, FWIW.
> 
> I did an apt-get upgrade today on one of my systems and noticed
> that portmap is now segfaulting at the same spot as nscd (i.e.,
> in _start).
> 

portmap has been built against libc6-dev 2.5-9 while the PIE fixed
appeared in libc6-dev 2.5-11...

So it need to be rebuilt.

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
