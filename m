Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 134594872
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 07:53:01 -0600 (MDT)
To: Kurt Garloff <garloff@suse.de>
Message-ID: <1024667543.3d132f97f3389@webmail.tiscalinet.be>
Date: Fri, 21 Jun 2002 15:52:23 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1024577420.3d11cf8c699d6@webmail.tiscalinet.be> <20020620142736.GA28800@gum01m.etpnet.phys.tue.nl>
In-Reply-To: <20020620142736.GA28800@gum01m.etpnet.phys.tue.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Re: Your patch: root=/dev/scsi/sdcXbXtXuXpX support
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Kurt,

Congratulation and thanks a lot; this patch works fine on my hppa parisc-linux
against a kernel of mine 2.4.19-pre10(-pa37). Very great :))

Joel

PS: I just notice a small detail. In your script you use the variable SDIRMODE
(line 115) but it is not set elsewhere so the mkdir /dev/scsi failled (not
enough argument). (i export SDIRMODE=0755 ?)

Quoting Kurt Garloff <garloff@suse.de>:

> Hi Joël,
> 
> On Thu, Jun 20, 2002 at 02:50:20PM +0200, joel.soete@freebel.net wrote:
> > Hi Kurt,
> > 
> > On lwn.net I found your patch specially interesting because I
> encounter the
> > problem it solves last friday on my parisc-linux box.
> > 
> > I would to test your patch on my parisc-linux box but dono how to find
> back the
> > original patch. Could you send me in answer?
> 
> OK, here we go.
> You need the scsi-map patch as prerequisite for the scsi-map-boot.
> 
> Regards,
> -- 
> Kurt Garloff                   <kurt@garloff.de>         [Eindhoven,
> NL]
> Physics: Plasma simulations    <K.Garloff@TUE.NL>     [TU Eindhoven,
> NL]
> Linux: SCSI, Security          <garloff@suse.de>    [SuSE Nuernberg,
> DE]
>  (See mail header or public key servers for PGP2 and GPG public keys.)
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
