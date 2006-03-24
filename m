From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] a small hunk to cleanup 2 build warning?
Date: Fri, 24 Mar 2006 18:39:35 +0100
Message-ID: <IWN7PZ$E1AD0CBF1F1F1B2D7DEBD61F32B5E56D@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "deller" <deller@gmx.de>,
 "parisc-linux" <parisc-linux@lists.parisc-linux.org>
To: "grundler" <grundler@parisc-linux.org>
Return-Path: <soete.joel@tiscali.be>
List-ID: <linux-parisc.vger.kernel.org>

> On Fri, Mar 24, 2006 at 05:58:27PM +0100, Helge Deller wrote:
> > Since I don't think we will push the changes you propose to 2.6.16 in=

> > the file compat_siginfo.h upstream (since it has been fixed different=
ly),
Ah interesting, I try it first in compat.h but complaining about 'struct
compat_sigevent' not define, that will may be learn me more about C ;-)
 
> > I think it's easier to just stick with this small warning at the mome=
nt.
> > If others here think differently just go ahead...
> 
> I agree. If it's already fixed upstream, I can live with the warning fo=
r now.
> 
Oh yes, just a suggestion in case that gcc could confuse stuff and may be=

related to 'Bug' encountered recently. 

Tx a lot for feedback,
    Joel=0A=0A-------------------------------------------------------=0AN=
OTE! My email address is changing to ... @scarlet.be=0APlease make the ne=
cessary changes in your address book. =0A=0A
