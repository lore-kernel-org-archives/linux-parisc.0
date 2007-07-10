From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Crashed on 2.6.22-rc7, Linus' tree
Date: Tue, 10 Jul 2007 13:12:53 -0400
Message-ID: <1184087573.3401.45.camel__36938.314283225$1416624411$gmane$org@localhost.localdomain>
References: <5b2e36650707100601s50fc0c62k551d387bd755b3cd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Jeff Bailey <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5b2e36650707100601s50fc0c62k551d387bd755b3cd@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2007-07-10 at 09:01 -0400, Jeff Bailey wrote:
> Heya!  I'm running 2.6.22-rc7 from Linus' tree, and I occasionally get
> the system dying like this.  I'm mostly surprised by the complete lack
> of information in the crash, is there anything I can do to ask it to
> give more when it dies?

A register dump with IAOQ and %r2 decoded to the kernel addresses might
(or might not) be helpful.  Given that the interrupt seems to be
advisory (not a machine check) you might have to TOC the box to get
this.  Although, unfortunately, I've seen this several times as the
symptom of A500 flakey HW.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
