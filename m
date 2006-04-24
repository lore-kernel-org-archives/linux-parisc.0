From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Re: Added clobbers to unaligned.c and uaccess.h
Date: Mon, 24 Apr 2006 12:54:41 -0400
Message-ID: <119aab440604240954y58dde658g4c84ca153cacb265@mail.gmail.com>
References: <IY8K1U$8FE099F66A8462E832C7AFDC38E1A3E1@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Joel Soete" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IY8K1U$8FE099F66A8462E832C7AFDC38E1A3E1@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 4/24/06, Joel Soete <soete.joel@tiscali.be> wrote:
> > Joel,
> >
> > Patch to add the extra clobbers checked into CVS.
> > Thanks for all the work!
> >
> No, sincerely thanks for your help.
>
> > What's your next project? ;-)
> >
> No clue for the moment: I very need some break but a lot of idea:
>     * glibc float nan values pb?

This would be an excellent project. We have various floating point
problems that I haven't invetigated. The math tests in glibc are the
first place to start work.

Dave might have other project recommendations.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
