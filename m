From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6 upgrade problems
Date: Tue, 18 Jan 2005 09:42:40 +0100
Message-ID: <41DE941B0000346C@mail-6-bnl.tiscali.it>
References: <Pine.LNX.4.58.0501171612030.4060@brain.fop.ns.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Steve Bromwich" <hppa@fop.ns.ca>,
 "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0501171612030.4060@brain.fop.ns.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> 
> Attachment: dmesg
> 
[...]
scsi0: 53c710 rev 2 
scsi0 : LASI SCSI 53c700
[...]
I also encounter some pb with this driver on my c110 :-(
But I don't yet reach to know if my pb is hw or sw?
HP ODE tool didn't report any errors (even thought it's only a reading te=
st?)
I try to figure out if its firmware is uptodate but no luck :-(

and finaly the pb (a dd strees test) occures as well in 2.6 and 2.4 too 

Sorry also because I don't yet find more time (on this system it's not th=
e
main scsi-ctrl ;) to investigate more.
(I just noticed that some changes was recently bring to related ncr scrip=
ts
in openbsd driver but unfortunately I have not yet enough clue to help mo=
re)

Joel

-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
