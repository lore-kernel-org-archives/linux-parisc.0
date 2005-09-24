From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] binutils breaks hppa kernel build,
Date: Sat, 24 Sep 2005 13:06:48 -0600
Message-ID: <20050924190648.GD7824__14908.2773401917$1416623924$gmane$org@colo.lackof.org>
References: <1127580340.10496.7.camel@localhost>
	<200509241733.j8OHXHRM001100@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: 329888@bugs.debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200509241733.j8OHXHRM001100@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Sep 24, 2005 at 01:33:15PM -0400, John David Anglin wrote:
> > As discussed on irc:
> > http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=329888
> 
> This is a debian issue as far a I can tell.  I tried
> 
>       fic,m           %r23(%sr3,%r26)
> 
> with GNU assembler 2.16.91 20050814 and I don't see a problem.

You are right - debian has a stale include file.
The picked up this version of the opcode/hppa.h file:
http://sourceware.org/cgi-bin/cvsweb.cgi/src/include/opcode/hppa.h.diff?r1=1.55&r2=1.56&cvsroot=src&f=h

Debian needs to pick up the TOB opcode/hppa.h and life will be good again.

thanks,
grant

> However, I do see that we don't support the 2-bit space register
> form (PA 2.0).
> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
