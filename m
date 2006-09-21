From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] the 53c700 driver pb on c110/d380
Date: Thu, 21 Sep 2006 09:58:13 +0200
Message-ID: <J5XNH1$569ECF73DD1D392C7A9410B9077DDA0C@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "James.Bottomley" <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Fri, 2006-09-15 at 11:10 +0000, Joel Soete wrote:
> > Aug 26 07:37:48 patst007 kernel: scsi3: (3:0) phase mismatch at 01e8,=

> > phase IO CD MSG BSY REQ MSG IN
> 
> 1e8 is 	at
> 
> MOVE	CommandCount, CommandAddress, WHEN CMD
> 
> What this means is that the device transitioned away from the command
> phase while the host still had bytes to send.  i.e. the host and device=

> disagree on how long some command should be.  Thus, either the device i=
s
> buggy, or someone sent a command via sg with an incorrect length.
> 
Thanks.

Btw I grab the disk with its scsi terminator and scsi cable to connect it=
 on a
b180 (using also scsi1: 53c710 rev 2) and ran the test loop for now more =
then
17h without any kind of pb ;-)

May I supposed that there is no hw with scsi disk.

That said the kernel used the same drivers for the same kind of hba, and =
afaik
the big diff between this b180 and other c110/d380 is the ccio runaway bu=
s
ctrlr. May I so reasonably thougt that the pb came from the ccio-dma driv=
er?
But where should it be located?

Thanks again,
    Joel

> James
> 
> 
> =0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devenez =
aujourd'hui Scarlet One grace a un client existant de Scarlet, vous recev=
ez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur http=
://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
