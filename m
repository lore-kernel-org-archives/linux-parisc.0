From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.9-bk6-pa4:Tuip driver broken on n4k
Date: Wed, 27 Oct 2004 18:46:30 +0200
Message-ID: <41617600000072F3@mail-8-bnl.mail.tiscali.sys>
References: <20041027163334.GL3450@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041027163334.GL3450@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Wed, Oct 27, 2004 at 06:29:49PM +0200, Joel Soete wrote:
> > I am ongoing to rebuild a 64bit kernel for the b2k.
Well it boot fine:
the printk linux_banner being:
Linux version 2.6.9-bk6-pa5-b2k64 (root@patst005) (gcc version 3.0.4) #2
Wed Oct 27 18:27:54 CEST 2004

and from a ssh connection:
jso@patst005:~$ uname -a
Linux patst005 2.6.9-bk6-pa5-b2k64 #2 Wed Oct 27 18:27:54 CEST 2004 paris=
c64
GNU/Linux

So the pb is else where, definitively I need this lanconsole connection
to grab more easily a piminfo in the hope to get a better starting point
;)

> > (btw: Matthew, i supposed that you are also running a 32bit kernel on=

you
> > c model?)
> 
> Yes, I can't get a 64-bit kernel to work.  gcc 3.4 compiled kernels sto=
p
> before the console is initialised; gcc 3.3 compiled kernels boot to the=

> point of displaying a login prompt, but refuse ssh connections and inpu=
t
> on console.
> 
Well for the two systems I still used (may be outdated but still usefull)=

gcc-3.0

> Other people have functional 64-bit kernels compiled with gcc 3.3,
> so I don't know what I'm doing wrong.
> 
Unfortunately I couldn't help on this matter :(

Thanks again,
    Joel



-------------------------------------------------------------------------=
--
Tiscali ADSL GO & Light, 2 mois gratuits, profitez-en...
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
