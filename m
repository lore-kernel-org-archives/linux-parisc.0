From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3 experimental debs - patch
Date: Mon, 27 Sep 2004 17:21:35 +0000
Message-ID: <4152E81E00000C00@mail-8-bnl.mail.tiscali.sys>
References: <200409251746.i8PHkdTf006288@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409251746.i8PHkdTf006288@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> 
> > Whish binutils are you using?
> > Duno if it's relevant but I noticed that debian is a rare distro usin=
g
> 2.15
> > while many time it seems that 2.15.91.0.2 is prefered 
> > as
> > <http://www.kernel.org/pub/linux/devel/binutils/release.binutils-2.15=
.91.0.2
> 
> Linux binutils isn't tested on parisc-linux.
hmm fwiw, I try first to rebuild 2.15 deb package but it failed?
Otc with my script, I reach to rebuild 2.15.91.0.2 without pb :)
But with make -k check I encounter 41 FAIL :( (eventhought some seems ok
as far as only build the static lib first)

How to analyse?
How to compare: going forward with CVS or backward with 2.15?

>   If you use this, you are
> adding another organization to the support loop (hjl@lucon.org).  I cou=
ld
> be wrong but I believe that Lu does this work for Intel.
> 
Much more work before anything else I trust ;)

Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en..=
.
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
