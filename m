From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] linux32 personality & config.guess
Date: Tue, 4 Sep 2007 17:48:48 -0400 (EDT)
Message-ID: <200709042148.l84LmnE5017739__17734.959597192$1416624432$gmane$org@hiauly1.hia.nrc.ca>
References: <18141.49656.228645.911768@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <18141.49656.228645.911768@gargle.gargle.HOWL> from "Matthias
	Klose" at Sep 4, 2007 10:37:12 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> With recent 64bit kernels linux32 seems to work,
> 
> $ linux32 uname -m
> parisc
> 
> but
> 
> $ linux32 /usr/share/misc/config.guess
> hppa2.0-unknown-linux-gnu
> 
> which seems to break some configury only knowing about hppa and
> hppa64. Is config.guess correct, and should configure scripts be
> changed?

GCC accepts either parisc or hppa, at least in config.gcc.  I tend
to think the parisc form should be deprecated since no other PA-RISC
targets use it.  The others all use hppa.

With respect to hppa variants, this is a hopeless mess and I don't
believe this can be fixed.  For example, libgmp treats hppa2.0w as
indicating a 64-bit runtime.  I'm sure you have hit this.

Nominally, the first part of the target string represents the
architecture of the kernel, and not the userspace architecture.
This is not sufficient to configure runtime applications when multiple
architectures are supported by one kernel.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
