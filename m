From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: RFC: Updating hppa kernel-image packages
Date: Tue, 22 Mar 2005 21:04:54 +0000
Message-ID: <20050322210454.GH21986__48471.6326617219$1416623707$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <20050322204751.GC26941@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org,
 debian-kernel@lists.debian.org
To: Kyle McMartin <kyle@debian.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20050322204751.GC26941@roadwarrior.mcmartin.ca>
Resent-Message-ID: <3avAiC.A.R2H.zxIQCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Tue, Mar 22, 2005 at 03:47:51PM -0500, Kyle McMartin wrote:
> This is basically a call for suggestions for what I should backmerge
> to 2.6.8 from recent CVS. I will go through the parisc-linux-cvs archive
> again and try to pull what I can see, but I'd like a bit of help.

In case it wasn't already abundently clear, I'd like you to NOT backport
the IRQ changes.  I think they're stable now, but we don't have time to
fix any resulting bugs before Sarge.

> To help keep the lives of the debian-installer folks sane, I'm not
> going to honour suggestions to turn on/off various drivers, unless
> I get an explicit ok.

I'd like to be sure that the resulting images are suitable for booting
on all the machines that ought to work.  Here's a list of suitable test
machines and notes of what they have:

 - 712 (LASI serial, net and scsi)
 - C3000 (SBA, SuckyIO serial, ns87415 ide, sym2 scsi, Tulip net)
 - K450 (Mux serial, CCIO, zalon scsi, LASI net)
 - A500 (64-bit, SBA, sym2 scsi, Tulip net)

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
