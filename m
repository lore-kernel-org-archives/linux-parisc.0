From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Mon, 19 Dec 2005 17:07:17 +0000
Message-ID: <20051219170717.GA1464__32683.0016951591$1416624577$gmane$org@ntlworld.com>
References: <43971676.1010009@gmail.com> <1354.193.160.141.5.1134039392.squirrel@www.puszczka.com> <20051208173922.GA2515@ntlworld.com> <200512191639.44027.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Helge Deller <deller@dmx.de>,
 Andy Walker <andy@puszczka.com>
To: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200512191639.44027.deller@gmx.de>
Resent-Message-ID: <WHo-9D.A.M-H.IjupDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Mon, Dec 19, 2005 at 04:39:43PM +0100, Helge Deller wrote:
> Hi all,
> 
> I just committed a patch to stifb in kernel 2.6.15-rc6-pa1.
> Could you please try this one? It works for me... :-)
> 
> Stuart's hint with starting X and then switching back again pointed to
> a bug in the palette handling of stifb, which I hopefully fixed now.

Ooh!  I'll test this...  Unfortunately, I'm compiling on a 715/100 so
bear with me for a moment. :)

> X11 still only shows me 3/4 of the screen, but this seems to be
> another problem....

Max Grabert found the fix for that... put "DefaultFbBpp 32" in the
"Screen" section of your xorg.conf file.  I'm not sure if that's a bug
in stifb or not.  If not, perhaps you could argue that there's a bug in
xorg or the framebuffer code.

Cheers,
-- 
Stuart Brady


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
