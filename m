From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] 2.6.9-bk6-pa4:Tuip driver broken on n4k
Date: Wed, 27 Oct 2004 17:33:34 +0100
Message-ID: <20041027163334.GL3450@parcelfarce.linux.theplanet.co.uk>
References: <41617480000076DA@mail-4-bnl.tiscali.it>
	<41617600000072E0@mail-8-bnl.mail.tiscali.sys>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41617600000072E0@mail-8-bnl.mail.tiscali.sys>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Oct 27, 2004 at 06:29:49PM +0200, Joel Soete wrote:
> I am ongoing to rebuild a 64bit kernel for the b2k.
> (btw: Matthew, i supposed that you are also running a 32bit kernel on you
> c model?)

Yes, I can't get a 64-bit kernel to work.  gcc 3.4 compiled kernels stop
before the console is initialised; gcc 3.3 compiled kernels boot to the
point of displaying a login prompt, but refuse ssh connections and input
on console.

Other people have functional 64-bit kernels compiled with gcc 3.3,
so I don't know what I'm doing wrong.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
