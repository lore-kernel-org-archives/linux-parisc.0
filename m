From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] Crashed on 2.6.22-rc7, Linus' tree
Date: Thu, 12 Jul 2007 10:03:16 -0400
Message-ID: <5b2e36650707120703u4bbf7c32r644dab39a67c75a9__46051.1095625863$1416624409$gmane$org@mail.gmail.com>
References: <5b2e36650707100601s50fc0c62k551d387bd755b3cd@mail.gmail.com>
	<1184087573.3401.45.camel@localhost.localdomain>
	<119aab440707120627p65d4a7a7v9cda67fdc406a9a1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440707120627p65d4a7a7v9cda67fdc406a9a1@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 12/07/07, Carlos O'Donell <carlos@systemhalted.org> wrote:
> On 7/10/07, James Bottomley <James.Bottomley@steeleye.com> wrote:
> > On Tue, 2007-07-10 at 09:01 -0400, Jeff Bailey wrote:
> > > Heya!  I'm running 2.6.22-rc7 from Linus' tree, and I occasionally get
> > > the system dying like this.  I'm mostly surprised by the complete lack
> > > of information in the crash, is there anything I can do to ask it to
> > > give more when it dies?
> >
> > A register dump with IAOQ and %r2 decoded to the kernel addresses might
> > (or might not) be helpful.  Given that the interrupt seems to be
> > advisory (not a machine check) you might have to TOC the box to get
> > this.  Although, unfortunately, I've seen this several times as the
> > symptom of A500 flakey HW.
>
> Right, I saw this failure just before the main board on my A500 died.

Thanks.  I'll try Grant's test, but I'll get my data off that box.
*pout*  Anyway of adding a GSP to a J6700?  I've been using the a500
to make remote rebooting not suck.

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
