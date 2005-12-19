From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Mon, 19 Dec 2005 20:30:48 +0000
Message-ID: <20051219203048.GA2197__8502.06701220504$1416624578$gmane$org@ntlworld.com>
References: <43971676.1010009@gmail.com>
	<1354.193.160.141.5.1134039392.squirrel@www.puszczka.com>
	<20051208173922.GA2515@ntlworld.com>
	<200512191639.44027.deller@gmx.de>
	<20051219170717.GA1464@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org,
 Helge Deller <deller@dmx.de>,
 Andy Walker <andy@puszczka.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051219170717.GA1464@ntlworld.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 19, 2005 at 05:07:17PM +0000, Stuart Brady wrote:
> On Mon, Dec 19, 2005 at 04:39:43PM +0100, Helge Deller wrote:
> > Hi all,
> > 
> > I just committed a patch to stifb in kernel 2.6.15-rc6-pa1.
> > Could you please try this one? It works for me... :-)
> > 
> > Stuart's hint with starting X and then switching back again pointed to
> > a bug in the palette handling of stifb, which I hopefully fixed now.
> 
> Ooh!  I'll test this...  Unfortunately, I'm compiling on a 715/100 so
> bear with me for a moment. :)

Seems to work fine... except for a few black patches on Tux's feet.

I've tested using:

for n in 0 1; do
	for m in 0 4 1 5 2 6 3 7; do
		echo -e "\033[${n};3${m}mTesting\033[m"
	done
done

Works as expected.
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
