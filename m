From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] 2.6.10-rc2-pa2 build failing
Date: Mon, 13 Dec 2004 04:41:53 +0000
Message-ID: <20041213044153.GD27199@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.58.0412031551120.3169@rray.drdc.mstc.ms.gov>
	<20041204190201.GC30126@colo.lackof.org>
	<Pine.LNX.4.58.0412060817380.21506@rray.drdc.mstc.ms.gov>
	<20041210192835.GF6653@colo.lackof.org>
	<41BADB3C.8000602@tiscali.be> <41BAE2D5.4010201@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: rray@tcmail.mstc.state.ms.us,
 parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41BAE2D5.4010201@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Dec 11, 2004 at 12:06:45PM +0000, Joel Soete wrote:
> >A K200 iirc?
> 
> Sorry for auto-reply but I go back to your previous mail and compare your 
> config file with mine and noticed some details:
> 
> 1) may be you need hppb bus option ON; the diff shows me:
> --- k200-hp-debian-1_config	2004-12-11 12:38:46.307780990 +0100
> +++ config-2.6.10-rc3-pa5	2004-12-11 12:36:59.434552100 +0100
> [...]
> -# CONFIG_HPPB is not set
> +CONFIG_HPPB=y

Shouldn't make any difference; the ncr720 is on the GSC bus.
http://www.openpa.net/systems/hawk.html shows the K class does have HPPB
slots, so I would suggest that you both have the HPPB option set wrongly;
there is no HPPB on the C class workstations, but there is for K class.

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
