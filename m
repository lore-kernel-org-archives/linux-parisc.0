From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Infinite error message from SDC driver on install
Date: Tue, 12 Jul 2005 08:16:28 +0200
Message-ID: <42BAE7C300004F28@mail-5-bnl.tiscali.it>
References: <20050711195440.GD2170@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Kyle McMartin" <kyle@mcmartin.ca>,
 "Kurt Fitzner" <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050711195440.GD2170@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Kyle,
> 
> On Sat, Jul 09, 2005 at 03:50:04PM -0600, Kurt Fitzner wrote:
> > "HP SDC MLC: Registering the System Domain Controller's HIL MLC."
> > 
> 
> I don't suppose you could investigate further? (TOC the machine, 
> lookup where it's hung, see the howto on parisc-linux.org). 
> 
> All the d-i images tested fine on my B180, which is a fairly close
> match to your B132...
> 
mmm not exactely: there was actualy 2 b132 models i.e. B132L and B132L+
and <http://www.openpa.net/systems/b-class.html> rememmber me the major d=
iff
imho:
[...]
Chipset

[...]
# B132L, B160L: NCR 53C720 16-bit Fast-wide high voltage differential (HV=
D)
SCSI-2
# B132L+, B180L+: Symbios Logic 53C875 16-bit Ultra-wide SCSI-2 controlle=
r

Unfortunately, I couldn't test here because no B132L around.

Hth,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
