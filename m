From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: [parisc-linux] Re: Feisty and HPPA
Date: Tue, 2 Jan 2007 19:43:45 -0500
Message-ID: <5b2e36650701021643x4e1d721sf558b010d36ed7b6__45069.0643200234$1416624249$gmane$org@mail.gmail.com>
References: <5b2e36650612260750s68a4a19vd83090f5dbe7cff8@mail.gmail.com>
	<119aab440701021637l1c544acfn35a4f3ac93a82a4f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: adam.conrad@ubuntu.com,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440701021637l1c544acfn35a4f3ac93a82a4f@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 02/01/07, Carlos O'Donell <carlos@systemhalted.org> wrote:
> > For those interested in playing along, I'm putting the .deb's that I'm
> > In particular, this features NPTL and TLS, although with 2.6.20-rc2
> > I'm still seeing the glibc failures that Carlos reported on September
> > 6th[0], not the much-reduced set he reported on September 13th[1].
> >
> > [0] http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/030146.html
> > [1] http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/030197.html
>
> This is because [1] is a mistake. In [1] the LWS CAS was disabled and
> I accidentally ran the tests with the non-atomic versions.

Ah, okay.  I'd been hacking assuming that I should be able to
reproduce those results.  At least my setup isn't broken.

BTW, I have a patch for upstream to use the right define for LWS CAS
if you don't have it.  Current libc head doesn't build without it
anymore.

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
