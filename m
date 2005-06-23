From: Kyle McMartin <kyle@there.is.no.cabal.ca>
Subject: Re: [parisc-linux] new debian binutils-hppa64, r=2.15-7 pb?
Date: Thu, 23 Jun 2005 08:10:19 -0400
Message-ID: <20050623121019.GM14502__45519.0920773477$1416623813$gmane$org@roadwarrior.mcmartin.ca>
References: <17081.52770.365946.52496@gargle.gargle.HOWL> <200506230342.j5N3gOte019236@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Matthias Klose <doko@cs.tu-berlin.de>,
 soete.joel@tiscali.be,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200506230342.j5N3gOte019236@hiauly1.hia.nrc.ca>
Resent-Message-ID: <NNOmWD.A.4SH.jsquCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Wed, Jun 22, 2005 at 11:42:23PM -0400, John David Anglin wrote:
> gcc-3.4.  It only seems to install the 64-bit compiler driver:
> 
> /usr/bin/hppa64-linux-gcc-3.4
> 
> I also haven't seen 4.0.0 yet.

I believe this is because the gcc-defaults package is currently 
set for the sarge default, which means gcc 3.3. I imagine a new
upload is coming soon that will change the default compiler
to 3.4 or 4.0 soon.

Cheers,
-- 
Kyle McMartin


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
