From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: 2.6.10-pa1 compile fails
Date: Mon, 3 Jan 2005 16:45:45 -0700
Message-ID: <20050103234545.GE3277__33280.3168836564$1416624526$gmane$org@colo.lackof.org>
References: <Pine.LNX.4.21.0412291312230.15774-100000@hal.pp.fishpool.fi> <41D2CF5D.3020801@tiscali.be> <20041229154533.GA8376@parcelfarce.linux.theplanet.co.uk> <41D3094B.4060206@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Matthew Wilcox <matthew@wil.cx>,
 Martin-?ric Racine <q-funk@iki.fi>,
 Joel Soete <joel.soete@tiscali.be>,
 debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <41D3094B.4060206@tiscali.be>
Resent-Message-ID: <bqxEeC.A.Z-F.tkd2BB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Wed, Dec 29, 2004 at 07:45:15PM +0000, Joel Soete wrote:
> Taken this into account, I move parport_gsc.h into drivers/parport and 
> remove stuff from parport_gsc.c
> (btw I add a gnu license to parport_gsc.h based on the one of parport_gsc.c 
> ;-)

Committed. I'll roll the -pa number shortly.

grant


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
