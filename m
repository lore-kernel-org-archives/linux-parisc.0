From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Re: 2.6.10-pa1 compile fails
Date: Tue, 4 Jan 2005 00:42:52 +0000
Message-ID: <20050104004252.GP18080__22249.2226552733$1416624526$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <20050103234545.GE3277@colo.lackof.org> <Pine.LNX.4.21.0501040235360.2622-100000@hal.pp.fishpool.fi>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: Grant Grundler <grundler@parisc-linux.org>,
 debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: =?iso-8859-1?Q?Martin-=C9ric?= Racine <q-funk@iki.fi>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <Pine.LNX.4.21.0501040235360.2622-100000@hal.pp.fishpool.fi>
Resent-Message-ID: <qzpGgD.A.8g.pqe2BB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Tue, Jan 04, 2005 at 02:37:29AM +0200, Martin-Éric Racine wrote:
> Silly question but well:  
> 
> Would this source file shuffling perhaps also require massaging the dependencies
> in the kernel configuration scripts?

The Linux build system has "always" (at least as far back as 2.0 anyway)
automatically generated dependencies for each file, it's not like, eg gdb.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
