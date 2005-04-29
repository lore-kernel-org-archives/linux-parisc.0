From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] head.S: a small typo
Date: Fri, 29 Apr 2005 07:25:55 +0200
Message-ID: <426F252F00001172@mail-4-bnl.tiscali.it>
References: <200504281752.j3SHqBeE005408@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504281752.j3SHqBeE005408@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> -- Original Message --
> To: soete.joel@tiscali.be (Joel Soete)
> Date: Thu, 28 Apr 2005 13:52:11 -0400 (EDT)
> From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
> Cc: grundler@parisc-linux.org, parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] head.S: a small typo
> 
> 
> > mmm is there importance in the order of:
> > 	.align 128
> > 	.text
> > rfi_virt2real:
> 
> Yes, put the .align after the .text.  You want to align the following
> text.
> 
ah my memory is not so bad ;-) (thanks)

> > But I mainly come back here with the fact that 64bit kernel works fin=
e
> while
> > its 32 bit twin panicing on same hw (b2k e.g.):
> > (to test ggg patch I run again my stress loop during about 20h on b2k=

with
> > the 64bit kernel without any pb ;-)
> > 
> > as far as I remember cffc() is only 32bit stuff so this patch would m=
ake
> 
> Yes.  You don't need it in 64-bit code.  Regarding cffc, GCC 4.0
> has a fix as to when canonicalization is done.  In 4.0 and later,
> canonicalization is only done when both sides of are function
> pointers.
> 
Cool, I will so either try to learn more on the status of deb pkg (gcc_sn=
apshot)
or use lfs procedure (just need more patience) ;-)

I will advise obviously :)

Thanks for all,
    Joel
 


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
